package com.bullbitcoin.onion;

import android.content.Context;

import androidx.annotation.NonNull;

import java.io.File;

import IPtProxy.Controller;
import IPtProxy.IPtProxy;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/** Starts the process-wide IPtProxy Snowflake client used by Arti. */
public final class OnionPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler {
    private static final String CHANNEL = "com.bullbitcoin.onion/snowflake";
    private static final Object LOCK = new Object();

    private static Controller controller;
    private static int leases;

    private MethodChannel channel;
    private Context context;
    private boolean acquired;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        context = binding.getApplicationContext();
        channel = new MethodChannel(binding.getBinaryMessenger(), CHANNEL);
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        switch (call.method) {
            case "start":
                start(result);
                break;
            case "stop":
                release();
                result.success(null);
                break;
            case "version":
                result.success(IPtProxy.snowflakeVersion());
                break;
            default:
                result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        release();
        channel = null;
        context = null;
    }

    private void start(MethodChannel.Result result) {
        synchronized (LOCK) {
            if (acquired) {
                final long port = controller == null ? 0 : controller.port(IPtProxy.Snowflake);
                if (isValidPort(port)) {
                    result.success(port);
                } else {
                    result.error("snowflake_not_running", "Snowflake is not running", null);
                }
                return;
            }

            try {
                if (controller == null) {
                    final File stateDir = new File(context.getNoBackupFilesDir(), "onion_pt");
                    if (!stateDir.exists() && !stateDir.mkdirs()) {
                        result.error("snowflake_storage", "Snowflake storage is unavailable", null);
                        return;
                    }

                    final Controller candidate = new Controller(
                            stateDir.getAbsolutePath(),
                            false,
                            false,
                            "ERROR",
                            null
                    );
                    candidate.start(IPtProxy.Snowflake, "");
                    final long port = candidate.port(IPtProxy.Snowflake);
                    if (!isValidPort(port)) {
                        candidate.stop(IPtProxy.Snowflake);
                        result.error("snowflake_start_failed", "Snowflake did not bind a local port", null);
                        return;
                    }
                    controller = candidate;
                }

                final long port = controller.port(IPtProxy.Snowflake);
                if (!isValidPort(port)) {
                    result.error("snowflake_not_running", "Snowflake is not running", null);
                    return;
                }
                leases++;
                acquired = true;
                result.success(port);
            } catch (Exception ignored) {
                // Nobody holds a lease, so this controller is ours to discard.
                // Dropping the reference without stopping it would leave the
                // Snowflake proxy running for the life of the process, with no
                // way left to reach it.
                if (leases == 0) {
                    stopQuietly(controller);
                    controller = null;
                }
                result.error("snowflake_start_failed", "Snowflake could not be started", null);
            }
        }
    }

    private void release() {
        synchronized (LOCK) {
            if (!acquired) {
                return;
            }
            acquired = false;
            leases--;
            if (leases == 0) {
                stopQuietly(controller);
                controller = null;
            }
        }
    }

    /** Teardown is best-effort: it runs during engine detachment and on the failed-start path. */
    private static void stopQuietly(Controller candidate) {
        if (candidate == null) {
            return;
        }
        try {
            candidate.stop(IPtProxy.Snowflake);
        } catch (Exception ignored) {
            // Nothing left to do; the reference is dropped either way.
        }
    }

    private static boolean isValidPort(long port) {
        return port > 0 && port <= 65535;
    }
}

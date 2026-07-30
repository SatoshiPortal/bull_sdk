#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint onion.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'onion'
  s.version          = '0.1.0'
  s.summary          = 'Embedded Tor client and loopback SOCKS5 proxy.'
  s.description      = <<-DESC
Embedded Tor client and loopback SOCKS5 proxy for Bull Bitcoin, built on Arti.
                       DESC
  s.homepage         = 'https://github.com/SatoshiPortal/bull_sdk'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Satoshi Portal' => 'https://bullbitcoin.com' }
  s.module_name      = 'onion'

  # The dummy C file makes CocoaPods create a framework for the Rust archive.
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'IPtProxy', '5.5.1'
  s.platform = :ios, '15.0'

  s.swift_version = '5.0'

  s.script_phase = {
    :name => 'Build Rust library',
    # First argument is relative path to the `rust` folder, second is name of rust library
    :script => <<-SCRIPT,
set -eu
case "$PLATFORM_NAME" in
  iphonesimulator*)
    iptproxy_binary="$PODS_ROOT/IPtProxy/IPtProxy.xcframework/ios-arm64_x86_64-simulator/IPtProxy.framework/IPtProxy"
    expected_sha256="7c40beb176d71c0ad190abf747d49a003269ab559f7fe3b4c2155ea4b9f37cab"
    ;;
  *)
    iptproxy_binary="$PODS_ROOT/IPtProxy/IPtProxy.xcframework/ios-arm64/IPtProxy.framework/IPtProxy"
    expected_sha256="59acdfc3bc9f272ea2370195053ef1548106d1b687960c3c2d70c2edb33a1495"
    ;;
esac
actual_sha256="$(shasum -a 256 "$iptproxy_binary" | cut -d ' ' -f 1)"
if [ "$actual_sha256" != "$expected_sha256" ]; then
  echo "IPtProxy binary checksum mismatch: $actual_sha256" >&2
  exit 1
fi
sh "$PODS_TARGET_SRCROOT/../cargokit/build_pod.sh" ../rust onion
    SCRIPT
    :execution_position => :before_compile,
    :input_files => ['${BUILT_PRODUCTS_DIR}/cargokit_phony'],
    # Let XCode know that the static library referenced in -force_load below is
    # created by this build step.
    :output_files => ["${PODS_CONFIGURATION_BUILD_DIR}/onion/libonion.a"],
  }
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    # Flutter.framework does not contain a i386 slice.
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386',
    'OTHER_LDFLAGS' => '-force_load ${PODS_CONFIGURATION_BUILD_DIR}/onion/libonion.a',
  }
end

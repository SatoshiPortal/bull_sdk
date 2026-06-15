import 'package:flutter/material.dart';
import 'package:flutter_zxing/flutter_zxing.dart';
import 'package:satoshifier/satoshifier.dart';

class SatoshifierScannerWidget extends StatelessWidget {
  const SatoshifierScannerWidget({
    super.key,
    required this.onScan,
    // this.onMultiScan,
    // this.onMultiScanFailure,
    // this.onControllerCreated,
    // this.onMultiScanModeChanged,
    // this.isMultiScan = false,
    // this.multiScanModeAlignment = Alignment.bottomRight,
    // this.multiScanModePadding = const EdgeInsets.all(10),
    this.codeFormat = Format.any,
    this.tryHarder = false,
    this.tryInverted = false,
    this.tryRotate = true,
    this.tryDownscale = false,
    this.maxNumberOfSymbols = 10,
    this.showScannerOverlay = true,
    this.scannerOverlay,
    this.actionButtonsAlignment = Alignment.bottomLeft,
    this.actionButtonsPadding = const EdgeInsets.all(10),
    this.showFlashlight = true,
    this.showGallery = true,
    this.showToggleCamera = true,
    this.flashOnIcon = const Icon(Icons.flash_on),
    this.flashOffIcon = const Icon(Icons.flash_off),
    this.flashAlwaysIcon = const Icon(Icons.flash_on),
    this.flashAutoIcon = const Icon(Icons.flash_auto),
    this.galleryIcon = const Icon(Icons.photo_library),
    this.toggleCameraIcon = const Icon(Icons.switch_camera),
    this.actionButtonsBackgroundColor = Colors.black,
    this.actionButtonsBackgroundBorderRadius,
    this.allowPinchZoom = true,
    this.scanDelay = const Duration(milliseconds: 1000),
    this.scanDelaySuccess = const Duration(milliseconds: 1000),
    this.cropPercent = 0.5,
    this.horizontalCropOffset = 0.0,
    this.verticalCropOffset = 0.0,
    this.resolution = ResolutionPreset.high,
    this.lensDirection = CameraLensDirection.back,
    this.loading = const DecoratedBox(
      decoration: BoxDecoration(color: Colors.black),
    ),
  });

  final Function(Satoshifier) onScan;
  // final Function(Codes)? onMultiScan;
  // final Function(Codes)? onMultiScanFailure;
  // final Function(CameraController? controller, Exception? error)?
  // onControllerCreated;
  // final Function(bool)? onMultiScanModeChanged;
  // final bool isMultiScan;
  // final AlignmentGeometry multiScanModeAlignment;
  // final EdgeInsetsGeometry multiScanModePadding;
  final int codeFormat;
  final bool tryHarder;
  final bool tryInverted;
  final bool tryRotate;
  final bool tryDownscale;
  final int maxNumberOfSymbols;
  final bool showScannerOverlay;
  final ShapeBorder? scannerOverlay;
  final AlignmentGeometry actionButtonsAlignment;
  final EdgeInsetsGeometry actionButtonsPadding;
  final bool showFlashlight;
  final bool showGallery;
  final bool showToggleCamera;
  final Widget flashOnIcon;
  final Widget flashOffIcon;
  final Widget flashAlwaysIcon;
  final Widget flashAutoIcon;
  final Widget galleryIcon;
  final Widget toggleCameraIcon;
  final Color actionButtonsBackgroundColor;
  final BorderRadius? actionButtonsBackgroundBorderRadius;
  final bool allowPinchZoom;
  final Duration scanDelay;
  final double cropPercent;
  final double horizontalCropOffset;
  final double verticalCropOffset;
  final ResolutionPreset resolution;
  final CameraLensDirection lensDirection;
  final Duration scanDelaySuccess;
  final Widget loading;

  @override
  Widget build(BuildContext context) {
    return ReaderWidget(
      onScan: (result) async {
        final text = result.text;
        if (text == null || text.isEmpty) return;
        try {
          final thing = await Satoshifier.parse(text);
          onScan(thing);
        } catch (_) {}
      },
      // onMultiScan: onMultiScan,
      // onMultiScanFailure: onMultiScanFailure,
      // onControllerCreated: onControllerCreated,
      // onMultiScanModeChanged: onMultiScanModeChanged,
      // isMultiScan: isMultiScan,
      // multiScanModeAlignment: multiScanModeAlignment,
      // multiScanModePadding: multiScanModePadding,
      codeFormat: codeFormat,
      tryHarder: tryHarder,
      tryInverted: tryInverted,
      tryRotate: tryRotate,
      tryDownscale: tryDownscale,
      maxNumberOfSymbols: maxNumberOfSymbols,
      showScannerOverlay: showScannerOverlay,
      scannerOverlay: scannerOverlay,
      actionButtonsAlignment: actionButtonsAlignment,
      actionButtonsPadding: actionButtonsPadding,
      showFlashlight: showFlashlight,
      showGallery: showGallery,
      showToggleCamera: showToggleCamera,
      flashOnIcon: flashOnIcon,
      flashOffIcon: flashOffIcon,
      flashAlwaysIcon: flashAlwaysIcon,
      flashAutoIcon: flashAutoIcon,
      galleryIcon: galleryIcon,
      toggleCameraIcon: toggleCameraIcon,
      actionButtonsBackgroundColor: actionButtonsBackgroundColor,
      actionButtonsBackgroundBorderRadius: actionButtonsBackgroundBorderRadius,
      allowPinchZoom: allowPinchZoom,
      scanDelay: scanDelay,
      scanDelaySuccess: scanDelaySuccess,
      cropPercent: cropPercent,
      horizontalCropOffset: horizontalCropOffset,
      verticalCropOffset: verticalCropOffset,
      resolution: resolution,
      lensDirection: lensDirection,
      loading: loading,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gaspay_mobile/core/presentation/resources/drawables.dart';
import 'package:gaspay_mobile/core/presentation/widgets/svg_image.dart';

class LoadingOverlay {
  BuildContext _context;

  void hide() {
    Navigator.of(_context).pop();
  }

  void showLoader() {
    showDialog(
        context: _context,
        useSafeArea: false,
        barrierDismissible: false,
        builder: (ctx) => _FullScreenLoader());
  }

  Future<T> showAndHideLoader<T>(Future<T> future) {
    showLoader();
    return future.whenComplete(() => hide());
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }
}

class _FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF3D3D3D).withOpacity(.6),
      ),
      child: Center(
        child: Container(
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: SvgImage(
              asset: icLogo,
              width: 38,
              height: 53,
            ),
          ),
        ),
      ),
    );
  }
}

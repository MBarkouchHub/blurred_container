import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredContainer extends StatelessWidget {
  const BlurredContainer({
    super.key,
    this.width,
    this.height,
    this.blur = 10,
    this.decoration,
    this.color,
    this.padding,
    this.margin,
    this.alignment,
    this.child,
    this.constraints,
    this.foregroundDecoration,
    this.transform,
    this.transformAlignment,
  });
  final double? width;
  final double? height;
  final double blur;
  final Color? color;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding, margin;
  final AlignmentGeometry? alignment;
  final Widget? child;
  final Decoration? foregroundDecoration;
  final BoxConstraints? constraints;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;

  @override
  Widget build(BuildContext context) {
    final BorderRadiusGeometry borderRadius = _getBorderRadius(decoration);
    Color? color_ = color;
    Decoration? deco_ = decoration;
    if (color_ != null && decoration != null && (decoration is BoxDecoration)) {
      deco_ = (decoration as BoxDecoration).copyWith(color: color_);
      color_ = null;
    }
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          key: key,
          width: width,
          height: height,
          margin: margin,
          padding: padding,
          color: color_,
          decoration: deco_,
          alignment: alignment,
          constraints: constraints,
          foregroundDecoration: foregroundDecoration,
          transform: transform,
          transformAlignment: transformAlignment,
          child: child,
        ),
      ),
    );
  }

  BorderRadiusGeometry _getBorderRadius(Decoration? deco) {
    final response = BorderRadius.circular(0);
    if (deco == null) {
      return response;
    }
    if (deco is BoxDecoration) {
      return deco.borderRadius ?? response;
    }
    return response;
  }
}

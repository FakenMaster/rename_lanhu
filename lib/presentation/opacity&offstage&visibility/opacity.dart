import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

class Opacity extends SingleChildRenderObjectWidget {
  const Opacity({
    Key key,
    @required this.opacity,
    Widget child,
  }) : super(key: key, child: child);
  final double opacity;
  @override
  RenderOpacity createRenderObject(BuildContext context) => RenderOpacity(
        opacity: opacity,
      );

  @override
  void updateRenderObject(BuildContext context, RenderOpacity renderObject) =>
      renderObject..opacity = opacity;
}

class RenderOpacity extends RenderProxyBox {
  RenderOpacity({
    double opacity = 1.0,
    RenderBox child,
  })  : _opacity = opacity,
        _alpha = ui.Color.getAlphaFromOpacity(opacity),
        super(child);

  @override
  bool get alwaysNeedsCompositing =>
      child != null && (_alpha != 0 && _alpha != 255);

  int _alpha;

  double get opacity => _opacity;
  double _opacity;

  set opacity(double value) {
    if (_opacity == value) {
      return;
    }

    final bool didNeedCompositing = alwaysNeedsCompositing;
    _opacity = value;
    _alpha = ui.Color.getAlphaFromOpacity(_opacity);
    if (didNeedCompositing != alwaysNeedsCompositing) {
      markNeedsCompositingBitsUpdate();
    }
    markNeedsPaint();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      if (_alpha == 0) {
        layer = null;
        return;
      }

      if (_alpha == 255) {
        layer = null;
        context.paintChild(child, offset);
        return;
      }

      layer = context.pushOpacity(offset, _alpha, super.paint,oldLayer: layer as OpacityLayer);
    }
  }
}

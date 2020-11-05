import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Align extends SingleChildRenderObjectWidget {
  const Align({
    Key key,
    this.alignment,
    this.widthFactor,
    this.heightFactor,
    Widget child,
  }) : super(key: key, child: child);

  final AlignmentGeometry alignment;
  final double widthFactor;
  final double heightFactor;
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderPostionedBox(
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        textDirection: Directionality.of(context));
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderPostionedBox renderObject) {
    renderObject
      ..alignment = alignment
      ..widthFactor = widthFactor
      ..heightFactor = heightFactor
      ..textDirection = Directionality.of(context);
  }
}

abstract class RenderShiftedBox extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  RenderShiftedBox(RenderBox child) {
    this.child = child;
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    if (child != null) return child.getMinIntrinsicWidth(height);
    return super.computeMinIntrinsicWidth(height);
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    if (child != null) return child.getMaxIntrinsicWidth(height);
    return super.computeMaxIntrinsicWidth(height);
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    if (child != null) {
      return child.getMinIntrinsicHeight(width);
    }
    return super.computeMinIntrinsicHeight(width);
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    if (child != null) {
      return child.getMaxIntrinsicHeight(width);
    }
    return super.computeMaxIntrinsicHeight(width);
  }

  @override
  double computeDistanceToActualBaseline(TextBaseline baseline) {
    double result;
    if (child != null) {
      result = child.getDistanceToActualBaseline(baseline);
      final BoxParentData childParentData = child.parentData as BoxParentData;
      if (result != null) result += childParentData.offset.dy;
    } else {
      result = super.computeDistanceToActualBaseline(baseline);
    }

    return result;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child != null) {
      final BoxParentData childParentData = child.parentData as BoxParentData;
      context.paintChild(child, childParentData.offset + offset);
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {Offset position}) {
    if (child != null) {
      final BoxParentData childParentData = child.parentData as BoxParentData;
      return result.addWithPaintOffset(
          offset: childParentData.offset,
          position: position,
          hitTest: (BoxHitTestResult result, Offset transformed) {
            return child.hitTest(result, position: transformed);
          });
    }
    return false;
  }
}

abstract class RenderAligningShiftedBox extends RenderShiftedBox {
  RenderAligningShiftedBox({
    AlignmentGeometry alignment = Alignment.center,
    TextDirection textDirection,
    RenderBox child,
  })  : _alignment = alignment,
        _textDirection = textDirection,
        super(child);

  @protected
  RenderAligningShiftedBox.mixin(
      AlignmentGeometry alignment, TextDirection textDirection, RenderBox child)
      : this(alignment: alignment, textDirection: textDirection, child: child);

  Alignment _resolveAlignment;

  void _resolve() {
    if (_resolveAlignment != null) {
      return;
    }
    _resolveAlignment = alignment.resolve(textDirection);
  }

  void _markNeedResolution() {
    _resolveAlignment = null;
    markNeedsLayout();
  }

  AlignmentGeometry get alignment => _alignment;
  AlignmentGeometry _alignment;

  set alignment(AlignmentGeometry value) {
    if (_alignment == value) {
      return;
    }
    _alignment = value;
    _markNeedResolution();
  }

  TextDirection get textDirection => _textDirection;
  TextDirection _textDirection;
  set textDirection(TextDirection value) {
    if (_textDirection == value) {
      return;
    }

    _textDirection = value;
    _markNeedResolution();
  }

  void alignChild() {
    _resolve();
    final BoxParentData childParentData = child.parentData as BoxParentData;
    childParentData.offset =
        _resolveAlignment.alongOffset(size - child.size as Offset);

    // size:300,300, child.size:100,100, offset: 200,200
    //           -0.5,-0.5, 左上 1/4, 结果：50,50,
  }
}

class RenderPostionedBox extends RenderAligningShiftedBox {
  RenderPostionedBox({
    RenderBox child,
    double widthFactor,
    double heightFactor,
    AlignmentGeometry alignment = Alignment.center,
    TextDirection textDirection,
  })  : _widthFactor = widthFactor,
        _heightFactor = heightFactor,
        super(
          child: child,
          alignment: alignment,
          textDirection: textDirection,
        );

  double get widthFactor => _widthFactor;
  double _widthFactor;
  set widthFactor(double value) {
    if (_widthFactor == value) {
      return;
    }
    _widthFactor = value;
    markNeedsLayout();
  }

  double get heightFactor => _heightFactor;
  double _heightFactor;
  set heightFactor(double value) {
    if (_heightFactor == value) {
      return;
    }
    _heightFactor = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    final BoxConstraints constraints = this.constraints;
    final bool shrinkWrapWidth =
        _widthFactor != null || constraints.maxWidth == double.infinity;
    final bool shrinkWrapHeight =
        _heightFactor != null || constraints.maxHeight == double.infinity;

    if (child != null) {
      child.layout(constraints.loosen(), parentUsesSize: true);
      size = constraints.constrain(Size(
          shrinkWrapWidth
              ? child.size.width * (_widthFactor ?? 1.0)
              : double.infinity,
          shrinkWrapHeight
              ? child.size.height * (_heightFactor ?? 1.0)
              : double.infinity));
      alignChild();
    } else {
      size = constraints.constrain(Size(shrinkWrapWidth ? 0.0 : double.infinity,
          shrinkWrapHeight ? 0.0 : double.infinity));
    }
  }
}

class Center extends Align {
  const Center(
      {Key key,
      AlignmentGeometry alignment,
      double widthFactor,
      double heightFactor,
      Widget child})
      : super(
            key: key,
            alignment: alignment,
            widthFactor: widthFactor,
            heightFactor: heightFactor,
            child: child);
}

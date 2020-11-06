import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FrogSize extends ParentDataWidget<FrogJarParentData> {
  FrogSize({
    Key key,
    @required this.size,
    @required Widget child,
  }) : super(key: key, child: child);
  final Size size;

  @override
  void applyParentData(RenderObject renderObject) {
    final FrogJarParentData parentData = renderObject.parentData;
    if (parentData.size != size) {
      parentData.size = size;
      final RenderFrogJar targetParent = renderObject.parent;
      targetParent.markNeedsLayout();
    }
  }

  @override
  Type get debugTypicalAncestorWidgetClass => FrogJar;
}

class FrogJarParentData extends ParentData {
  Size size;
}

class FrogJar extends RenderObjectWidget {
  @override
  RenderObjectElement createElement() {
    return FrogJarElement(this);
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderFrogJar();
  }

  @override
  void updateRenderObject(BuildContext context, RenderFrogJar renderObject) {}
}

class FrogJarElement extends RenderObjectElement {
  FrogJarElement(FrogJar widget) : super(widget);

  @override
  FrogJar get widget => super.widget as FrogJar;

  @override
  void insertChildRenderObject(RenderObject child, slot) {}

  @override
  void moveChildRenderObject(RenderObject child, slot) {}

  @override
  void removeChildRenderObject(RenderObject child) {}
}

class RenderFrogJar extends RenderObject {
  @override
  void debugAssertDoesMeetConstraints() {}

  @override
  Rect get paintBounds => throw UnimplementedError();

  @override
  void performLayout() {}

  @override
  void performResize() {}

  @override
  Rect get semanticBounds => throw UnimplementedError();
}

class RunTime extends ParentDataWidget<RunTimeParentData> {
  RunTime({
    Key key,
    this.time,
    Widget child,
  }) : super(key: key, child: child);

  final int time;
  @override
  void applyParentData(RenderObject renderObject) {
    RunTimeParentData parentData = renderObject.parentData;
    if (parentData.time != time) {
      parentData.time = time;
      RenderRun renderRun = renderObject.parent;
      renderRun.markNeedsLayout();
    }
  }

  @override
  Type get debugTypicalAncestorWidgetClass => Run;
}

class RunTimeParentData extends ParentData {
  int time;
}

class RunDistance extends ParentDataWidget<RunDistanceParentData> {
  RunDistance({
    Key key,
    this.distance,
    Widget child,
  }) : super(key: key, child: child);
  final double distance;
  @override
  void applyParentData(RenderObject renderObject) {
    RunDistanceParentData parentData = renderObject.parentData;
    if (parentData.distance != distance) {
      parentData.distance = distance;
      RenderObject renderRun = renderObject.parent;
      renderRun.markNeedsLayout();
    }
  }

  @override
  Type get debugTypicalAncestorWidgetClass => Run;
}

class RunDistanceParentData extends ParentData {
  double distance;
}

class Run extends RenderObjectWidget {
  @override
  RenderObjectElement createElement() {
    return RunElement(this);
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderRun();
  }

  @override
  void updateRenderObject(BuildContext context, RenderRun renderObject) {}
}

class RunElement extends RenderObjectElement {
  RunElement(Run widget) : super(widget);

  @override
  void insertChildRenderObject(RenderObject child, slot) {
  }

  @override
  void moveChildRenderObject(RenderObject child, slot) {
  }

  @override
  void removeChildRenderObject(RenderObject child) {
  }
}

class RenderRun extends RenderObject {
  @override
  void debugAssertDoesMeetConstraints() {
  }

  @override
  Rect get paintBounds => throw UnimplementedError();

  @override
  void performLayout() {
  }

  @override
  void performResize() {
  }

  @override
  Rect get semanticBounds => throw UnimplementedError();
}

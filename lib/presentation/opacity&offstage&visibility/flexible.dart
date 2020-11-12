import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Flexible extends ParentDataWidget<FlexParentData> {
  final int flex;
  final FlexFit fit;

  const Flexible({Key key, this.flex, this.fit, Widget child})
      : super(key: key, child: child);

  @override
  void applyParentData(RenderObject renderObject) {
    final FlexParentData parentData = renderObject.parentData as FlexParentData;
    bool needsLayout = false;

    if (parentData.flex != flex) {
      parentData.flex = flex;
      needsLayout = true;
    }

    if (parentData.fit != fit) {
      parentData.fit = fit;
      needsLayout = true;
    }

    if (needsLayout) {
      final AbstractNode targetParent = renderObject.parent;
      if (targetParent is RenderObject) {
        targetParent.markNeedsLayout();
      }
    }
  }

  @override
  Type get debugTypicalAncestorWidgetClass => Flex;
}

class Expanded extends Flexible {
  const Expanded({
    Key key,
    int flex = 1,
    Widget child,
  }) : super(key: key, flex: flex, fit: FlexFit.tight, child: child);
}

class FlexParentData extends ContainerBoxParentData<RenderBox> {
  int flex;
  FlexFit fit;
}

abstract class ContainerBoxParentData<ChildType extends RenderObject>
    extends BoxParentData with ContainerParentDataMixin<ChildType> {}

class BoxParentData extends ParentData {
  Offset offset = Offset.zero;
}

mixin ContainerParentDataMixin<ChildType extends RenderObject> on ParentData {
  ChildType previousSibling;
  ChildType nextSibling;
}


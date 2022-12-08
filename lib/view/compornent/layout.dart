import 'package:flutter/material.dart';
import 'package:roumer/unwrap.dart';

abstract class _BaseFlex extends StatelessWidget {
  final FlexDirection direction;
  final bool isShowingProgress;
  final Widget Function(FlexLayoutConstraints) builder;

  const _BaseFlex({
    super.key,
    required this.builder,
    required this.direction,
    required this.isShowingProgress,
  });

  Widget buildLayout(double widht, double height) {
    return Stack(
      children: [
        SizedBox(
          width: widht,
          height: height,
          child: builder(
            FlexLayoutConstraints(
              parentWidth: widht,
              parentHeight: height,
              direction: direction,
            ),
          ),
        ),
        if (isShowingProgress)
          SizedBox(
            width: widht,
            height: height,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Container(
                width: widht,
                height: widht,
                padding: const EdgeInsets.all(10),
                child: const CircularProgressIndicator(
                  strokeWidth: 20,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class FlexLayout extends _BaseFlex {
  final double? width;
  final double? maxWidth;
  final double? minWidth;

  final double? height;
  final double? maxHeight;
  final double? minHeight;

  const FlexLayout(
      {super.key,
      required super.direction,
      super.isShowingProgress = false,
      required super.builder,
      this.height,
      this.width,
      this.maxHeight,
      this.minHeight,
      this.maxWidth,
      this.minWidth})
      : assert((maxHeight ?? double.maxFinite) > (minHeight ?? 0)),
        assert((maxWidth ?? double.maxFinite) > (minWidth ?? 0)),
        assert((maxHeight ?? 1) > 0),
        assert((minHeight ?? 1) > 0),
        assert((maxWidth ?? 1) > 0),
        assert((minWidth ?? 1) > 0),
        assert((height ?? 1) > 0),
        assert((width ?? 1) > 0);

  @override
  Widget build(BuildContext context) {
    if (width != null && height != null) {
      return buildLayout(unwrapNull(width), unwrapNull(height));
    } else {
      return LayoutBuilder(
        builder: (context, baseConstraints) {
          final finalWidth = width ??
              ((maxWidth != null &&
                      baseConstraints.maxWidth > unwrapNull(maxWidth))
                  ? unwrapNull(maxWidth)
                  : (minWidth != null &&
                          baseConstraints.maxWidth < unwrapNull(minWidth))
                      ? unwrapNull(minWidth)
                      : baseConstraints.maxWidth);

          final finalHeight = height ??
              ((maxHeight != null &&
                      baseConstraints.maxHeight > unwrapNull(maxHeight))
                  ? unwrapNull(maxHeight)
                  : (minHeight != null &&
                          baseConstraints.maxHeight < unwrapNull(minHeight))
                      ? unwrapNull(minHeight)
                      : baseConstraints.maxHeight);

          return buildLayout(unwrapNull(finalWidth), unwrapNull(finalHeight));
        },
      );
    }
  }
}

class FlexItem extends _BaseFlex {
  final FlexLayoutSize size;

  const FlexItem({
    super.key,
    required super.direction,
    required this.size,
    super.isShowingProgress = false,
    required super.builder,
  });

  @override
  Widget build(BuildContext context) {
    return buildLayout(size.width, size.height);
  }
}

class FlexLayoutConstraints {
  final double parentWidth;
  final double parentHeight;
  final FlexDirection direction;

  FlexLayoutConstraints({
    required this.parentWidth,
    required this.parentHeight,
    required this.direction,
  });

  double _weightSum = 0;
  double _sideLengthSum = 0;

  double get weightLength {
    return ((direction == FlexDirection.column ? parentHeight : parentWidth) -
            _sideLengthSum) /
        (_weightSum > 0 ? _weightSum : 1);
  }

  FlexLayoutSize weight(double weight) {
    assert(weight > 0);
    _weightSum += weight;
    return FlexLayoutSize(this, weight: weight);
  }

  FlexLayoutSize extend() {
    return weight(1);
  }

  FlexLayoutSize sideLength(double sideLength) {
    assert(sideLength > 0);
    _sideLengthSum += sideLength;
    return FlexLayoutSize(this, sideLength: sideLength);
  }
}

class FlexLayoutSize {
  final FlexLayoutConstraints _constraints;
  double? weight;
  double? sideLength;

  FlexLayoutSize(
    this._constraints, {
    this.sideLength,
    this.weight,
  }) : assert(weight != null || sideLength != null);

  double get width {
    return _constraints.direction == FlexDirection.column
        ? _constraints.parentWidth
        : weight != null
            ? _constraints.weightLength * unwrapNull(weight)
            : unwrapNull(sideLength);
  }

  double get height {
    return _constraints.direction == FlexDirection.row
        ? _constraints.parentHeight
        : weight != null
            ? _constraints.weightLength * unwrapNull(weight)
            : unwrapNull(sideLength);
  }
}

enum FlexDirection {
  column,
  row,
}

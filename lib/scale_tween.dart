import 'package:flutter/material.dart';

/// A widget that animates its scale from a beginning value to an ending value.
///
/// The [ScaleTween] widget takes a child widget and animates its scale over a specified
/// duration. You can customize the duration, delay, curve, and scale values for the
/// animation. Additionally, you can control whether the animation reverses or not.
///
/// {@tool snippet}
/// This example shows how to use the [ScaleTween] widget with a child widget:
///
/// ```dart
/// ScaleTween(
///   child: Text('Scale me!'),
///   duration: Duration(seconds: 1),
///   curve: Curves.easeInOut,
///   begin: 0.5,
///   end: 1.5,
///   reverse: false,
/// )
/// ```
/// {@end-tool}
class ScaleTween extends StatefulWidget {
  /// The child widget to be animated.
  final Widget child;

  /// The duration of the scale animation.
  ///
  /// Defaults to 250 milliseconds.
  final Duration duration;

  /// The duration of the reverse animation.
  ///
  /// Defaults to 250 milliseconds.
  final Duration reverseDuration;

  /// The delay before the animation starts.
  ///
  /// Defaults to 0 milliseconds.
  final Duration delay;

  /// The curve to be used for the scale animation.
  ///
  /// Defaults to [Curves.linear].
  final Curve curve;

  /// The curve used for the reverse animation.
  ///
  /// Defaults to [Curves.linear].
  final Curve reverseCurve;

  /// The beginning scale value of the animation.
  ///
  /// Defaults to 0.2.
  final double begin;

  /// The ending scale value of the animation.
  ///
  /// Defaults to 1.0.
  final double end;

  /// Whether the animation should reverse.
  ///
  /// If true, the animation will scale from [end] to [begin].
  /// Defaults to false.
  final bool reverse;

  /// Creates a [ScaleTween] widget.
  ///
  /// The [child] parameter is required and specifies the widget to be scaled.
  /// The [duration] parameter specifies the duration of the forward animation.
  /// The [reverseDuration] parameter specifies the duration of the reverse animation.
  /// The [delay] parameter specifies the delay before starting the animation.
  /// The [curve] parameter specifies the curve used for the forward animation.
  /// The [reverseCurve] parameter specifies the curve used for the reverse animation.
  /// The [begin] parameter specifies the initial scale value.
  /// The [end] parameter specifies the final scale value.
  /// The [reverse] parameter specifies whether to play the animation in reverse.
  const ScaleTween({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 250),
    this.reverseDuration = const Duration(milliseconds: 250),
    this.delay = const Duration(milliseconds: 0),
    this.curve = Curves.linear,
    this.reverseCurve = Curves.linear,
    this.begin = 0.2,
    this.end = 1.0,
    this.reverse = false,
  });

  @override
  State<ScaleTween> createState() => _ScaleTweenState();
}

class _ScaleTweenState extends State<ScaleTween> {
  bool _startAnimation = false;

  @override
  void initState() {
    super.initState();
    // Start the animation after the specified delay
    Future.delayed(widget.delay, () {
      if (mounted) {
        setState(() {
          _startAnimation = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      builder: (_, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      tween: _animationTween(),
      duration: widget.reverse ? widget.reverseDuration : widget.duration,
      curve: widget.reverse ? widget.reverseCurve : widget.curve,
      child: widget.child,
    );
  }

  Tween<double> _animationTween() {
    if (widget.reverse) {
      return _startAnimation
          ? Tween(begin: widget.end, end: widget.begin)
          : Tween(begin: widget.end, end: widget.end);
    }
    return _startAnimation
        ? Tween(begin: widget.begin, end: widget.end)
        : Tween(begin: widget.begin, end: widget.begin);
  }
}

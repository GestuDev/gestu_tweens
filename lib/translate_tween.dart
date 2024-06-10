import 'package:flutter/material.dart';

/// A widget that animates its position from a beginning offset to an ending offset.
///
/// The [TranslateTween] widget takes a child widget and animates its position over a specified
/// duration. You can customize the duration, delay, curve, and offset values for the
/// animation. Additionally, you can control whether the animation reverses or not.
///
/// {@tool snippet}
/// This example shows how to use the [TranslateTween] widget with a child widget:
///
/// ```dart
/// TranslateTween(
///   child: Text('Slide me!'),
///   duration: Duration(seconds: 1),
///   curve: Curves.easeInOut,
///   begin: Offset(0, 30),
///   end: Offset(0, 0),
///   reverse: false,
/// )
/// ```
/// {@end-tool}
class TranslateTween extends StatefulWidget {
  /// The child widget to be animated.
  final Widget child;

  /// The duration of the slide animation.
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

  /// The curve to be used for the slide animation.
  ///
  /// Defaults to [Curves.linear].
  final Curve curve;

  /// The curve used for the reverse animation.
  ///
  /// Defaults to [Curves.linear].
  final Curve reverseCurve;

  /// The beginning offset value of the animation.
  ///
  /// Defaults to Offset(0, 30).
  final Offset begin;

  /// The ending offset value of the animation.
  ///
  /// Defaults to Offset(0, 0).
  final Offset end;

  /// Whether the animation should reverse.
  ///
  /// If true, the animation will change position from [end] to [begin].
  /// Defaults to false.
  final bool reverse;

  /// Creates a [TranslateTween] widget.
  ///
  /// The [child] parameter is required and specifies the widget to be animated.
  /// The [duration] parameter specifies the duration of the forward animation.
  /// The [reverseDuration] parameter specifies the duration of the reverse animation.
  /// The [delay] parameter specifies the delay before starting the animation.
  /// The [curve] parameter specifies the curve used for the forward animation.
  /// The [reverseCurve] parameter specifies the curve used for the reverse animation.
  /// The [begin] parameter specifies the initial offset value.
  /// The [end] parameter specifies the final offset value.
  /// The [reverse] parameter specifies whether to play the animation in reverse.
  const TranslateTween({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 250),
    this.reverseDuration = const Duration(milliseconds: 250),
    this.delay = const Duration(milliseconds: 0),
    this.curve = Curves.linear,
    this.reverseCurve = Curves.linear,
    this.begin = const Offset(0, 30),
    this.end = const Offset(0, 0),
    this.reverse = false,
  });

  @override
  State<TranslateTween> createState() => _TranslateTweenState();
}

class _TranslateTweenState extends State<TranslateTween> {
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
    return TweenAnimationBuilder<Offset>(
      builder: (_, value, child) {
        return Transform.translate(
          offset: value,
          child: child,
        );
      },
      tween: _animationTween(),
      duration: widget.reverse ? widget.reverseDuration : widget.duration,
      curve: widget.reverse ? widget.reverseCurve : widget.curve,
      child: widget.child,
    );
  }

  Tween<Offset> _animationTween() {
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

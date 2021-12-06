import 'package:flutter/material.dart';

class AnimationText extends StatefulWidget {
  const AnimationText(
      {Key? key, required this.title, required this.duration, this.style})
      : super(key: key);

  final String title;
  final Duration? duration;
  final TextStyle? style;

  @override
  State<AnimationText> createState() => _AnimationTextState();
}

class _AnimationTextState extends State<AnimationText>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration!,
    )..addListener(() {
      setState(() {});
    });
    _animation = Tween<double>(begin: 0.0, end: widget.title.length.toDouble())
        .animate(_controller);
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title.substring(0, _animation.value.toInt()+1),
      style: widget.style!,
    );
  }
}
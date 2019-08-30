library confirmation_slider;

import 'package:flutter/material.dart';

class ConfirmationSlider extends StatefulWidget {
  final double height;

  final Color backgroundColor;

  final Color foregroundColor;

  final Color iconColor;

  final ValueChanged<void> onConfirmation;

  const ConfirmationSlider(
      {Key key,
      this.height = 100,
      this.backgroundColor = Colors.white,
      this.foregroundColor = Colors.blueAccent,
      this.iconColor = Colors.white,
      @required this.onConfirmation})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ConfirmationSliderState();
  }
}

class ConfirmationSliderState extends State<ConfirmationSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(widget.height)),
        color: widget.backgroundColor,
      ),
      child: Positioned(
        left: 0,
        top: 0,
        child: Container(
          height: widget.height - 10,
          width: widget.height - 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(widget.height / 2)),
            color: widget.foregroundColor,
          ),
        ),
      ),
    );
  }
}

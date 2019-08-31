import 'package:flutter/material.dart';

class ConfirmationSlider extends StatefulWidget {
  // Height of the slider. Defaults to 70.
  final double height;

  // Width of the slider. Defaults to 300.
  final double width;

  // The color of the background of the slider. Defaults to Colors.white.
  final Color backgroundColor;

  // The color of the moving element of the slider. Defaults to Colors.blueAccent.
  final Color foregroundColor;

  // The color of the icon on the moving element. Defaults to Colors.white.
  final Color iconColor;

  // The icon used on the moving element of the slider. Defaults to Icons.chevron_right.
  final IconData icon;

  // The shadow below the slider. Defaults to BoxShadow(color: Colors.black38, offset: Offset(0, 2),blurRadius: 2,spreadRadius: 0,).
  final BoxShadow shadow;

  // The text showed below the foreground. Used to specify the functionality to the user. Defaults to "Slide to confirm".
  final String text;

  // The style of the text. Defaults to TextStyle(color: Colors.black26, fontWeight: FontWeight.bold,).
  final TextStyle textStyle;

  // The callback when slider is completed. This is the only required field.
  final VoidCallback onConfirmation;

  const ConfirmationSlider(
      {Key key,
      this.height = 70,
      this.width = 300,
      this.backgroundColor = Colors.white,
      this.foregroundColor = Colors.blueAccent,
      this.iconColor = Colors.white,
      this.shadow,
      this.icon = Icons.chevron_right,
      this.text = "Slide to confirm",
      this.textStyle,
      @required this.onConfirmation})
      : assert(height >= 25 && width >= 250);

  @override
  State<StatefulWidget> createState() {
    return ConfirmationSliderState();
  }
}

class ConfirmationSliderState extends State<ConfirmationSlider> {
  double _position = 0;
  int _duration = 0;

  double getPosition() {
    if (_position < 0) {
      return 0;
    } else if (_position > widget.width - widget.height) {
      return widget.width - widget.height;
    } else {
      return _position;
    }
  }

  void updatePosition(details) {
    if (details is DragEndDetails) {
      setState(() {
        _duration = 600;
        _position = 0;
      });
    } else if (details is DragUpdateDetails) {
      setState(() {
        _duration = 0;
        _position = details.localPosition.dx - (widget.height / 2);
      });
    }
  }

  void sliderReleased(details) {
    if (_position > widget.width - widget.height) {
      widget.onConfirmation();
    }
    updatePosition(details);
  }

  @override
  Widget build(BuildContext context) {
    BoxShadow shadow;
    if (widget.shadow == null) {
      shadow = BoxShadow(
        color: Colors.black38,
        offset: Offset(0, 2),
        blurRadius: 2,
        spreadRadius: 0,
      );
    } else {
      shadow = widget.shadow;
    }

    TextStyle style;
    if (widget.textStyle == null) {
      style = TextStyle(
        color: Colors.black26,
        fontWeight: FontWeight.bold,
      );
    } else {
      style = widget.textStyle;
    }

    return Container(
      height: widget.height,
      width: widget.width,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(widget.height)),
        color: widget.backgroundColor,
        boxShadow: <BoxShadow>[shadow],
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Text(
              widget.text,
              style: style,
            ),
          ),
          Positioned(
            left: widget.height / 2,
            child: AnimatedContainer(
              height: widget.height - 10,
              width: getPosition(),
              duration: Duration(milliseconds: _duration),
              curve: Curves.bounceOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(widget.height)),
                color: widget.backgroundColor,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: _duration),
            curve: Curves.bounceOut,
            left: getPosition(),
            top: 0,
            child: GestureDetector(
              onPanUpdate: (details) => updatePosition(details),
              onPanEnd: (details) => sliderReleased(details),
              child: Container(
                height: widget.height - 10,
                width: widget.height - 10,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.height / 2)),
                  color: widget.foregroundColor,
                ),
                child: Icon(
                  widget.icon,
                  color: widget.iconColor,
                  size: widget.height * 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

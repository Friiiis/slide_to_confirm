import 'package:flutter/material.dart';

class ConfirmationSlider extends StatefulWidget {
  final double height;

  final double width;

  final Color backgroundColor;

  final Color foregroundColor;

  final Color iconColor;

  final IconData icon;

  final VoidCallback onConfirmation;

  const ConfirmationSlider(
      {Key key,
      this.height = 70,
      this.width = 300,
      this.backgroundColor = Colors.white,
      this.foregroundColor = Colors.blueAccent,
      this.iconColor = Colors.white,
      this.icon = Icons.chevron_right,
      @required this.onConfirmation})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ConfirmationSliderState();
  }
}

class ConfirmationSliderState extends State<ConfirmationSlider> {
  double _position = 5;

  double getPosition() {
    if (_position < 5) {
      return 5;
    } else if (_position > widget.width - widget.height + 5) {
      return widget.width - widget.height + 5;
    } else {
      return _position;
    }
  }

  void updatePosition(details) {
    if (details is DragEndDetails) {
      setState(() {
        _position = 5;
      });
    } else if (details is DragUpdateDetails) {
      setState(() {
        _position = details.localPosition.dx - (widget.height / 2);
      });
    }
  }

  void sliderReleased(details) {
    if (_position > widget.width - widget.height + 5) {
      widget.onConfirmation();
    } 
    updatePosition(details);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(widget.height)),
        color: widget.backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 2),
            blurRadius: 2,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: getPosition(),
            top: 5,
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
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

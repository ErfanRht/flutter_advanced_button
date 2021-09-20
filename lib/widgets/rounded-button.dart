part of '../flutter_advanced_button.dart';

class AdvancedRoundedButton extends StatefulWidget {
  final Function onTap, onDoubleTap, onLongPress, onTapCancel;
  final Widget child;
  final double height, width;
  final Color color;
  final double borderRadius;
  final dynamic indicator;
  final int animationSpeed, waitTime;
  const AdvancedRoundedButton({
    Key key,
    @required this.child,
    @required this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapCancel,
    this.height = 45,
    this.width = 220,
    this.color = Colors.blue,
    this.borderRadius = 50,
    this.indicator,
    this.animationSpeed = 150,
    this.waitTime = 1000,
  });
  @override
  _AdvancedRoundedButtonState createState() => _AdvancedRoundedButtonState();
}

class _AdvancedRoundedButtonState extends State<AdvancedRoundedButton> {
  double borderRadius, defaultBorderRadius;
  double height, width, defaultWidth;
  dynamic indicator;
  bool showIndicator;
  @override
  void initState() {
    super.initState();
    this.borderRadius = widget.borderRadius;
    this.defaultBorderRadius = widget.borderRadius;
    this.height = widget.height;
    this.width = widget.width;
    this.defaultWidth = widget.width;
    this.indicator = widget.indicator;
    this.showIndicator = false;
    if (this.indicator == null) {
      this.indicator = _indicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onButtonTapped(onTap: widget.onTap),
      onLongPress: widget.onLongPress,
      onDoubleTap: widget.onDoubleTap,
      onTapCancel: widget.onTapCancel,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      // onHighlightChanged: (status) => onHighlightChanged(status: status),
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationSpeed),
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: widget.color,
        ),
        child: AnimatedSwitcher(
            duration:
                Duration(milliseconds: (widget.animationSpeed / 4).round()),
            child: !showIndicator ? widget.child : indicator),
      ),
    );
  }

  onButtonTapped({@required onTap}) async {
    setState(() {
      width = height;
      borderRadius = 100;
    });
    await _delay(time: (widget.animationSpeed / 10).round());
    setState(() {
      showIndicator = true;
    });
    await onTap();
    await _delay(time: widget.waitTime);
    setState(() {
      width = defaultWidth;
      borderRadius = defaultBorderRadius;
    });
    await _delay(time: (widget.animationSpeed / 2).round());
    setState(() {
      showIndicator = false;
    });
  }

  // Widgets
  Widget _indicator() {
    return SizedBox(
      width: height - 15,
      height: height - 15,
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 3,
      ),
    );
  }

  Future<bool> _delay({@required time}) async {
    await Future.delayed(Duration(milliseconds: time));
  }
}

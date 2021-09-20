part of '../flutter_advanced_button.dart';

class AdvancedFolidButton extends StatefulWidget {
  final Function onTap, onDoubleTap, onLongPress, onTapCancel;
  final Widget child;
  final double height, width, foldWidth;
  final Color color;
  final double borderRadius;
  final int animationSpeed;
  const AdvancedFolidButton({
    Key key,
    @required this.child,
    @required this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapCancel,
    this.height = 45,
    this.width = 220,
    this.foldWidth = 150,
    this.color = Colors.blue,
    this.borderRadius = 50,
    this.animationSpeed = 150,
  });
  @override
  _AdvancedFolidButtonState createState() => _AdvancedFolidButtonState();
}

class _AdvancedFolidButtonState extends State<AdvancedFolidButton> {
  double borderRadius;
  double height, width, defaultWidth;
  @override
  void initState() {
    super.initState();
    this.borderRadius = widget.borderRadius;
    this.height = widget.height;
    this.width = widget.width;
    this.defaultWidth = widget.width;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      onDoubleTap: widget.onDoubleTap,
      onTapCancel: widget.onTapCancel,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onHighlightChanged: (status) => onHighlightChanged(status: status),
      child: AnimatedContainer(
          duration: Duration(milliseconds: widget.animationSpeed),
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: widget.color,
          ),
          child: Center(child: widget.child)),
    );
  }

  onHighlightChanged({@required status}) {
    if (status) {
      setState(() {
        width = widget.foldWidth;
      });
    } else if (!status) {
      setState(() {
        width = defaultWidth;
      });
    }
  }
}

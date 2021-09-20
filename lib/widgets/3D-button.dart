// Thanks to @Emadeddin-eibo on Github for making "animated_button" package

part of '../flutter_advanced_button.dart';

/// Using [ShadowDegree] with values [ShadowDegree.dark] or [ShadowDegree.light]
/// to get a darker version of the used color.
/// [duration] in milliseconds
///
class Advanced3DButton extends StatefulWidget {
  final GestureTapCallback onTap;
  final Widget child;
  final bool enabled;
  final Color color;
  final double height;
  final double width;
  final ShadowType shadowDegree;
  final int duration;
  final BoxShape shape;

  const Advanced3DButton(
      {Key key,
      @required this.onTap,
      @required this.child,
      this.enabled = true,
      this.color = Colors.blue,
      this.height = 64,
      this.shadowDegree = ShadowType.light,
      this.width = 200,
      this.duration = 70,
      this.shape = BoxShape.rectangle})
      : assert(child != null),
        super(key: key);

  @override
  _Advanced3DButtonState createState() => _Advanced3DButtonState();
}

class _Advanced3DButtonState extends State<Advanced3DButton> {
  static const Curve _curve = Curves.easeIn;
  static const double _shadowHeight = 4;
  double _position = 4;

  @override
  Widget build(BuildContext context) {
    final double _height = widget.height - _shadowHeight;

    return GestureDetector(
      // width here is required for centering the button in parent
      child: Container(
        width: widget.width,
        height: _height + _shadowHeight,
        child: Stack(
          children: <Widget>[
            // background shadow serves as drop shadow
            // width is necessary for bottom shadow
            Positioned(
              bottom: 0,
              child: Container(
                height: _height,
                width: widget.width,
                decoration: BoxDecoration(
                    color: widget.enabled
                        ? darken(widget.color, widget.shadowDegree)
                        : darken(Colors.grey, widget.shadowDegree),
                    borderRadius: widget.shape != BoxShape.circle
                        ? BorderRadius.all(
                            Radius.circular(16),
                          )
                        : null,
                    shape: widget.shape),
              ),
            ),
            AnimatedPositioned(
              curve: _curve,
              duration: Duration(milliseconds: widget.duration),
              bottom: _position,
              child: Container(
                height: _height,
                width: widget.width,
                decoration: BoxDecoration(
                    color: widget.enabled ? widget.color : Colors.grey,
                    borderRadius: widget.shape != BoxShape.circle
                        ? BorderRadius.all(
                            Radius.circular(16),
                          )
                        : null,
                    shape: widget.shape),
                child: Center(
                  child: widget.child,
                ),
              ),
            ),
          ],
        ),
      ),
      onTapDown: widget.enabled ? _pressed : null,
      onTapUp: widget.enabled ? _unPressedOnTapUp : null,
      onTapCancel: widget.enabled ? _unPressed : null,
    );
  }

  void _pressed(_) {
    setState(() {
      _position = 0;
    });
  }

  void _unPressedOnTapUp(_) => _unPressed();

  void _unPressed() {
    setState(() {
      _position = 4;
    });
    widget.onTap();
  }
}

// Get a darker color from any entered color.
// Thanks to @NearHuscarl on StackOverflow
Color darken(Color color, ShadowType degree) {
  double amount = degree == ShadowType.dark ? 0.3 : 0.12;
  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

enum ShadowType { light, dark }

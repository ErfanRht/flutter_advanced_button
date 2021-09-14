part of '../../flutter_advanced_button.dart';

class AdvancedButton extends StatelessWidget {
  AdvancedButtonController advancedButtonController =
      Get.put(AdvancedButtonController());
  AdvancedButtonType type;
  Function onTap, onDoubleTap, onLongPress, onTapCancel;
  Widget child;
  Widget indicator;
  double height, width, foldWidth;
  Color color;
  double borderRadius;
  int animationSpeed, waitTime;
  AdvancedButton({
    Key key,
    @required this.type,
    @required this.child,
    @required this.onTap,
    this.indicator,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapCancel,
    this.height = 45,
    this.width = 220,
    this.foldWidth = 150,
    this.color = Colors.blue,
    this.borderRadius = 50,
    this.animationSpeed,
    this.waitTime = 1000,
  });
  @override
  Widget build(BuildContext context) {
    if (type == AdvancedButtonType.Folding) {
      print(animationSpeed);
      animationSpeed ??= 150;
    } else if (type == AdvancedButtonType.Rounded) {
      animationSpeed ??= 300;
    }
    if (indicator == null) {
      indicator = _advancedButtonDefaultIndicator();
    }
    Get.find<AdvancedButtonController>().updateButton(
      height: height,
      defaultWidth: width,
      width: width,
      foldWitdh: foldWidth,
      borderRadius: borderRadius,
      defaultBorderRadius: borderRadius,
      type: type,
      animationSpeed: animationSpeed,
      waitTime: waitTime,
    );
    return GetBuilder<AdvancedButtonController>(builder: (_) {
      return InkWell(
        onTap: () => onButtonTapped(onTap: onTap),
        onLongPress: onLongPress,
        onDoubleTap: onDoubleTap,
        onTapCancel: onTapCancel,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onHighlightChanged: (status) => onHighlightChanged(status: status),
        child: AnimatedContainer(
          duration: Duration(milliseconds: animationSpeed),
          height: _.height,
          width: _.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_.borderRadius),
            color: color,
          ),
          child: AnimatedSwitcher(
              duration: Duration(milliseconds: (animationSpeed / 4).round()),
              child: !_.showIndicator ? child : indicator),
        ),
      );
    });
  }

  Widget _advancedButtonDefaultIndicator() {
    AdvancedButtonController controller = Get.find<AdvancedButtonController>();
    return SizedBox(
      width: controller.height - 15,
      height: controller.height - 15,
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        strokeWidth: 3,
      ),
    );
  }
}

part of '../flutter_advanced_button.dart';

class AdvancedButtonController extends GetxController {
  bool showIndicator = false;
  double height,
      width,
      foldWitdh,
      defaultWidth,
      borderRadius,
      defaultBorderRadius;
  AdvancedButtonType type;
  int animationSpeed, waitTime;

  updateButton({
    bool showIndicator,
    double height,
    double width,
    double foldWitdh,
    double defaultWidth,
    double borderRadius,
    double defaultBorderRadius,
    AdvancedButtonType type,
    int animationSpeed,
    int waitTime,
  }) {
    this.showIndicator = showIndicator ?? this.showIndicator;
    this.height = height ?? this.height;
    this.width = width ?? this.width;
    this.foldWitdh = foldWitdh ?? this.foldWitdh;
    this.defaultWidth = defaultWidth ?? this.defaultWidth;
    this.borderRadius = borderRadius ?? this.borderRadius;
    this.defaultBorderRadius = defaultBorderRadius ?? this.defaultBorderRadius;
    this.type = type ?? this.type;
    this.animationSpeed = animationSpeed ?? this.animationSpeed;
    this.waitTime = waitTime ?? this.waitTime;
    update();
  }
}

onButtonTapped({@required Function onTap}) async {
  AdvancedButtonController controller = Get.find<AdvancedButtonController>();
  if (controller.type == AdvancedButtonType.Rounded) {
    controller.updateButton(width: controller.height, borderRadius: 100);
    await Delay(time: (controller.animationSpeed / 10).round());
    controller.updateButton(
      showIndicator: true,
    );
    await onTap();
    await Delay(time: controller.waitTime);
    controller.updateButton(
      width: controller.defaultWidth,
      borderRadius: controller.defaultBorderRadius,
    );
    await Delay(time: (controller.animationSpeed / 2).round());
    controller.updateButton(
      showIndicator: false,
    );
  }
}

onHighlightChanged({@required bool status}) {
  AdvancedButtonController controller = Get.find<AdvancedButtonController>();

  if (controller.type == AdvancedButtonType.Folding) {
    if (status) {
      controller.updateButton(
        width: controller.foldWitdh,
      );
    } else if (!status) {
      controller.updateButton(
        width: controller.defaultWidth,
      );
    }
  }
}

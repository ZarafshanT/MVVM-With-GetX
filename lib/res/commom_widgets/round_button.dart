import 'package:flutter/material.dart';
import 'package:flutter_getx/res/constants/colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {Key? key,
      this.buttonColor = primaryButtonColor,
      this.textColor = primaryTextColor,
      required this.title,
      required this.onPress,
      this.height = 50,
      this.width = 60,
      this.loading = false})
      : super(key: key);
  final bool loading;
  final String title;
  final double width, height;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(30)),
          child: loading
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ))),
    );
  }
}

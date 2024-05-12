import 'package:flutter/material.dart';
import 'package:flutter_getx/res/constants/colors/app_colors.dart';
import 'package:get/get.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Column(children: [
        Icon(
          Icons.cloud_off,
          color: redColor,
          size: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
              'internet_exception'.tr,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: height * .15),
        InkWell(
          onTap: widget.onPress,
          child: Container(
            height: 44,
            width: 150,
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(50)),
            child: Center(
              child: Text(
                'Retry',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

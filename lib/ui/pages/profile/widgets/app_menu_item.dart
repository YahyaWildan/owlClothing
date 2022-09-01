import 'package:flutter/material.dart';
import 'package:ocp/shared/theme.dart';

class AppMenuItem extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const AppMenuItem({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 42,
        margin: EdgeInsets.only(
          top: 8,
        ),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kWhiteColor,
          border: Border.all(
            color: kPrimaryColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            Icon(
              Icons.arrow_right_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

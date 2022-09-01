import 'package:flutter/material.dart';
import 'package:ocp/shared/theme.dart';

class AppItemDetail extends StatelessWidget {
  final String title;
  final String value;

  const AppItemDetail({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            Text(
              title,
              style: tableTextStyle,
            ),
            Text(
              value,
              style: tableTextStyle.copyWith(
                fontWeight: light,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

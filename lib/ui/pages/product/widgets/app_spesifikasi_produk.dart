import 'package:flutter/material.dart';
import 'package:ocp/shared/theme.dart';

class AppSpesifikasiProduk extends StatelessWidget {
  final String title;
  final String valueTitle;
  const AppSpesifikasiProduk({
    Key? key,
    required this.title,
    required this.valueTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(valueTitle),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: 8,
            ),
            width: double.infinity,
            height: 1,
            color: kBrownColor,
          ),
        ],
      ),
    );
  }
}

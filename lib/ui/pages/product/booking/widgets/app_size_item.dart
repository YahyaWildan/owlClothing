import 'package:flutter/material.dart';
import 'package:ocp/cubit/size_cubit.dart';
import 'package:ocp/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppSizeItem extends StatelessWidget {
  //Note: 0. Available 1.Selected 2. Unavailable
  final String id;
  final bool isAvailable;
  const AppSizeItem({
    Key? key,
    required this.id,
    this.isAvailable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SizeCubit>().isSelected(id);
    backgroundColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kAvailabeColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        return kPrimaryColor;
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            'Y',
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
        );
      } else {
        SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SizeCubit>().selectSize(id);
        }
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor(), width: 1),
        ),
        child: child(),
      ),
    );
  }
}

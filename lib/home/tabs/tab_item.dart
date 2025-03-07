import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';
import 'package:news/model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Source source;

  TabItem({required this.source, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(
        top: 15,
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
      child: Text(
        source.name ?? '',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: isSelected ? AppColors.whiteColor : AppColors.primaryColor,
            ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';
import 'package:news/model/Category.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;

  CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.1,
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(index % 2 != 0 ? 25 : 0),
          bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            category.imagePath,
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Text(
            category.lable,
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 17),
          )
        ],
      ),
    );
  }
}

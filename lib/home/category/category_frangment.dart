import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';
import 'package:news/home/category/category_item.dart';
import 'package:news/model/Category.dart';

class CategoryFrangment extends StatelessWidget {
  List<Category> categoriesList = Category.categoriesList();
  Function onCategoryItemClick  ;
  CategoryFrangment({super.key , required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Pick your category \n of interest',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.greyColor,
                  ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing:15,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      onCategoryItemClick(categoriesList[index]);
                    },
                    child: CategoryItem(
                        category: categoriesList[index], index: index),
                  );
                },
                itemCount: 7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

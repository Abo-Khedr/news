import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';


class Category {
  String id;
  String lable;
  String imagePath;
  Color color;

  Category({
    required this.id,
    required this.lable,
    required this.color,
    required this.imagePath,
  });

  static List<Category> categoriesList() {
    return [
      Category(
          id: 'sports',
          color: AppColors.redColor,
          lable: 'Sports',
          imagePath: 'assets/images/sports.png'),
      Category(
          id: 'general',
          lable: 'General',
          color: AppColors.darkBlueColor,
          imagePath: 'assets/images/Politics.png'),
      Category(
          id: 'health',
          lable: 'Health',
          color: AppColors.pinkColor,
          imagePath: 'assets/images/health.png'),
      Category(
          id: 'business',
          lable: 'Business',
          color: AppColors.brownColor,
          imagePath: 'assets/images/bussines.png'),
      Category(
          id: 'entertainment',
          lable: 'Entertainment',
          color: AppColors.blueColor,
          imagePath: 'assets/images/environment.png'),
      Category(
          id: 'science',
          lable: 'Science',
          color: AppColors.yellowColor,
          imagePath: 'assets/images/science.png'),
      Category(
          id: 'technology',
          lable: 'Technology',
          color: AppColors.darkBlueColor,
          imagePath: 'assets/images/Politics.png'),
    ];
  }
}

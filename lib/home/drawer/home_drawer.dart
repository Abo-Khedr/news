import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;
  Function onSideMenuItemClick;

  HomeDrawer({super.key, required this.onSideMenuItemClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          color: AppColors.primaryColor,
          child: Center(
            child: Text(
              'News App!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              onSideMenuItemClick(categories);
            },
            child: Row(
              children: [
                Icon(
                  Icons.list,
                  size: 35,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Categories',
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              onSideMenuItemClick(settings);
            },
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 35,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

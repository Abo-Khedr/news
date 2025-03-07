import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';
import 'package:news/home/category/category_details.dart';
import 'package:news/home/category/category_frangment.dart';
import 'package:news/home/drawer/home_drawer.dart';
import 'package:news/home/search/new_search_delegate.dart';
import 'package:news/home/settings/settings_tab.dart';
import 'package:news/model/Category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: Image(
            image: AssetImage(
              'assets/images/pattern.png',
            ),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.11,
            backgroundColor: AppColors.primaryColor,
            title: Text(
              selectedSideMenuItem == HomeDrawer.settings
                  ? 'Settings'
                  : selectedCategory == null
                      ? 'News App'
                      : selectedCategory!.lable,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: NewSearchDelegate(),
                      );
                    },
                    icon: Icon(
                      Icons.search,
                      size: 30,
                    )),
              )
            ],
          ),
          drawer: Drawer(
            width: MediaQuery.of(context).size.width * 0.7,
            child: HomeDrawer(
              onSideMenuItemClick: onSideMenuItemClick,
            ),
          ),
          body: selectedSideMenuItem == HomeDrawer.settings
              ? SettingsTab()
              : selectedCategory == null
                  ? CategoryFrangment(
                      onCategoryItemClick: onCategoryItemClick,
                    )
                  : CategoryDetails(
                      category: selectedCategory!,
                    ),
        ),
      ],
    );
  }

  Category? selectedCategory;

  void onCategoryItemClick(Category newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  int selectedSideMenuItem = HomeDrawer.categories;

  void onSideMenuItemClick(int newSideMenuItem) {
    selectedSideMenuItem = newSideMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
//4ecb46b18edd4db9b2044a1110ccbdcf

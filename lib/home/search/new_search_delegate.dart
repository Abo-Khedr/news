import 'package:flutter/material.dart';
import 'package:news/api/ApiManager.dart';
import 'package:news/app_colors.dart';
import 'package:news/home/news/news_item.dart';
import 'package:news/model/NewsResponse.dart';

class NewSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => showResults(context),
        icon: Icon(
          Icons.search,
          size: 32,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.close,
        size: 32,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return Center(child: Text('Suggestions'));
    }
    return Container(
      color: AppColors.whiteColor,


      child: FutureBuilder<NewsResponse?>(
        future: ApiManager.searchNews(query),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                  onPressed: () {
                    ApiManager.searchNews(query);
                  },
                  child: Text('Try Again'),
                ),
              ],
            );
          }
          if (snapshot.data!.status == 'error') {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Something went wrong'),
                  ElevatedButton(
                    onPressed: () {
                      ApiManager.searchNews(query);
                    },
                    child: Text('Try Again'),
                  ),
                ],
              ),
            );
          }
          var newsList = snapshot.data!.articles!;
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(news: newsList[index]);
              },
              itemCount: newsList.length,
            ),
          );
        },
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: AppColors.whiteColor,
          size: 35,
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        activeIndicatorBorder: BorderSide.none,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}

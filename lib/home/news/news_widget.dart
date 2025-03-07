import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';
import 'package:news/home/news/news_item.dart';
import 'package:news/api/ApiManager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNeswBySourceId(widget.source.id??''),
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
              Text('Something Went Wrong'),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getNeswBySourceId(widget.source.id ?? '');
                  setState(() {

                  });
                },
                child: Text('Try Again'),
              ),
            ],
          );
        }
        if (snapshot.data!.status == 'error') {
          return Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(
                onPressed: () {
                  ApiManager.getNeswBySourceId(widget.source.id ?? '');
                  setState(() {

                  });
                },
                child: Text('Try Again'),
              ),
            ],
          );
        }
        var newsList = snapshot.data!.articles!;
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsItem(news: newsList[index]);
          },
          itemCount: newsList.length,
        );
      },
    );
  }
}

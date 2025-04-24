import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';
import 'package:news/home/news/news_item.dart';
import 'package:news/home/news/news_widget_view_model.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id??'');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsWidgetViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            return Column(
              children: [
                Text(viewModel.errorMessage!),
                ElevatedButton(
                  onPressed: () {
                    viewModel.getNewsBySourceId(widget.source.id??'');
                  },
                  child: Text('Try Again'),
                ),
              ],
            );
          } else if (viewModel.newsList == null) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(news: viewModel.newsList![index]);
              },
              itemCount: viewModel.newsList!.length,
            );
          }
        },
      ),

      // FutureBuilder<NewsResponse?>(
      //   future: ApiManager.getNeswBySourceId(widget.source.id ?? ''),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: CircularProgressIndicator(
      //           color: AppColors.primaryColor,
      //         ),
      //       );
      //     } else if (snapshot.hasError) {
      //       return Column(
      //         children: [
      //           Text('Something Went Wrong'),
      //           ElevatedButton(
      //             onPressed: () {
      //               ApiManager.getNeswBySourceId(widget.source.id ?? '');
      //               setState(() {});
      //             },
      //             child: Text('Try Again'),
      //           ),
      //         ],
      //       );
      //     }
      //     if (snapshot.data!.status == 'error') {
      //       return Column(
      //         children: [
      //           Text(snapshot.data!.message!),
      //           ElevatedButton(
      //             onPressed: () {
      //               ApiManager.getNeswBySourceId(widget.source.id ?? '');
      //               setState(() {});
      //             },
      //             child: Text('Try Again'),
      //           ),
      //         ],
      //       );
      //     }
      //     var newsList = snapshot.data!.articles!;
      //     return ListView.builder(
      //       itemBuilder: (context, index) {
      //         return NewsItem(news: newsList[index]);
      //       },
      //       itemCount: newsList.length,
      //     );
      //   },
      // ),
    );
  }
}

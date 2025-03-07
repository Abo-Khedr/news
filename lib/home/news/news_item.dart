import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/app_colors.dart';
import 'package:news/home/news/news_details.dart';
import 'package:news/model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(news.publishedAt ?? '');
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetails.routeName , arguments: news);
      },
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                imageUrl: news.urlToImage!,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              news.author ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: AppColors.greyColor),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              news.title ?? '',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              DateFormat('dd-MM-yyy').format(date),
              textAlign: TextAlign.end,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: AppColors.greyColor),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}

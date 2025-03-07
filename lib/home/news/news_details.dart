import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/app_colors.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'News Details';

  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    DateTime date = DateTime.parse(news.publishedAt ?? '');

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text(
          'News',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
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
              height: 15,
            ),
            Text(
              news.content ?? '',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.greyColor,
                  ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                _launchUrl(news.url);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'View Full Article',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Icon(
                    Icons.arrow_right,
                    size: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(newsUrl) async {
    final Uri _url = Uri.parse(newsUrl);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}

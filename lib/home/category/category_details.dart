import 'package:flutter/material.dart';
import 'package:news/api/ApiManager.dart';
import 'package:news/app_colors.dart';
import 'package:news/home/category/category_details_view_model.dart';
import 'package:news/home/tabs/tab_widget.dart';
import 'package:news/model/Category.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails({super.key , required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
        ///  consumer => Listen to view model
        builder: (context, viewModel, child) {
          if(viewModel.errorMessage != null){
            return Column(
                      children: [
                        Text(viewModel.errorMessage!),
                        ElevatedButton(
                          onPressed: () {
                            viewModel.getSources(widget.category.id);
                          },
                          child: Text('Try Again'),
                        ),
                      ],
                    );
          }
          else if (viewModel.sourcesList == null) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }else{
            return TabWidget(sourcesList: viewModel.sourcesList!);
          }
        },
      ),

      // FutureBuilder<SourceResponse?>(
      //   future: ApiManager.getSources(widget.category.id),
      //   builder: (context, snapshot) {
      //     /// data loading
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: CircularProgressIndicator(
      //           color: AppColors.primaryColor,
      //         ),
      //       );
      //     }
      //
      //     /// error from user
      //     else if (snapshot.hasError) {
      //       return Column(
      //         children: [
      //           Text('Something went wrong'),
      //           ElevatedButton(
      //             onPressed: () {
      //               ApiManager.getSources(widget.category.id);
      //               setState(() {});
      //             },
      //             child: Text('Try Again'),
      //           ),
      //         ],
      //       );
      //     }
      //
      //     /// server (response) => error , success
      //     if (snapshot.data!.status != 'ok') {
      //       return Column(
      //         children: [
      //           Text(snapshot.data!.message!),
      //           ElevatedButton(
      //             onPressed: () {
      //               ApiManager.getSources(widget.category.id);
      //               setState(() {});
      //             },
      //             child: Text('Try Again'),
      //           ),
      //         ],
      //       );
      //     }
      //
      //     var listSources = snapshot.data!.sources!;
      //     return TabWidget(sourcesList: listSources);
      //   },
      // ),
    );
  }
}

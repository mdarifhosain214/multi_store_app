import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';
class SubCategoryProducts extends StatelessWidget {
  final String subCategoryName;
  final String mainCategoryName;
  const SubCategoryProducts({Key? key, required this.subCategoryName, required this.mainCategoryName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title:  AppBarTitle(title: subCategoryName),
        elevation: 0,
        leading: const AppBarBackButton(),
        ),
        body:Center(child: Text(mainCategoryName,style: const TextStyle(color: Colors.black),),),
    );
  }
}



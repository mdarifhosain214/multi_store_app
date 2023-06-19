import 'package:flutter/material.dart';

import '../minor_screens/sub_category_products.dart';
class SliderBar extends StatelessWidget {
  final String mainCategoryName;
  const SliderBar({
    super.key, required this.mainCategoryName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.05,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.brown.withOpacity(0.2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: RotatedBox(
            quarterTurns: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "<<",
                  style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 10),
                ),
                Text(
                  mainCategoryName.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 10),
                ),
                const Text(
                  ">>",
                  style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      letterSpacing: 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubCategoryModel extends StatelessWidget {
  final String mainCategoryName;
  final String subCategoryName;
  final String  asset;
  final String subCategoryLabel;
  const SubCategoryModel({
    super.key, required this.mainCategoryName, required this.subCategoryName, required this.asset, required this.subCategoryLabel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SubCategoryProducts(
                  mainCategoryName: mainCategoryName,
                  subCategoryName: subCategoryName,
                )));
      },
      child: Column(
        children: [
          SizedBox(
            height: 70,
            child: Image.asset(asset),
          ),
          Text(subCategoryLabel)
        ],
      ),
    );
  }
}

class CategoryHeaderLabel extends StatelessWidget {
  final String headerLabel;
  const CategoryHeaderLabel({
    super.key, required this.headerLabel,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(30),
      child: Text(
        headerLabel,
        style: const TextStyle(
            fontSize: 24,
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
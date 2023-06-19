import 'package:flutter/material.dart';
import '../utilities/categ_list.dart';
import '../widgets/category_widget.dart';

// List<String> label = [
//   "shirt",
//   "jeans",
//   "shirt",
//   "shirt",
// ];

class BagsCategory extends StatelessWidget {
  const BagsCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CategoryHeaderLabel(headerLabel:"bags"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 70,
                      children: List.generate(bags.length, (index) {
                        return SubCategoryModel(mainCategoryName: "bags",subCategoryName: bags[index],asset: "images/bags/bags$index.jpg",subCategoryLabel: bags[index],);
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
              bottom: 0,
              right: 0,
              child: SliderBar(mainCategoryName: "bags",))
        ],
      ),
    );
  }
}



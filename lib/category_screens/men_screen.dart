import 'package:flutter/material.dart';
import '../utilities/categ_list.dart';
import '../widgets/category_widget.dart';

// List<String> label = [
//   "shirt",
//   "jeans",
//   "shirt",
//   "shirt",
// ];

class MenCategory extends StatelessWidget {
  const MenCategory({Key? key}) : super(key: key);

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
                  const CategoryHeaderLabel(headerLabel:"men"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 70,
                      children: List.generate(men.length, (index) {
                        return SubCategoryModel(mainCategoryName: "men",subCategoryName: men[index],asset: "images/men/men$index.jpg",subCategoryLabel: men[index],);
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
              child: SliderBar(mainCategoryName: "men",))
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';
import '../utilities/categ_list.dart';
import '../widgets/category_widget.dart';
class HomeAndGardenCategory extends StatelessWidget {
  const HomeAndGardenCategory({Key? key}) : super(key: key);

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
                  const CategoryHeaderLabel(headerLabel: "home and garden"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 70,
                      children: List.generate(homeandgarden.length, (index) {
                        return SubCategoryModel(
                          mainCategoryName: "home and garden",
                          subCategoryName: shoes[index],
                          asset: "images/homegarden/home$index.jpg",
                          subCategoryLabel: homeandgarden[index],
                        );
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
              child: SliderBar(
                mainCategoryName: "home and garden",
              ))
        ],
      ),
    );
  }
}

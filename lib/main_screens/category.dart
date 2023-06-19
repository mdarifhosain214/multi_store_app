import 'package:flutter/material.dart';


import '../category_screens/bags.dart';
import '../category_screens/beauty.dart';
import '../category_screens/electronics.dart';
import '../category_screens/home_garden.dart';
import '../category_screens/kids_screen.dart';
import '../category_screens/men_screen.dart';
import '../category_screens/shoes_screen.dart';
import '../category_screens/women_screen.dart';
import '../widgets/fake_search.dart';
List<ItemsData>items=[
 ItemsData(label: "men"),
 ItemsData(label: "women"),
 ItemsData(label: "electronics"),
 ItemsData(label: "shoes"),
 ItemsData(label: "home & garden"),
 ItemsData(label: "beauty"),
 ItemsData(label: "Kids"),
 ItemsData(label: "bags"),

];
class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    items[0].isSelected=true;

  }
  final PageController _pageController= PageController();
  @override
  Widget build(BuildContext context) {

    var size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const FakeSearch(),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
              left: 0,
              child: sideNavigator(size)
          ),
          Positioned(
            bottom: 0,
              right: 0,
              child: categoryView(size),
          ),
        ],
      ),
    );
  }

  Widget sideNavigator(Size size){
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.8,
      width: MediaQuery.of(context).size.width*0.2,

      child: ListView.builder(
        itemCount: items.length,
          itemBuilder: (context,index){
        return  GestureDetector(onTap: (){
         _pageController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);
          // setState(() {
          //   for(var element in items)
          //     {
          //       element.isSelected=false;
          //     }
          //   items[index].isSelected=true;
          // });
        },
          child: Container(
            margin: const EdgeInsets.all(4),
            height:  MediaQuery.of(context).size.height*0.8/9,
            color: items[index].isSelected==true?Colors.white:Colors.grey.shade300,
            child: Center(child: Text(items[index].label)),
          ),
        );
      }),
    );
  }
  Widget categoryView(Size size){
    return Container(
      height: MediaQuery.of(context).size.height*0.8,
      width: MediaQuery.of(context).size.width*0.8,
      color: Colors.white,
      child: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: (value){
          setState(() {
            for(var element in items)
            {
              element.isSelected=false;
            }
            items[value].isSelected=true;
          });

        },
        children: const[
          MenCategory(),
          WomenCategory(),
          ElectronicsCategory(),
          ShoesCategory(),
          HomeAndGardenCategory(),
          BeautyCategory(),
          KidsCategory(),
          BagsCategory(),

        ],
      ),
    );
  }


}
class ItemsData{
  String label;
  bool isSelected;
  ItemsData({required this.label,this.isSelected=false});
}

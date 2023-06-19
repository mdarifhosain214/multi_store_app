import 'package:final_project/main_screens/store.dart';
import 'package:flutter/material.dart';
import 'category.dart';
import 'dashboard.dart';
import 'home.dart';
class SupplierHomeScreen extends StatefulWidget {
  const SupplierHomeScreen({Key? key}) : super(key: key);

  @override
  State<SupplierHomeScreen> createState() => _SupplierHomeScreenState();
}

class _SupplierHomeScreenState extends State<SupplierHomeScreen> {
  var _selectedIndex=0;
  final List<Widget>_tabs=const [
    HomeScreen(),
    CategoryPage(),
    StoreScreen(),
    Dashboard(),
    Center(child: Text("Upload"),),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        elevation: 0,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search,),label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.shop,),label: "Store"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard,),label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.upload,),label: "Upload"),
        ],
        onTap: (index){
          setState(() {
            _selectedIndex=index;
          });
        },
      ),
    );
  }
}

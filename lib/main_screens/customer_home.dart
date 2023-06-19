import 'package:final_project/main_screens/profile.dart';
import 'package:final_project/main_screens/store.dart';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'category.dart';
import 'home.dart';
class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  var _selectedIndex=0;
  final List<Widget>_tabs=const [
    HomeScreen(),
    CategoryPage(),
    StoreScreen(),
    CartScreen(),
    ProfileScreen(),
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
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,),label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person,),label: "Profile"),
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

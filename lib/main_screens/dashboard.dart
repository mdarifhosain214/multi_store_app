import 'package:flutter/material.dart';
import '../dashboard/edit_business.dart';
import '../dashboard/manage_products.dart';
import '../dashboard/my_store.dart';
import '../dashboard/supplier_balance.dart';
import '../dashboard/supplier_order.dart';
import '../dashboard/supplier_statics.dart';
import '../widgets/app_bar_widget.dart';
List<String>label =[
  "my store",
  "order",
  "edit profile",
  "manage products",
  "balance",
  "statics"
];
List<IconData>icons=[
  Icons.store,
  Icons.shop_2_outlined,
  Icons.edit,
  Icons.settings,
  Icons.attach_money,
  Icons.show_chart,
];
List<Widget>pages =const [
  MyStore(),
  SupplierOrders(),
  EditBusiness(),
  ManageProducts(),
  SupplierBalance(),
  SupplierStatics()
];

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: "Dashboard",),
        actions: [
          IconButton(onPressed: (){Navigator.pushReplacementNamed(context,"/welcome_screen");}, icon: const Icon(Icons.logout,color: Colors.black,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(crossAxisCount: 2,
        mainAxisSpacing: 50,
        crossAxisSpacing: 50,
        children: List.generate(6, (index){
          return InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> pages[index]));},
            child: Card(
              elevation: 20,
              shadowColor: Colors.purpleAccent.shade200,
              color: Colors.blueGrey.withOpacity(0.7),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(icons[index],size: 50,color: Colors.yellowAccent,),
                  Text(label[index],
                    style: const TextStyle(
                        letterSpacing:2,fontSize: 24,color: Colors.yellowAccent,fontWeight: FontWeight.w600,fontFamily: "Acme"),)
                ],
              ),
            ),
          );
        }),),
      ),
    );
  }
}

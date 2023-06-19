import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';
class CustomerOrders extends StatelessWidget {
  const CustomerOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: "Customer Orders",),
        leading: const AppBarBackButton(),),
    );
  }
}

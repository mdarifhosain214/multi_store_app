import 'package:flutter/material.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/yellow_button.dart';
class CartScreen extends StatefulWidget {
  final Widget? back;
  const CartScreen({Key? key,  this.back}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            leading: widget.back,
            title: const AppBarTitle(title: "Cart"),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.black,
                  ))
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Your Cart Is Empty !",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 50,
                ),
                Material(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.lightBlue,
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.6,
                    onPressed: () {
                      Navigator.canPop(context)?Navigator.pop(context):
                      Navigator.pushReplacementNamed(context, "/customer_home");
                    },
                    child: const Text(
                      "Continue Shopping",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Text(
                      "Total: \$ ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "0.00",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                YellowButton(label: "CHECK OUT",onPressed: (){},width: 0.45,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

import '../customer_screens/customer_order.dart';
import '../customer_screens/wish_list.dart';
import '../widgets/app_bar_widget.dart';
import 'cart.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Stack(
          children: [
            Container(
              height: 230,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.yellow,
                    Colors.brown,
                  ])

              ),
            ),
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  centerTitle: true,
                  pinned: true,
                  expandedHeight: 200,
                  backgroundColor: Colors.white,
                  flexibleSpace: LayoutBuilder(
                    builder: (context, constraints) {
                      return FlexibleSpaceBar(
                        title: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: constraints.biggest.height <= 120 ? 1 : 0,
                          child: const Center(
                            child: Text(
                              "Account",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        background: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                            Colors.yellow,
                            Colors.brown,
                          ],),),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 25,left: 30),
                            child: Row(children: [
                              const CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage("images/inapp/guest.jpg"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Text("guest".toUpperCase(),style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 24),),
                              )
                            ],),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.2,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        bottomLeft: Radius.circular(30)),
                                    color: Colors.black54),
                                child: TextButton(
                                  child: SizedBox(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width*0.2,
                                    child: const Center(
                                        child: Text(
                                      "Cart",
                                      style:
                                          TextStyle(fontSize: 20, color: Colors.yellow),
                                    )),
                                  ),
                                  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const CartScreen(back: AppBarBackButton(),)));},
                                ),
                              ),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.2,
                                color: Colors.yellow,
                                child: TextButton(
                                  child: SizedBox(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width*0.2,
                                    child: const Center(
                                        child: Text(
                                      "Orders",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black54),
                                    ),
                                    ),
                                  ),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const CustomerOrders()));
                                  },
                                ),
                              ),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.2,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30),
                                        bottomRight: Radius.circular(30)),
                                    color: Colors.black54),
                                child: TextButton(
                                  child: SizedBox(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width*0.2,
                                    child: const Center(
                                        child: Text(
                                      "Wishlist",
                                      style:
                                          TextStyle(fontSize: 18, color: Colors.yellow),
                                    )),
                                  ),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const WishList()));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.grey.shade300,
                          child: Column(children: [
                            SizedBox(
                              height: 150,
                              child: Image.asset(
                                "images/inapp/logo.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const ProfileHeaderLabel(label: "  Account Info.  "),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                height: 260,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16)),
                                child: const Column(
                                  children: [
                                    RepeatedListTile(
                                      title: "Email Address",
                                      subTitle: "example@gmail.com",
                                      icon: Icons.email,
                                    ),
                                    YellowDivider(),
                                    RepeatedListTile(
                                      title: "Phone Number",
                                      subTitle: "+8801xxxxxxxxx",
                                      icon: Icons.phone,
                                    ),
                                    YellowDivider(),
                                    RepeatedListTile(
                                      title: "Address",
                                      subTitle:
                                      "example:Road-5, Block-A,Section-2,Mirpur",
                                      icon: Icons.location_pin,

                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const ProfileHeaderLabel(
                              label: "  Account Setting  ",
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                height: 260,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Column(
                                  children: [
                                    RepeatedListTile(
                                      title: "Edit Profile",
                                      subTitle: "",
                                      icon: Icons.edit,
                                      onPress: () {},
                                    ),
                                    const YellowDivider(),
                                    RepeatedListTile(
                                      title: "Change Password",
                                      subTitle: "",
                                      icon: Icons.lock,
                                      onPress: () {},
                                    ),
                                    const YellowDivider(),
                                    RepeatedListTile(
                                      title: "Log Out",
                                      subTitle: "",
                                      icon: Icons.logout,
                                      onPress: () {Navigator.pushReplacementNamed(context, "/welcome_screen");},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],),
                        )

                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class YellowDivider extends StatelessWidget {
  const YellowDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        color: Colors.yellow,
        thickness: 1,
      ),
    );
  }
}

class RepeatedListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Function()? onPress;

  const RepeatedListTile({
    super.key,
    required this.title,
    this.subTitle='',
    required this.icon,
     this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        leading: Icon(icon),
      ),
    );
  }
}

class ProfileHeaderLabel extends StatelessWidget {
  final String label;

  const ProfileHeaderLabel({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                letterSpacing: 1),
          ),
          const SizedBox(
            height: 40,
            width: 50,
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

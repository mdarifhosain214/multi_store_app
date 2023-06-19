import 'package:flutter/material.dart';

import '../widgets/fake_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const FakeSearch(),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.yellowAccent.shade700,
            indicatorWeight: 5,
            tabs: const [
              RepeatedTab(label: "Men"),
              RepeatedTab(label: "Women"),
              RepeatedTab(label: "Electronics"),
              RepeatedTab(label: "accessories"),
              RepeatedTab(label: "Shoes"),
              RepeatedTab(label: "home & garden"),
              RepeatedTab(label: "beauty"),
              RepeatedTab(label: "kids"),
              RepeatedTab(label: "bags"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text("Men Screen"),
            ),
            Center(
              child: Text("Women Screen"),
            ),
            Center(
              child: Text("electronics Screen"),
            ),
            Center(
              child: Text("accessories Screen"),
            ),
            Center(
              child: Text("Shoes Screen"),
            ),
            Center(
              child: Text("home & garden Screen"),
            ),
            Center(
              child: Text("beauty Screen"),
            ),
            Center(
              child: Text("Kids Screen"),
            ),
            Center(
              child: Text("Begs Screen"),
            ),
          ],
        ),
      ),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  final String label;

  const RepeatedTab({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: TextStyle(color: Colors.grey.shade500),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodys_admin/views/screens/home/home_widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      drawer: const CustomDrawer(),

    );
  }
}

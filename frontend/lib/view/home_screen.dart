import 'package:flutter/material.dart';

import '../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: () => Utils.toastmessage('No Internet Connection'),
          child: const Center(
            child: Text('Home Screen'),
          )),
    );
  }
}

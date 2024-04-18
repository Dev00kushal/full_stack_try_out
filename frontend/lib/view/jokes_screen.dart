import 'package:blog_application/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

class JokesScreen extends StatelessWidget {
  const JokesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.jokesCreationScreen);
            },
            child: const Text('Create'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.jokesViewScreen);
            },
            child: const Text('Read'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Update'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Delete'),
          ),
        ],
      ),
    ));
  }
}

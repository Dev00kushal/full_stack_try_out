import 'package:blog_application/model/jokes_model.dart';
import 'package:blog_application/view_model/jokes_view_model.dart';
import 'package:flutter/material.dart';

class ViewJokesScreen extends StatefulWidget {
  const ViewJokesScreen({super.key});

  @override
  _ViewJokesScreenState createState() => _ViewJokesScreenState();
}

class _ViewJokesScreenState extends State<ViewJokesScreen> {
  final JokesViewModel _getJokes = JokesViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokes'),
      ),
      body: FutureBuilder<List<Joke>>(
        future: _getJokes.getJokes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // print(snapshot.error);
            // Check the type of error
            if (snapshot.error is String) {
              // Handle string errors
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.error is Map<String, dynamic>) {
              // Handle map errors
              final errorData = snapshot.error as Map<String, dynamic>;
              return Center(child: Text('Error: ${errorData['message']}'));
            } else {
              // print('Error type: ${snapshot.error.runtimeType}');
              // print(snapshot.error);
              return const Center(
                  child: Text(
                'An unknown error occurred',
                style: TextStyle(fontSize: 28, color: Colors.red),
              ));
            }
          } else {
            print('Data Type: ${snapshot.data.runtimeType}');
            final jokes = snapshot.data ?? [];
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: jokes.map((joke) {
                  return Card(
                    child: ListTile(
                      title: Text(joke.title),
                      subtitle: Text(joke.description),
                    ),
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}

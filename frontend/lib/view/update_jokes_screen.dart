import 'package:blog_application/model/jokes_model.dart';
import 'package:blog_application/view_model/jokes_view_model.dart';
import 'package:flutter/material.dart';

class UpdateJokesScreen extends StatefulWidget {
  final Joke joke;
  const UpdateJokesScreen({super.key, required this.joke});

  @override
  _UpdateJokesScreenState createState() => _UpdateJokesScreenState();
}

class _UpdateJokesScreenState extends State<UpdateJokesScreen> {
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
            if (snapshot.error is String) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
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
                      trailing: IconButton(
                          icon: const Icon(Icons.edit), onPressed: () {}),
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

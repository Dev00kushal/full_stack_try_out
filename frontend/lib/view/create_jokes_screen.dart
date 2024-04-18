import 'package:flutter/material.dart';

import '../model/jokes_model.dart';
import '../view_model/jokes_view_model.dart';

class JokeCreatorScreen extends StatefulWidget {
  const JokeCreatorScreen({super.key});

  @override
  _JokeCreatorScreenState createState() => _JokeCreatorScreenState();
}

class _JokeCreatorScreenState extends State<JokeCreatorScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final JokesViewModel _jokesViewModel = JokesViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Joke'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Joke Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Joke Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                int id = 0;
                setState(() {
                  id++;
                });
                Joke joke = Joke(
                  id: id,
                  title: _titleController.text,
                  description: _descriptionController.text,
                );
                _jokesViewModel.addJokes(joke);
              },
              child: const Text('Save Joke'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}

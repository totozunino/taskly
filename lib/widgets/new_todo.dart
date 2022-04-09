import 'package:flutter/material.dart';

class NewTodo extends StatelessWidget {
  NewTodo({Key? key}) : super(key: key);

  final _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "What todo do you want to create?",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          TextField(
            controller: _inputController,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(_inputController.text);
            },
            child: const Text('ADD'),
          )
        ],
      ),
    );
  }
}

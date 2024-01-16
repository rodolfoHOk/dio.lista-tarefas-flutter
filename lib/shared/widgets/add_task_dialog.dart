import 'package:flutter/material.dart';

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var descriptionController = TextEditingController(text: "");

    return AlertDialog(
      title: const Text("Adicionar Tarefa"),
      content: TextFormField(
        keyboardType: TextInputType.text,
        controller: descriptionController,
        decoration: const InputDecoration(
          labelText: "Descrição",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.deepPurple,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.deepPurple,
            ),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancelar"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Adicionar"),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lista_tarefas_app/models/task.dart';
import 'package:lista_tarefas_app/services/task_provider.dart';

class AddTaskDialog extends StatelessWidget {
  final TaskProvider taskProvider;

  const AddTaskDialog({super.key, required this.taskProvider});

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
          onPressed: () async {
            await taskProvider
                .add(Task.create(descriptionController.text, false));
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
          child: const Text("Adicionar"),
        ),
      ],
    );
  }
}

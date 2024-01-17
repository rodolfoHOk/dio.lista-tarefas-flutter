import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lista_tarefas_app/services/task_provider.dart';

class JustNotCompletedSwitch extends StatelessWidget {
  const JustNotCompletedSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Listar apenas não concluídos",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Consumer<TaskProvider>(builder: (context, taskProvider, widget) {
            return Switch(
              value: taskProvider.justNotCompleted,
              onChanged: (value) async {
                await Provider.of<TaskProvider>(context, listen: false)
                    .setJustNotCompleted(value);
              },
            );
          }),
        ],
      ),
    );
  }
}

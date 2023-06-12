import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Habits extends StatelessWidget {
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;
  Habits(
      {super.key,
      required this.habitName,
      required this.habitCompleted,
      required this.onChanged,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteTask,
            backgroundColor: Colors.red.shade300,
            icon: Icons.remove,
            borderRadius: BorderRadius.circular(10),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.green[300]),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Checkbox(
                  value: habitCompleted,
                  onChanged: onChanged,
                ),
                Text(
                  habitName,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

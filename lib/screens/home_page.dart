import 'package:flutter/material.dart';
import 'package:habit_tracker/screens/habits.dart';

import '../components/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List habits = [
    ["Fitness", false],
    ["Eating Healthy", false]
  ];

  void checkboxChanged(bool? value, int index) {
    setState(() {
      habits[index][1] = !habits[index][1];
    });
  }

  void saveNewHabit() {
    setState(
      () {
        habits.add(
          [_controller.text, false],
        );
        _controller.clear();
        Navigator.of(context).pop();
      },
    );
  }

  void cancelNewHabit() {
    _controller.clear();
    Navigator.of(context).pop();
  }

  void removeHabit(index) {
    setState(() {
      habits.removeAt(index);
    });
  }

  void openDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          save: saveNewHabit,
          cancel: cancelNewHabit,
          controller: _controller,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: openDialog,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: const Text('Habit Tracker'),
      ),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          return Habits(
            habitName: habits[index][0].toString(),
            habitCompleted: habits[index][1],
            onChanged: (value) {
              checkboxChanged(value, index);
            },
            deleteTask: (context) => removeHabit(index),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'my_buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback save;
  VoidCallback cancel;
  DialogBox(
      {super.key,
      required this.save,
      required this.cancel,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(
                buttonName: 'Save',
                onPressed: save,
              ),
              const SizedBox(
                width: 10,
              ),
              MyButton(
                buttonName: 'Cancel',
                onPressed: cancel,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

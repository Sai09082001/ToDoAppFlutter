import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModelBottom extends StatelessWidget {
  ModelBottom({Key? key, required this.addTask}) : super(key: key);

  final Function addTask;

  //TextEditingController controller = TextEditingController();
  String textValue = '';
  void _handleOnClick(BuildContext context) {
    if (textValue.isEmpty) {
      return;
    }
    addTask(textValue);
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
             TextField(
                 onChanged: (text) {
                   textValue = text;
                   },
                 decoration: const InputDecoration(labelText: "Your Task",
                     border: OutlineInputBorder())
            ),
            const SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(onPressed: ()=> _handleOnClick(context), child: const Text("Add Task")))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:to_do_app/model/items.dart';
import 'package:to_do_app/widget/cart_body_widget.dart';
import 'package:to_do_app/widget/model_bottom.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItems> items =[
    DataItems('1', "Tập thể dục"),
    DataItems('2', "Bơi lội"),
    DataItems('3', "Làm việc"),
    DataItems('4', "Ăn trưa"),
    DataItems('5', "Chơi game")
  ];

  void _handleAddTask(String name){
    final newItems = DataItems(DateTime.now().toString(), name);
    setState(() {
      items.add(newItems);
    });
  }
  void _handleDeleteTask(String id){
    setState(() {
      items.removeWhere((element) => element.id == id);
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text("ToDoList", style: TextStyle(fontSize: 40, color: Colors.white))
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(children: items.map((item) => CardBody(
              index : items.indexOf(item),
              item : item, deleteTask: _handleDeleteTask)).toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
             showModalBottomSheet(
               backgroundColor: Colors.grey[400],
               shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top : Radius.circular(20))),
                 isScrollControlled: true,
                 context: context,
                 builder: (BuildContext content){
                return ModelBottom(addTask : _handleAddTask);
             });
        }, child: const Icon(Icons.add, size: 40))
      );
  }
}
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  CardBody({Key? key, required this.item, required this.deleteTask, required this.index}) : super(key: key);

  var item;
  var index;
  final Function deleteTask;
  void _handleDelete(String id) {
     deleteTask(id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20),
        height: 70,
        decoration: BoxDecoration(
            color: (index%2 == 0) ? Colors.green : Colors.grey,
            borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.name,
                style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xff4B4B4B),
                    fontWeight: FontWeight.bold)),
               InkWell(
                  onTap: () async{
                    if (await confirm(context)) {
                      return _handleDelete(item.id);
                    }
                    return;
                  },
                  child: const Icon(Icons.delete_outline, color: Color(0xff4B4B4B), size: 20,))
            ],
          ),
        )
    );
  }
}

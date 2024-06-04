import 'package:flutter/material.dart';
import 'package:getitdone/models/items_data.dart';
import 'package:intl/intl.dart';

class ItemCard extends StatelessWidget {
  final String title;
  bool isDone;
  final Function toggleStatus;
  final Function delete;

  ItemCard(this.title, this.isDone, this.toggleStatus,this.delete, {super.key});

  @override
  Widget build(BuildContext context) {

    return Dismissible(
      onDismissed: (direction) => delete(direction),
      key: UniqueKey(),
      child: Card(
        color: isDone ? Colors.grey.shade200 : Colors.white,
        elevation: isDone ? 1 : 5,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(color: Colors.black,decoration: isDone ? TextDecoration.lineThrough:TextDecoration.none),
          ),
      
          trailing: Checkbox(
            value: isDone,
            onChanged: (value) => toggleStatus(value),
            checkColor: Colors.white,
              side: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

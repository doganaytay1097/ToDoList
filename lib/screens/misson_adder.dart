


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/items_data.dart';

class MissionAdder extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              maxLines: 2,
              minLines: 1,
              style: TextStyle(fontSize: 20,color: Colors.black),
              controller: textEditingController,
              decoration: InputDecoration(
              focusedBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
              labelText: 'Add Misson',
            ),
            autofocus: true,
            ),

            TextButton(onPressed: () {
              Provider.of<ItemData>(context,listen: false).addItem(textEditingController.text);
              Navigator.pop(context);
            }, child: Text('ADD',style: TextStyle(color: Theme.of(context).primaryColor),)),
          ],
        ),
      ),
    );
  }
}

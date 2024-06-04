import 'dart:async';

import 'package:flutter/material.dart';
import 'package:getitdone/models/items_data.dart';
import 'package:getitdone/screens/misson_adder.dart';
import 'package:getitdone/screens/setting_page.dart';
import 'package:getitdone/widgets/item_card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        elevation: 10.0,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(),));
          }, icon: Icon(Icons.settings,color: Colors.white,),),

        ],
          title: Text(
                      'Get It Done',
                    ),
          ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // height: 150,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      '${Provider.of<ItemData>(context).items.length} Mission ',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Text(DateFormat("HH:mm:ss").format(now),
                        style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Consumer<ItemData>(builder:(context, itemData, child) => Align(
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: itemData.items.length,
                      itemBuilder: (context, index) => ItemCard(
                        itemData.items[index].title,
                        Provider.of<ItemData>(context).items[index].isDone,
                            (_) {
                          Provider.of<ItemData>(context, listen: false)
                              .toggleStatus(index);
                        },
                            (_) {
                          Provider.of<ItemData>(context, listen: false)
                              .deleteItem(index);
                        },
                      ),
                    ),
                  ),),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(25),
            ),
            context: context,
            builder: (context) => SingleChildScrollView(child: MissionAdder()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

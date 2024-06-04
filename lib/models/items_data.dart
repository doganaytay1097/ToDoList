import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'item.dart';

class ItemData with ChangeNotifier {
  final List<Item> _items = [
    // Item('peynir al', false),
    // Item('çöpü at', false),
    // Item('faturayı öde', false),
  ];

  static late SharedPreferences _sharedPrefer;
  List<String> _itemsString = [];

  void toggleStatus(int index) {
    _items[index].toggleStatus();
    saveItems(_items);
    notifyListeners();
  }

  void addItem(String title) {
    _items.add(Item(title, false));
    saveItems(_items);
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    saveItems(_items);
    notifyListeners();
  }

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  Future<void> createPrefObject() async {
    _sharedPrefer = await SharedPreferences.getInstance();
  }

  void saveItems(List<Item> items) {
    _itemsString.clear();
    for (var item in items) {
      _itemsString.add(json.encode(item.toMap()));
    }
    _sharedPrefer.setStringList('toDo', _itemsString);
  }

  void loadItems() {
    List<String>? tempList = _sharedPrefer.getStringList('toDo');
    if (tempList != null) {
      _items.clear();
      for (var item in tempList) {
        _items.add(Item.fromMap(jsonDecode(item)));
      }
    }
  }
}
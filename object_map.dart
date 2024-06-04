import 'dart:convert';

main() {
  Items item = Items("uyu", true);
  print('itemIbject: $item');
  print('itemIbject Type: ${item.runtimeType}');

  Map itemAsMap = item.toMap();
  print('itemAsMap: $itemAsMap');
  print('itemAsMap Type: ${itemAsMap.runtimeType}');

  String itemAsJson = json.encode(itemAsMap);
  print('itemAsJson: $itemAsJson');
  print('itemAsJson Type: ${itemAsJson.runtimeType}');

  itemAsMap = jsonDecode(itemAsJson);
  //item = Items(itemAsMap['title'], itemAsMap['isDone']);
  //item = Items.fromMap(itemAsMap);
  print(item);
}

class Items {
  String title;
  bool isDone;

  Items(this.title, this.isDone);

  Items.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        isDone = map['isDone'];

  Map<String, dynamic> toMap() => {'title': title, 'isDone': isDone};
}

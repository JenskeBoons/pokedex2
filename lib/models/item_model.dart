class Item {
  int id;
  String name;
  String img;

  Item.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'],
        img = data['img'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'img': img};
}
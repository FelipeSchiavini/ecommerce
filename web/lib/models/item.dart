class Item {
  final bool done;
  final String title;

  Item(this.done, this.title);

  Item.fromJson(Map<String, dynamic> json)
      : done = json['done'],
        title = json['email'];

  Map<String, dynamic> toJson() =>
    {
      'done': done,
      'title': title,
    };
}

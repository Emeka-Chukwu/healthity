class Currency {
  String price;

  static String format(String price) {
    if (price.length > 2) {
      var value = price;
      print(value);
      value = value.replaceAll(RegExp(r'\D'), '');
      print(value);
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      // var list = value.split("");
      // list.removeLast();
      // print(list.join(""));

      // value.split("").removeLast();
      // print(value);
      // print(list.splitMapJoin(""));
      return value;
    }
    return null;
  }
}

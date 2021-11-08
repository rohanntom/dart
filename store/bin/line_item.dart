import 'dart:io';
import 'dart:core';

class LineItem {
  List<String> productName = [];
  List<double> quantity = [];
  List<double> mrp = [];
  List<double> amount = [];
  void lineItem() {
    double quantities, price, total;
    String? itemName;
    stdout.write('\nEnter the product: ');
    itemName = stdin.readLineSync();
    if (itemName == null || itemName.isEmpty) {
      throw Exception('Enter a valid product');
    }
    stdout.write('Enter the quantity: ');
    try {
      quantities = double.parse(stdin.readLineSync()!);
    } on FormatException {
      throw Exception('Enter a valid quantity');
    }
    if (quantities <= 0) {
      throw Exception('Enter a valid quantity');
    }

    stdout.write('Enter the price per quantity: ');
    try {
      price = double.parse(stdin.readLineSync()!);
    } on FormatException {
      throw Exception('Enter a valid price');
    }
    total = (quantities * price) * 1.18;

    productName.add(itemName);
    quantity.add(quantities);
    mrp.add(price);
    amount.add(total);
    print('Amount: Rs.${total.toStringAsFixed(2)}');
  }
}

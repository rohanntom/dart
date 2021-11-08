import 'line_item.dart';
import 'dart:io';
import 'dart:core';

class Invoice {
  final list = LineItem();
  final date = DateTime.now();

  void billing(List revenue) {
    int input;
    int count = 0;
    try {
      while (true) {
        print('\n1. Add Item');
        print('2. Show the Invoice');
        print('3. Close the Invoice');
        stdout.write('Enter your choice: ');
        input = int.parse(stdin.readLineSync()!);
        if (input == 1) {
          list.lineItem();
          count++; //counts number of items
        } else if (input == 2) {
          fetchInvoice(count);
          double totalAmount = 0;
          list.amount.forEach((double e) {
            totalAmount = totalAmount + e;
          });
          print('Total is: Rs.${totalAmount.toStringAsFixed(2)}');
        } else if (input == 3) {
          fetchInvoice(count);
          double totalAmount = 0;
          list.amount.forEach((double e) {
            totalAmount = totalAmount + e;
          });
          revenue.add(
              totalAmount); //adds total amount of the invoice to list revenue
          print('Total is: Rs.${totalAmount.toStringAsFixed(2)}');
          print('\n*Invoice completed*');
          print('   *Visit again*\n\n');
          break;
        } else {
          throw Exception('Please enter a valid choice');
        }
      }
    } catch (e) {
      print('Exception occurs: $e');
    }
  }

  void fetchInvoice(int count) {
    print('\n\n         **INVOICE**');
    print('Date: $date\n');
    for (int i = 0; i <= count - 1; i++) {
      print('Serial number: ${i + 1}');
      print('Product: ${list.productName[i]}');
      print('Quantity: ${list.quantity[i]}');
      print('MRP: ${list.mrp[i]}');
      print('Amount: Rs.${list.amount[i].toStringAsFixed(2)}\n');
    }
  }

  void totalSale(revenue) {
    double profit;
    double totalSale = 0;
    revenue.forEach((double e) {
      totalSale = totalSale + e;
    });
    profit = totalSale / 1.18;
    print(
        '\nThe total sale is: Rs.${totalSale.toStringAsFixed(2)} and the revenue is: Rs.${profit.toStringAsFixed(2)} after tax\n');
  }
}

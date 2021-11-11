import 'dart:io';

import 'new_invoice.dart';

class StoreManagementApp {
  final List<NewInvoice> invoices = [];

  void start() {
    int input;
    try {
      while (true) {
        print('  ***Store Management***');
        print('1. Create a New Invoice');
        print('2. View Total Sale');

        print(
            '3. View all invoices'); // prints invoice serial number, date, amount.
        // 1. 09/11/12 Amount  = Rs. 100
        // 2. 09/11/12 Amount  = Rs. 2200
        // 3. 09/11/12 Amount  = Rs. 22003

        print(
            "4. Edit Invoice"); // takes the serial number of the invoice and start billing.
        // Which invoice you want to edit?
        // 2
        print('5. Exit');

        stdout.write('Enter your choice: ');

        input = int.parse(stdin.readLineSync()!);

        if (input == 1) {
          this._createNewInvoice();
        } else if (input == 2) {
          this._viewTotalSale();
        } else if (input == 3) {
          this._viewAllInvoices();
        } else if (input == 4) {
          this._viewAllInvoices();
          stdout.write('Enter the invoice number to be edited: ');
          int input1 = int.parse(stdin.readLineSync()!);
          this._editInvoice(input1);
        } else if (input == 5) {
          print('  **Quitting**');
          break;
        } else {
          throw Exception('Enter a valid choice');
        }
      }
    } catch (e) {
      print('Exception occurs: $e');
    }
  }

  void _createNewInvoice() {
    final invoice = NewInvoice();
    this.invoices.add(invoice);

    this._startInvoiceBilling(invoice);
  }

  void _viewTotalSale() {
    double totalAmount = 0;
    double totalAmountWithTax = 0;
    for (var invoice in this.invoices) {
      totalAmount = totalAmount + invoice.calcTotalAmount();
      totalAmountWithTax =
          totalAmountWithTax + invoice.calcTotalAmountWithTax();
    }
    print(
        '\nThe total sale is: Rs.${totalAmountWithTax.toStringAsFixed(2)} and the revenue after tax is: Rs.${totalAmount.toStringAsFixed(2)} \n');
  }

  void _startInvoiceBilling(NewInvoice invoice) {
    int input;
    try {
      while (true) {
        print('\n1. Add Item');
        print('2. Show the Invoice');
        print('3. Close the Invoice');
        stdout.write('Enter your choice: ');
        input = int.parse(stdin.readLineSync()!);
        if (input == 1) {
          this._addInvoiceLineItem(invoice);
        } else if (input == 2) {
          this._showInvoice(invoice);
        } else if (input == 3) {
          this._showInvoice(invoice);
          print(
              'Total is: Rs.${invoice.calcTotalAmountWithTax().toStringAsFixed(2)}');
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

  void _addInvoiceLineItem(NewInvoice invoice) {
    double quantity;
    double price;
    String? itemName;
    stdout.write('\nEnter the product: ');
    itemName = stdin.readLineSync();
    if (itemName == null || itemName.isEmpty) {
      throw Exception('Enter a valid product');
    }

    stdout.write('Enter the quantity: ');
    try {
      quantity = double.parse(stdin.readLineSync()!);
    } on FormatException {
      throw Exception('Enter a valid quantity');
    }

    if (quantity <= 0) {
      throw Exception('Enter a valid quantity');
    }

    stdout.write('Enter the price per quantity: ');
    try {
      price = double.parse(stdin.readLineSync()!);
    } on FormatException {
      throw Exception('Enter a valid price');
    }

    invoice.addItem(itemName, quantity, price);
  }

  void _showInvoice(NewInvoice invoice) {
    print('\n\n         **INVOICE**');
    print('Date: ${invoice.date}\n');

    for (var i = 0; i < invoice.lineItems.length; i++) {
      print('Serial number: ${i + 1}');
      final lineItem = invoice.lineItems[i];

      print('Product: ${lineItem.productName}');
      print('Quantity: ${lineItem.quantity}');
      print('MRP: ${lineItem.mrp}');
      print('Amount: Rs.${lineItem.amount.toStringAsFixed(2)}');
      print(
          'Amount with tax: Rs.${lineItem.amountWithTax.toStringAsFixed(2)}\n');
    }
  }

  void _viewAllInvoices() {
    int count = 1;
    for (var invoice in this.invoices) {
      print('\n\nInvoice Number: $count');
      _showInvoice(invoice);
      count++;
    }
  }

  void _editInvoice(input1) {
    int count = 1;
    for (var invoice in this.invoices) {
      if (input1 == count) {
        _startInvoiceBilling(invoice);
        break;
      } else {
        count++;
      }
    }
  }
}

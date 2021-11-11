import 'new_line_item.dart';

class NewInvoice {
  final date = DateTime.now();
  List<NewLineItem> lineItems = [];

  void addItem(String productName, double quantity, double mrp) {
    final lineItem = NewLineItem(productName, quantity, mrp);

    this.lineItems.add(lineItem);
  }

  double calcTotalAmount() {
    double totalAmount = 0;

    //   for (var i = 0; i < this.lineItem.length; i++) {
    //       final lineItem = this.lineItem[i];

    //       totalAmount = totalAmount + lineItem.amount;
    //   }

    for (var lineItem in this.lineItems) {
      totalAmount = totalAmount + lineItem.amount;
    }

    // totalAmount = this.lineItems.fold(0.0, (acc, item) {
    //     acc = acc + item.amount;
    //     return acc;
    // });

    return totalAmount;
  }

  double calcTotalAmountWithTax() {
    double totalAmountWithTax = 0;
    for (var lineItem in this.lineItems) {
      totalAmountWithTax = totalAmountWithTax + lineItem.amountWithTax;
    }
    return totalAmountWithTax;
  }
}

class NewLineItem {
  final String productName;
  final double quantity;
  final double mrp;

  double get amount {
    return this.mrp * this.quantity;
  }

  double get amountWithTax {
    return this.amount * 1.18;
  }

  NewLineItem(this.productName, this.quantity, this.mrp);
}

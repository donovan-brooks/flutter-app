class SendInvoice {
  final String customerEmail;
  final String dueDate;
  final double total;
  final String paymentRequestNote;
  final List<Map<String, dynamic>> items;

  SendInvoice({
    this.customerEmail,
    this.dueDate,
    this.total,
    this.paymentRequestNote,
    this.items,
  });
}

class SendInvoiceItemsList {
  final double price;
  final int quantity;
  final String description;
  final String title;

  SendInvoiceItemsList(this.price, this.quantity, this.description, this.title);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'price': price,
      'description': description,
      'quantity': quantity,
    };
  }
}

class ItemTiles {
  final String description;
  final int quantity;

  ItemTiles(this.description, this.quantity);
}

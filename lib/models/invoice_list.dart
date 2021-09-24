import 'dart:convert';

import 'package:intl/intl.dart';

class InvoiceList {
  InvoiceList(
    this.invoiceList,
    this.statusCode,
    this.message,
  );
  List<Invoice> invoiceList;
  String message;
  int statusCode;
}

DateTime formatDateTimeFromUtc(dynamic time) {
  try {
    return DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(time);
  } catch (e) {
    return DateTime.now();
  }
}

List<Invoice> invoiceListFromJson(String str) =>
    List<Invoice>.from(json.decode(str).map((x) => Invoice.fromMap(x)));

String invoiceListToJson(List<Invoice> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Invoice {
  int id;
  int teamId;
  String number;
  String frequency;
  DateTime dueDate;
  String total;
  String status;
  String paymentRequestNote;
  String type;
  String customerName;
  Invoice({
    this.id,
    this.teamId,
    this.number,
    this.frequency,
    this.dueDate,
    this.total,
    this.status,
    this.paymentRequestNote,
    this.type,
    this.customerName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'teamId': teamId,
      'number': number,
      'frequency': frequency,
      'dueDate': dueDate.toUtc().toString(),
      'total': total,
      'status': status,
      'paymentRequestNote': paymentRequestNote,
      'type': type,
      'customer_name': customerName,
      // 'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory Invoice.fromMap(Map<String, dynamic> map) {
    return Invoice(
        id: map['id'],
        teamId: map['team_id'],
        number: map['number'],
        frequency: map['frequency'],
        dueDate: formatDateTimeFromUtc(map['due_date']),
        total: map['total'].toString(),
        status: map['status'],
        paymentRequestNote: map['payment_request_note'],
        type: map['type'],
        customerName: map['customer_name']
        // items: List<Item>.from(map['items'].map((x) => Item.fromMap(x))),
        );
  }
}

class Item {
  int id;
  dynamic quickbooksId;
  int lineItemableId;
  String lineItemableType;
  String title;
  int price;
  dynamic description;
  int quantity;
  DateTime createdAt;
  DateTime updatedAt;
  Item({
    this.id,
    this.quickbooksId,
    this.lineItemableId,
    this.lineItemableType,
    this.title,
    this.price,
    this.description,
    this.quantity,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quickbooksId': quickbooksId,
      'lineItemableId': lineItemableId,
      'lineItemableType': lineItemableType,
      'title': title,
      'price': price,
      'description': description,
      'quantity': quantity,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      quickbooksId: map['quickbooksId'],
      lineItemableId: map['lineItemableId'],
      lineItemableType: map['lineItemableType'],
      title: map['title'],
      price: map['price'],
      description: map['description'],
      quantity: map['quantity'],
      createdAt: formatDateTimeFromUtc(map['createdAt']),
      updatedAt: formatDateTimeFromUtc(map['updatedAt']),
    );
  }
}

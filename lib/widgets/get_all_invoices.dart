import 'package:flutter/material.dart';
import 'package:Honeydu/models/invoice_list.dart';
import 'package:Honeydu/services/get_invoice_services.dart';
import 'package:Honeydu/widgets/list_tile_widget.dart';

class GetAllInvoices extends StatelessWidget {
  final double width;

  const GetAllInvoices({Key key, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: getInvoices(),
        builder: (_, AsyncSnapshot<InvoiceList> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            InvoiceList data = snapshot.data;
            return Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.invoiceList.length,
                itemBuilder: (context, index) => listViewTiles(
                  context,
                  data.invoiceList.elementAt(index),
                  width: width,
                ),
              ),
            );
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

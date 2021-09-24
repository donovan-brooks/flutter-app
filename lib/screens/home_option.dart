import 'package:flutter/material.dart';
import 'package:Honeydu/screens/cashout.dart';
import 'package:Honeydu/screens/help.dart';
import 'package:Honeydu/screens/your_own_profile.dart';
import 'package:Honeydu/services/get_balance_services.dart';
import 'package:Honeydu/widgets/elevated_button_container.dart';
import 'package:Honeydu/widgets/get_all_invoices.dart';
import 'package:Honeydu/widgets/text_widget.dart';

class HomeOption extends StatefulWidget {
  @override
  _HomeOptionState createState() => _HomeOptionState();
}

class _HomeOptionState extends State<HomeOption>
    with SingleTickerProviderStateMixin {
  double width;
  String balance = null;
  double height;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Text(
              'C',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Help(),
              ),
            ),
            icon: Icon(
              Icons.help_outline_outlined,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => YourOwnProfile(),
              ),
            ),
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: FutureBuilder(
                      future: inquiryBalance(),
                      builder:
                          (context, AsyncSnapshot<BalanceDetails> snapshot) {
                        String beforeDecimal = "0";
                        String afterDecimal = ".00";
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData) {
                          if (snapshot.data.available
                              .toString()
                              .contains('.')) {
                            beforeDecimal =
                                '${snapshot.data.available}'.split('.')[0];
                            afterDecimal =
                                '${snapshot.data.available}'.split('.')[1];
                            afterDecimal = '.' + afterDecimal;
                          } else {
                            beforeDecimal = snapshot.data.available.toString();
                            afterDecimal = '.00';
                          }
                        }
                        balance = "\u0024$beforeDecimal$afterDecimal";
                        return RichText(
                          text: TextSpan(
                            text: "\u0024$beforeDecimal",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Airbnb Cereal App"),
                            children: <TextSpan>[
                              TextSpan(
                                text: afterDecimal,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "\nHoneydu balance",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                          textAlign: TextAlign.center,
                        );
                      }),
                ),
                ElevatedButtonContainer(
                  label: Text("Withdraw"),
                  onPress: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CashOut(
                        balance: balance,
                      ),
                    ),
                  ),
                  verticalPadding: 15,
                  width: width * 0.70,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: divider(color: Color(0xFFCECFD0))),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Activity",
                    fontWeight: FontWeight.bold,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 8.0, right: 16),
                      child: divider(color: Color(0xFFCECFD0))),
                  GetAllInvoices(width: width),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget divider({Color color = Colors.grey}) {
  return Row(
    children: [
      Expanded(
        child: Divider(
          color: color,
        ),
      )
    ],
  );
}

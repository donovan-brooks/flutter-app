import 'package:flutter/material.dart';
import 'package:Honeydu/screens/business_address.dart';
import 'package:Honeydu/screens/tax_information.dart';
import 'package:Honeydu/services/keyboard_key_working.dart';
import 'package:Honeydu/widgets/custom_keyboard.dart';
import 'package:Honeydu/widgets/elevated_button_container.dart';
import 'package:Honeydu/widgets/text_widget.dart';

class BusinessVerification extends StatefulWidget {
  @override
  _BusinessVerificationState createState() => _BusinessVerificationState();
}

class _BusinessVerificationState extends State<BusinessVerification> {
  String ssnNumber, einNumber = '';
  TextEditingController ssnNumberController, einNumberController;
  Size _screenSize;
  int _value = 0;
  bool isBusinessAccount = true;

  @override
  void initState() {
    ssnNumberController = TextEditingController();
    einNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    ssnNumberController.dispose();
    einNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        height: _screenSize.height * 0.60,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              text: "Taxpayer Identification",
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Do you have a registered corporation, LLC or similar?",
                ),
                Container(
                  width: _screenSize.width * 0.50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 0,
                            groupValue: _value,
                            activeColor: Colors.black45,
                            onChanged: (int value) {
                              setState(() {
                                _value = value;
                                isBusinessAccount = true;
                              });
                            },
                          ),
                          Text("Yes")
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _value,
                            activeColor: Colors.black45,
                            onChanged: (int value) {
                              setState(() {
                                _value = value;
                                isBusinessAccount = false;
                              });
                            },
                          ),
                          Text("No")
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: isBusinessAccount
                      ? "Employer Identification Number (EIN)"
                      : "Social Securty Number (SSN)",
                  fontWeight: FontWeight.bold,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: TextFormField(
                    controller: isBusinessAccount
                        ? einNumberController
                        : ssnNumberController,
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      height: 2,
                    ),
                    cursorColor: Colors.grey[300],
                    cursorHeight: 24,
                    autofocus: true,
                    enabled: true,
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      labelText: isBusinessAccount ? "Fedral EIN" : "SSN",
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        height: 2,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            CustomKeyboard(
              screenSize: _screenSize,
              onBackspace: () {
                setState(() {
                  backspace(isBusinessAccount
                      ? einNumberController
                      : ssnNumberController);
                });
              },
              onTextInput: (inputNumber) {
                setState(() {
                  insertText(
                    inputNumber,
                    isBusinessAccount
                        ? einNumberController
                        : ssnNumberController,
                  );
                });
              },
            ),
            ElevatedButtonContainer(
              label: Text(
                "Request",
                style: TextStyle(
                  color: (einNumberController.text.length == 0 &&
                          ssnNumberController.text.length == 0)
                      ? Colors.grey
                      : Colors.white,
                ),
              ),
              onPress: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => isBusinessAccount
                      ? BusinessAddress(
                          einNumber: einNumberController.text,
                        )
                      : TaxInformation(
                          ssnNumber: ssnNumberController.text,
                        ),
                ),
              ),
              verticalPadding: 20,
              circularBorder: 50,
              width: _screenSize.width * 0.85,
            ),
          ],
        ),
      ),
    );
  }
}

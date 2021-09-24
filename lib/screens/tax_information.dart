import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/screens/sign_tax.dart';
import 'package:Honeydu/services/date_formats.dart';

import '../widgets/textfield.dart';

class TaxInformation extends StatefulWidget {
  final String ssnNumber;

  const TaxInformation({Key key, this.ssnNumber}) : super(key: key);
  @override
  _TaxInformationState createState() => _TaxInformationState();
}

class _TaxInformationState extends State<TaxInformation> {
  DateTime dob;
  TextEditingController firstNameController,
      lastNameController,
      addressLine1Controller,
      addressLine2Controller,
      cityNameController,
      stateNameController,
      zipCodeController,
      dobController;

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    addressLine1Controller = TextEditingController();
    addressLine2Controller = TextEditingController();
    cityNameController = TextEditingController();
    stateNameController = TextEditingController();
    zipCodeController = TextEditingController();
    dobController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressLine1Controller.dispose();
    addressLine2Controller.dispose();
    cityNameController.dispose();
    stateNameController.dispose();
    zipCodeController.dispose();
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_outlined,
            color: Colors.black,
          ),
          iconSize: 40.sp,
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            child: Text(
              "NEXT",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff9D9D9D)),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignTax(
                  addressLine1: addressLine1Controller.text,
                  addressLine2: addressLine2Controller.text,
                  cityName: cityNameController.text,
                  stateName: stateNameController.text,
                  zipCode: zipCodeController.text,
                  businessName: null,
                  dateofBirth: dobController.text,
                  firstname: firstNameController.text,
                  lastname: lastNameController.text,
                  isBusinessAccount: false,
                  accountNumber: widget.ssnNumber,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0.w, bottom: 30.0.h),
            child: Text(
              "Tax Information",
              style: TextStyle(
                  fontSize: 23.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: ListView(
                children: <Widget>[
                  Textfield2(
                    hintText: "First name",
                    textEditingController: firstNameController,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                  ),
                  Textfield2(
                    hintText: "Last name",
                    textEditingController: lastNameController,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: dobController,
                    cursorColor: Colors.grey,
                    cursorHeight: 22,
                    style: TextStyle(
                      height: 3,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff99ABA5), width: 0.2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff99ABA5), width: 0.2),
                      ),
                      hintText: (dob != null) ? null : "Enter Date of Birth",
                      hintStyle: TextStyle(
                        height: 3,
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        color: Color(0xff99ABA5),
                      ),
                    ),
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      ).then(
                        (date) {
                          setState(() {
                            if (date != null) {
                              dob = date;
                              dobController.text = yyyyMMddFormat(date);
                            }
                          });
                        },
                      );
                    },
                  ),
                  Textfield2(
                    hintText: "Address line 1",
                    textEditingController: addressLine1Controller,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.streetAddress,
                  ),
                  Textfield2(
                    hintText: "Address line 2",
                    textEditingController: addressLine2Controller,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.streetAddress,
                  ),
                  Textfield2(
                    hintText: "City",
                    textEditingController: cityNameController,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.streetAddress,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: _screenSize.width * 0.4,
                        child: Textfield2(
                          hintText: "State",
                          textEditingController: stateNameController,
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.streetAddress,
                        ),
                      ),
                      Container(
                        width: _screenSize.width * 0.4,
                        child: Textfield2(
                          hintText: "Zip Code",
                          textEditingController: zipCodeController,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

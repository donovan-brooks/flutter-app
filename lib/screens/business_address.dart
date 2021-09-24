import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'sign_tax.dart';
import '../widgets/text_widget.dart';
import '../widgets/textfield.dart';

class BusinessAddress extends StatefulWidget {
  final String einNumber;

  const BusinessAddress({Key key, this.einNumber}) : super(key: key);
  @override
  _BusinessAddressState createState() => _BusinessAddressState();
}

class _BusinessAddressState extends State<BusinessAddress> {
  TextEditingController addressLine1Controller,
      addressLine2Controller,
      cityNameController,
      stateNameController,
      zipCodeController,
      businessNameController;

  @override
  void initState() {
    addressLine1Controller = TextEditingController();
    addressLine2Controller = TextEditingController();
    cityNameController = TextEditingController();
    stateNameController = TextEditingController();
    zipCodeController = TextEditingController();
    businessNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    addressLine1Controller.dispose();
    addressLine2Controller.dispose();
    cityNameController.dispose();
    stateNameController.dispose();
    zipCodeController.dispose();
    businessNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
            child: TextWidget(
              text: "NEXT",
              fontSize: 20.sp,
              fontWeight: FontWeight.w300,
              color: Color(0xff9D9D9D),
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
                  businessName: businessNameController.text,
                  dateofBirth: null,
                  firstname: null,
                  lastname: null,
                  isBusinessAccount: true,
                  accountNumber: widget.einNumber,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 30.0.w, top: 20.h),
            child: TextWidget(
              text: "Bussiness Address",
              fontSize: 23.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: ListView(
                children: <Widget>[
                  Textfield2(
                    hintText: "Business Name",
                    textEditingController: businessNameController,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.streetAddress,
                  ),
                  Textfield2(
                    hintText: "Address line 1",
                    textEditingController: addressLine1Controller,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.streetAddress,
                  ),
                  Textfield2(
                    hintText: "Address line 2 (Optional)",
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
      )),
    );
  }
}

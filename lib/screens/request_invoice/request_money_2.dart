import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Honeydu/constants.dart';
import 'package:Honeydu/res/strings.dart';
import 'package:Honeydu/screens/request_invoice/add_item.dart';
import 'package:Honeydu/utils/log_util.dart';
import 'package:Honeydu/utils/utils.dart';
import 'package:Honeydu/widgets/text_widget.dart';
import 'package:Honeydu/widgets/widget_util.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import '../request/widgets/item_request_money_contact.dart';

final title = "RequestMoney2";

class RequestMoney2 extends StatefulWidget {
  final double totalAmount;

  const RequestMoney2({this.totalAmount});

  @override
  _RequestMoney2State createState() => _RequestMoney2State();
}

class _RequestMoney2State extends State<RequestMoney2> {
  bool _isLoading = false;
  bool isValid = false;
  String email = " ";

  List<Contact> _contactList = [];
  bool _isGrantedContactPermission = false;

  @override
  void initState() {
    super.initState();
    _getDeviceContacts();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => utils.dismissKeyboard(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
      ),
      actions: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            _onNext();
          },
          icon: Text(
            strings.next_caps,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildEmailField(),
        if (!_isGrantedContactPermission) _buildSettings() else _buildContacts()
      ],
    );
  }

  Widget _buildEmailField() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20.h),
      child: TextFormField(
        cursorColor: Colors.grey,
        keyboardType: TextInputType.emailAddress,
        validator: validateEmail,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          labelText: strings.enter_an_email,
          hintText: strings.company_phone_email_,
          hintStyle: TextStyle(fontWeight: FontWeight.normal),
          prefixIcon: Icon(FontAwesomeIcons.userAstronaut,
              color: Colors.black, size: 18),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          errorStyle: TextStyle(
            color: !isValid ? Colors.red : Colors.grey,
          ),
        ),
        onChanged: (value) {
          if (isValid) setState(() {});
          email = value;
        },
      ),
    );
  }

  Widget _buildSettings() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WidgetUtil.spaceVertical(10),
          Text(strings.looks_good, style: TextStyle(color: Colors.grey)),
          WidgetUtil.spaceVertical(80),
          Text(strings.msg_access_contacts,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black)),
          WidgetUtil.spaceVertical(50),
          Container(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                _getDeviceContacts(isOpenSettings: true);
              },
              child: Text(strings.open_settings,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w800)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContacts() {
    if (_isLoading) {
      return Expanded(child: SpinKitWave(color: Colors.black, size: 30.h));
    }

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 32),
              child: Text(strings.suggested.toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700)),
            ),
            ItemRequestMoneyContact(
              contactDetails: _contactList[0],
              onPressed: () {
                _contactList[0].emails.isNotEmpty
                    ? Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddItem(
                              email: _contactList[0]
                                  .emails
                                  .map((e) => e.value)
                                  .first,
                              totalAmout: widget.totalAmount,
                              logoData: _contactList[0].displayName != null &&
                                      _contactList[0].displayName != ""
                                  ? _contactList[0].displayName.substring(0, 1)
                                  : "0"),
                        ),
                      )
                    : showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            "No email found for this contact",
                            style: kErrorMessage,
                          ),
                        ),
                      );
              },
            ),
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 32),
              child: Text(
                strings.contacts.toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: _contactList.length,
              itemBuilder: (context, index) {
                final data = _contactList[index];
                return ItemRequestMoneyContact(
                  contactDetails: data,
                  onPressed: () {
                    data.emails.isNotEmpty
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddItem(
                                  email: data.emails.map((e) => e.value).first,
                                  totalAmout: widget.totalAmount,
                                  logoData: data.displayName != null &&
                                          data.displayName != ""
                                      ? data.displayName.substring(0, 1)
                                      : "0"),
                            ),
                          )
                        : showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                "No email found for this contact",
                                style: kErrorMessage,
                              ),
                            ),
                          );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      isValid = false;
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      isValid = false;
      return "Invalid Email";
    } else {
      isValid = true;
      return "Looks great!";
    }
  }

  Future<PermissionStatus> checkAndRequestContactPermission() async {
    // return await Permission.contacts.request().isGranted;
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  void _getDeviceContacts({bool isOpenSettings = false}) async {
    PermissionStatus status = await checkAndRequestContactPermission();
    Log.loga(title, "_getDeviceContacts >>>>>>> $status");
    if (status == PermissionStatus.granted) {
      setState(() {
        _isLoading = true;
        _isGrantedContactPermission = true;
      });
      final contacts = await ContactsService.getContacts(withThumbnails: false);
      Log.loga(title, "_getDeviceContacts:: >>>>>>>>>> ${contacts.length}");
      setState(() {
        _isLoading = false;
        _contactList = contacts.toList();
      });
    } else if (isOpenSettings && status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  void _onNext() async {
    isValid
        ? Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddItem(
                  email: email, totalAmout: widget.totalAmount, logoData: "-"),
            ),
          )
        : showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Container(
                child: ListTile(
                  title: Text(
                    "Email should be valid!",
                    style: kErrorMessage,
                  ),
                ),
              ),
            ),
          );
  }
}

Widget tileHeading(String heading) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextWidget(
      text: heading,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget listTileWidget(String title, String subtitle, String circleAvatarIcon,
    Color iconColor, Function onPressed) {
  return ListTile(
    tileColor: Colors.white,
    leading: CircleAvatar(
      backgroundColor: iconColor,
      child: TextWidget(
        text: circleAvatarIcon,
        fontSize: 20,
      ),
    ),
    title: TextWidget(
      textAlign: TextAlign.left,
      text: title,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    subtitle: TextWidget(
      textAlign: TextAlign.left,
      text: subtitle,
    ),
    trailing: Icon(Icons.help),
    onTap: onPressed,
  );
}

import 'package:Honeydu/res/strings.dart';
import 'package:Honeydu/screens/request/widgets/item_request_money_contact.dart';
import 'package:Honeydu/screens/request_invoice/add_item.dart';
import 'package:Honeydu/utils/log_util.dart';
import 'package:Honeydu/utils/utils.dart';
import 'package:Honeydu/widgets/text_widget.dart';
import 'package:Honeydu/widgets/widget_util.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactViaText extends StatefulWidget {
  @override
  _ContactViaTextState createState() => _ContactViaTextState();
}

class _ContactViaTextState extends State<ContactViaText> {
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
        body: SafeArea(child: _buildBody()),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!_isGrantedContactPermission) _buildSettings() else _buildContacts()
      ],
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
              onPressed: () {},
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
                  onPressed: () {},
                );
              },
            )
          ],
        ),
      ),
    );
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

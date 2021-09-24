import 'package:Honeydu/widgets/elevated_button_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:mailer/smtp_server.dart';

class PdfViewerPage extends StatefulWidget {
  final String localPath;
  final String email;

  PdfViewerPage({this.localPath, this.email});

  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  // String username = 'brooksbooks880@gmail.com';
  // String password = 'V6N70KvZow0y0h#2';

  final smtpServer = gmailSaslXoauth2('dharmeshgithub@gmail.com', 'Lelp7558@');

  Future<void> sendMail(
      {String name, String otp, String recipientEmail}) async {
    /* final message = Message()
      ..from = Address('dharmeshgithub@gmail.com', 'No reply')
      ..recipients.add('brooksbooks880@gmail.com')  //'brooksbooks880@gmail.com'
      // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      // ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Invoice'
      // ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..attachments = [
        FileAttachment(File(widget.localPath))
          ..location = Location.inline
          ..cid = '<myimg@3.141>'
      ];

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      Fluttertoast.showToast(
          msg: "Email sent successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }*/

    final Email email = Email(
      subject: 'Invoice',
      recipients: ['jaiminbhikadiya9@gmail.com'],
      attachmentPaths: [widget.localPath.toString()],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }

  @override
  Widget build(BuildContext context) {
    print('LocalPath: ${widget.localPath}');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "INVOICE",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.symmetric(vertical: 10),
            height: 20,
            child: ElevatedButtonContainer(
              onPress: () {
                sendMail();
              },
              label: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'SEND',
                    style: TextStyle(color: Colors.white),
                  )),
              color: Colors.black,
              circularBorder: 20,
            ),
          )
        ],
      ),
      body: widget.localPath != null
          ? PDFView(
              filePath: widget.localPath,
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

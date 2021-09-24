import 'package:url_launcher/url_launcher.dart';

class CallsAndMessagesService {
  void call(String number) => launch("tel://$number");

  void sendSms(String number) async {
    String uri = "sms: $number";
    if (await canLaunch(uri)) await launch(uri);
  }

  void sendinvitationSms(String number) async {
    String uri =
        "sms: $number?body=Please join me on Honeydu for sending and receiving business payments & receive a free \$5";
    if (await canLaunch(uri)) await launch(uri);
  }

  void sendEmail(String email) async {
    String uri = "mailto:$email?subject=Help&body=Hye, I need help!";
    await canLaunch(uri)
        ? await launch(uri)
        : throw 'Could not send email $uri';
  }
}

class RedirectToURL {
  void launchURL(url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}

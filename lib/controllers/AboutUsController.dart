import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

class AboutUsController extends GetxController {
  void goToSendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'smart_collecter@professionel.com',
    );
    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch email';
    }
  }

  void goToPhoneCall() async {
    final Uri phoneCallUri = Uri(
      scheme: 'tel',
      path: '021600000000',
    );
    if (await canLaunch(phoneCallUri.toString())) {
      await launch(phoneCallUri.toString());
    } else {
      throw 'Could not launch phone call';
    }
  }

  void goToMaPosition() async {
    const double latitude = 123.456; // Replace with the actual latitude
    const double longitude = 789.012; // Replace with the actual longitude

    final Uri mapsLaunchUri = Uri(
      scheme: 'https',
      path: 'www.google.com/maps/search/?api=1&query=$latitude,$longitude',
    );
    if (await canLaunch(mapsLaunchUri.toString())) {
      await launch(mapsLaunchUri.toString());
    } else {
      throw 'Could not launch Google Maps';
    }
  }
}


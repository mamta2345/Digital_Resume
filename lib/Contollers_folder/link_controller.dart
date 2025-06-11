import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkController extends GetxController {
  Future<void> openLink(String url) async {
    final uri = Uri.parse(url);
    if (kDebugMode) {
      print("Opening URL: $url");
    }
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar("Error", "Could not launch $url");
    }
  }
}

class ContactController extends GetxController {
  Future<void> makePhoneCall(String number) async {
    final Uri uri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      ); // Ensures mobile devices open dialer
    } else {
      Get.snackbar("Error", "Cannot place call to $number");
    }
  }

  Future<void> sendEmail(String email) async {
    final Uri uri = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      ); // Opens default email app
    } else {
      Get.snackbar("Error", "Cannot open email app");
    }
  }
}

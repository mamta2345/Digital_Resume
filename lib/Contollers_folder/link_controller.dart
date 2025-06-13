import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlController extends GetxController {
  Future<void> launchUrlWithMode(Uri uri, bool inApp) async {
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: inApp
              ? LaunchMode.inAppWebView
              : LaunchMode.externalApplication,
        );
      } else {
        if (kDebugMode) print("Cannot launch URL: $uri");
        Get.snackbar("Error", "Could not launch $uri");
      }
    } catch (e) {
      if (kDebugMode) print("Error launching URL: ${e.toString()}");
      Get.snackbar("Error", "Failed to open link");
    }
  }

  Future<void> makePhoneCall(String number) async {
    final Uri uri = Uri(scheme: 'tel', path: number);
    await launchUrlWithMode(uri, false);
  }

  Future<void> sendEmail(String email) async {
    final Uri uri = Uri(scheme: 'mailto', path: email);
    await launchUrlWithMode(uri, false);
  }

  Future<void> openLink(String url, {bool inApp = false}) async {
    final uri = Uri.parse(url);
    await launchUrlWithMode(uri, inApp);
  }
}

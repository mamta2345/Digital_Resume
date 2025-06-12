import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Url extends StatefulWidget {
  const Url({super.key});

  @override
  State<Url> createState() => _UrlState();
}

class _UrlState extends State<Url> {
  void urllancher(Uri uri, bool inApp) async {
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: inApp
              ? LaunchMode.inAppWebView
              : LaunchMode.externalApplication,
        );
      } else {
        if (kDebugMode) {
          print("Cannot launch URL: $uri");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error launching URL: ${e.toString()}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('URL Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildLinkButton(
              label: "Open LinkedIn (external browser)",
              onTap: () => urllancher(
                Uri.parse(
                  "https://www.linkedin.com/in/mamta-kumari-178843239/",
                ),
                false,
              ),
            ),
            const SizedBox(height: 20),
            buildLinkButton(
              label: "Open LinkedIn (in-app browser)",
              onTap: () => urllancher(
                Uri.parse(
                  "https://www.linkedin.com/in/mamta-kumari-178843239/",
                ),
                true,
              ),
            ),
            const SizedBox(height: 20),
            buildLinkButton(
              label: "Call Phone",
              onTap: () => urllancher(Uri.parse("tel:+917807713653"), false),
            ),
            const SizedBox(height: 20),
            buildLinkButton(
              label: "Send Email",
              onTap: () => urllancher(
                Uri.parse("mailto:mamta26121998@gmail.com"),
                false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLinkButton({required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blueAccent,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}

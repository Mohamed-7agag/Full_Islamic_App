import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customUrlLauncher(context, String url) async {
  if (url != "") {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("this Url not available!!"),
        ),
      );
    }
  }
}

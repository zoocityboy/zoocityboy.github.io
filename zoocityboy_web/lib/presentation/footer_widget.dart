import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final direction = MediaQuery.sizeOf(context).width > 600 ? Axis.horizontal : Axis.vertical;
    final wrapAlignment = MediaQuery.sizeOf(context).width > 600 ? WrapAlignment.start : WrapAlignment.center;
    final alignment = MediaQuery.sizeOf(context).width > 600 ? Alignment.centerLeft : Alignment.bottomCenter;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Align(
        alignment: alignment,
        child: Wrap(
          alignment: wrapAlignment,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 4,
          runSpacing: 4,
          direction: direction,
          children: [
            TextButton.icon(
                onPressed: _launchGithubUrl,
                icon: const Icon(
                  Ionicons.logo_github,
                  size: 12,
                ),
                label: const Text('Github')),
            TextButton.icon(
                onPressed: _launchTwitterUrl,
                icon: const Icon(Ionicons.logo_twitter, size: 12),
                label: const Text('Twitter/X')),
            Text(
              'Made with Flutter WASM by 🦏 @zoocityboy',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  void _launchGithubUrl() async {
    final url = Uri.parse('https://github.com/zoocityboy');
    if (!await launchUrl(url)) {
      print('Could not launch $url');
    }
  }

  void _launchTwitterUrl() async {
    final url = Uri.parse('https://twitter.com/don235078');
    if (!await launchUrl(url)) {
      print('Could not launch $url');
    }
  }
}

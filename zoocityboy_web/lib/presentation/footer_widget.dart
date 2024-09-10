import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
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
          const SizedBox(
            width: 8,
          ),
          Text(
            'Made with Flutter by 🦏 @zoocityboy',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            width: 8,
          ),
        ],
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

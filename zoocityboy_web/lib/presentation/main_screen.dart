import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 64),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'res/zoocityboy_light.png',
                            height: 96,
                            cacheHeight:
                                (MediaQuery.of(context).devicePixelRatio * 96)
                                    .toInt(),
                          ),
                          Text(
                            'Dart & Flutter developer',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                    // Text(
                    //   'Hi there, I\'m 🦏 zoocityboy',
                    //   style: Theme.of(context).textTheme.titleMedium,
                    // ),
                    // Text(
                    //   ' 🔭 I’m currently working on ... HCI SuperCupo app and a lot of private Flutter/Dart projects',
                    //   style: Theme.of(context).textTheme.bodySmall,
                    // ),
                    // Text(
                    //   '👯 I’m looking to collaborate on ... Supabase & Flutter projects',
                    //   style: Theme.of(context).textTheme.bodySmall,
                    // ),
                    // Text(
                    //   '🧘🏻‍♂️ I’m focusing on ... Developer experience on huge Flutter projects (author of VSCode extensions, dart cli apps).',
                    //   style: Theme.of(context).textTheme.bodySmall,
                    // ),
                    // Text(
                    //   '⚡ Fun fact: My little son knows, what a pipeline is!',
                    //   style: Theme.of(context).textTheme.bodySmall,
                    // ),
                    const SizedBox(
                      height: 96,
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      runAlignment: WrapAlignment.spaceEvenly,
                      children: [
                        TextButton.icon(
                            onPressed: _launchGithubUrl,
                            icon: const Icon(Ionicons.logo_github),
                            label: const Text('Github')),
                      ],
                    ),
                    TextButton.icon(
                        onPressed: _launchTwitterUrl,
                        icon: const Icon(Ionicons.logo_twitter),
                        label: const Text('Twitter')),
                  ],
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                right: 8,
                height: 32,
                child: Center(
                  child: Text(
                    'Developed by 🦏 @zoocityboy',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              )
            ],
          ),
        );
      }),
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

import 'package:flutter/material.dart';
import 'package:zoocityboy_web/presentation/hero_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainHeroWidget(),
      // body: CustomScrollView(slivers: [
      //   SliverAppBar(
      //     flexibleSpace: const FlexibleSpaceBar(
      //       background: MainHeroWidget(),
      //     ),
      //     expandedHeight: MediaQuery.of(context).size.height,
      //     collapsedHeight: 96,
      //     pinned: true,
      //   ),
      //   // SliverToBoxAdapter(
      //   //   child: SizedBox(
      //   //       height: MediaQuery.of(context).size.height * .6,
      //   //       child: const MainHeroWidget()),
      //   // ),
      //   // const SliverToBoxAdapter(
      //   //   child: Divider(height: 1),
      //   // ),
      //   // const SliverToBoxAdapter(
      //   //   child: SizedBox(height: 500, child: ProjectWidget()),
      //   // ),
      //   // const SliverToBoxAdapter(
      //   //   child: Divider(height: 1),
      //   // ),
      //   // const SliverToBoxAdapter(
      //   //   child: SizedBox(height: 500, child: ProjectWidget()),
      //   // ),
      //   // const SliverToBoxAdapter(
      //   //   child: FooterWidget(),
      //   // )
      // ]),
    );
  }
}

import 'package:flutter/material.dart';

import 'widgets/home_page_appbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const HomePageAppbar(
        title: "Cameron St., Boston",
        titleLabel: "Location",
      ),
      drawer: Drawer(),
      body: Center(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  height: 50,
                  // TODO: Pets list filter
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    physics: const BouncingScrollPhysics(),
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      6,
                      (index) {
                        return Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 0 : 16),
                          child: const Placeholder(
                            child: SizedBox(width: 60, height: 60),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                childCount: 10,
                (context, index) {
                  const double padding = 12;
                  return Padding(
                    padding: EdgeInsets.only(
                      top: index == 0 ? 0 : padding,
                    ),
                    child: Placeholder(child: SizedBox(height: 120)),
                  );
                },
              )),
            )
          ],
        ),
      ),
    );
  }
}

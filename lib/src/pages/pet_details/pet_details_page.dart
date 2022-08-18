import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // TODO: Details page appbar
          SliverAppBar(
            pinned: true,
            // TODO: Back button
            leading: Placeholder(),
            actions: [
              // TODO: Favorite button
              AspectRatio(
                aspectRatio: 1,
                child: Placeholder(),
              ),
            ],
          ),
          // TODO: Details page header section
          SliverToBoxAdapter(
            child: Placeholder(
              child: SizedBox.fromSize(
                size: Size.fromHeight(120),
              ),
            ),
          ),
          // TODO: Image gallery widget
          SliverToBoxAdapter(
            child: Placeholder(
              color: Colors.yellow[700]!,
              child: AspectRatio(
                aspectRatio: 1,
                child: SizedBox.expand(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 80,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          children: List.generate(
                              6,
                              (index) => Placeholder(
                                    child: SizedBox(
                                      width: 80,
                                      height: 80,
                                    ),
                                  )),
                        ),
                      ),
                      SizedBox.square(dimension: 16),
                      Flexible(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.yellow[900],
                              ),
                              child: FittedBox(
                                child: Placeholder(),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          // TODO: Details page about section
          SliverToBoxAdapter(
            child: Placeholder(
              child: SizedBox.fromSize(
                size: Size.fromHeight(240),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Placeholder(
            color: Colors.orange,
            child: SizedBox(
              width: 240,
              height: 60,
            ),
          ),
        ],
      ),
    );
  }
}

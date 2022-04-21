import 'package:flutter/material.dart';
import 'package:flutter_spotify_africa_assessment/colors.dart';
import 'package:flutter_spotify_africa_assessment/features/about/presentation/components/animated_gradient_container.dart';
import 'dart:math';

class SpotifyCategory extends StatefulWidget {
  const SpotifyCategory({Key? key, required this.categoryId}) : super(key: key);
  final String categoryId;

  @override
  State<SpotifyCategory> createState() => _SpotifyCategoryState();
}

class _SpotifyCategoryState extends State<SpotifyCategory>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    animation = Tween<double>(begin: 0, end: 2 * pi).animate(controller);
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "Afro",
              style: Theme.of(context).textTheme.headline3,
            ),
            centerTitle: true,
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
          ),
          // Next, create a SliverList
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  color: Colors.green[100 * (index % 9 + 1)],
                  child: ListTile(
                    title: Text("shohel$index"),
                  ),
                );
              },
              childCount: 100,
            ),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          )
        ],
      ),
    );
  }
}

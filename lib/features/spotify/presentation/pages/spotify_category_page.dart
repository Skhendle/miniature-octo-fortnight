import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spotify_africa_assessment/colors.dart';
import 'package:flutter_spotify_africa_assessment/features/about/presentation/components/animated_gradient_container.dart';
import 'dart:math';

import 'package:flutter_spotify_africa_assessment/features/spotify/application_layer/category_header/category_header_bloc.dart';

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
    context.read<CategoryHeaderBloc>().add(GetCategoryHeaderEvent());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var headerHeight = MediaQuery.of(context).size.height * 0.5;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: [
          const SliverPadding(padding: EdgeInsets.symmetric(vertical: 10)),
          SliverToBoxAdapter(
            child: SizedBox(
              height: headerHeight,
              child: BlocBuilder<CategoryHeaderBloc, CategoryHeaderState>(
                builder: (context, state) {
                  if (state is CategoryHeaderError) {
                    return Center(
                      child: Text(
                        state.messgae,
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else if (state is CategoryHeaderView) {
                    return Column(
                      children: [
                        Expanded(
                            child: Center(
                          child: Text(
                            state.data.name,
                            style:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        )),
                        Expanded(
                            flex: 3,
                            child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                ),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(state.data.imageUrl),
                                        fit: BoxFit.cover))))
                      ],
                    );
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.white,
                    ));
                  }
                },
              ),
            ),
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

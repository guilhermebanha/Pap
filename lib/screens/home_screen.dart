import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pap/Widgets/exporter.dart';
import 'package:pap/classes/post.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

@override
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FinalPost>>(
      future: getPosts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            separatorBuilder: (context, id) => const SizedBox(
              height: 10,
            ),
            itemCount: snapshot.data!.length,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (BuildContext context, int index) {
              return Post(p: snapshot.data![index]);
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

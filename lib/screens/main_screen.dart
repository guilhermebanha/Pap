import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pap/routes/router.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        DiscoverRoute(),
        PostRoute(),
        // UserPostRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        Widget buildBarItem(int index, double size, IconData icon) {
          /* final color = index == activeIndex
             ? const Color.fromRGBO(90, 57, 111, 100)
             : const Color.fromRGBO(122, 91, 159, 100);
             */
          return IconButton(
            onPressed: () => {tabsRouter.setActiveIndex(index)},
            icon: Icon(
              icon,
              size: size,
              color: const Color.fromRGBO(0, 0, 0, 100),
            ),
          );
        }

        return BottomAppBar(
          height: 70,
          color: const Color.fromRGBO(255, 255, 255, 100),
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildBarItem(0, 24, Icons.home_outlined),
              buildBarItem(1, 24, Icons.search_outlined),
              buildBarItem(2, 36, Icons.add),
              buildBarItem(3, 24, Icons.favorite_outline),
              buildBarItem(4, 24, Icons.person_outline),
            ],
          ),
        );
      },
    );
  }
}

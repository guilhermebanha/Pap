import 'package:auto_route/auto_route.dart';
import 'package:pap/screens/discover_screen.dart';
import 'package:pap/screens/home_screen.dart';
import 'package:pap/screens/liked_screen.dart';
import 'package:pap/screens/login_screen.dart';
import 'package:pap/screens/main_screen.dart';
import 'package:pap/screens/post_screen.dart';
import 'package:pap/screens/user_post_screen.dart';

import '../screens/register_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: DiscoverRoute.page),
        AutoRoute(page: UserPostRoute.page),
        AutoRoute(page: PostRoute.page),
        AutoRoute(page: LikeRoute.page),
        AutoRoute(page: RegisterRoute.page),
        // Rota do user
      ];
}

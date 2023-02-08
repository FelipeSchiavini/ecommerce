import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/auth/sign-in-screen.dart';
import '../pages/auth/sign-up-screen.dart';
import '../pages/shop/home.dart';
import '../pages/splash/index.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      page: () => const SplashScreen(),
      name: PagesRoutes.splash,
    ),
    GetPage(
      page: () => const SignInScreen(),
      name: PagesRoutes.signIn,
    ),
    GetPage(
      page: () => const SignUpScreen(),
      name: PagesRoutes.signUp,
    ),
    GetPage(
      page: () => const ShopHome(),
      name: PagesRoutes.home,
    )
  ];
}

abstract class PagesRoutes {
  static const String signIn = '/signin';
  static const String splash = '/splash';
  static const String signUp = '/signup';
  static const String home = '/';
}

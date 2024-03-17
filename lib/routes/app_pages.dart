import 'package:freelancerApp/features/auth/binding/auth_binding.dart';
import 'package:freelancerApp/features/auth/views/login_view.dart';
import 'package:freelancerApp/features/auth/views/register_view.dart';
import 'package:freelancerApp/features/freelancer/views/service_details_view.dart';
import 'package:freelancerApp/features/home/binding/home_binding.dart';
import 'package:freelancerApp/features/home/views/home_view.dart';
import 'package:freelancerApp/features/profile/binding/profile_binding.dart';
import 'package:freelancerApp/features/profile/view/profile.dart';
import 'package:freelancerApp/features/root/binding/root_binding.dart';
import 'package:freelancerApp/features/root/view/root_view.dart';
import 'package:freelancerApp/features/splash/splash_view.dart';
import 'package:freelancerApp/features/users/binding/users_binding.dart';
import 'package:freelancerApp/features/users/views/users_view.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class Theme1AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;
  static final routes = [
    GetPage(name: Routes.SPLASH, page: () => const SplashView()),
    GetPage(name: Routes.HOME, page: () => HomeView(), binding: HomeBinding()),
    GetPage(name: Routes.ROOT, page: () => RootView(), binding: RootBinding()),    GetPage(name: Routes.PROFILE, page: () => ProfileView(), binding: ProfileBinding()),

    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginView(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.REGISTER,
        page: () => const SignUpView(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.USERS,
        page: () => const UsersView(),
        binding: UsersBinding()),

      
  ];
}

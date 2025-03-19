import 'package:go_router/go_router.dart';
import 'package:pokedex/features/Onboarding/presentation/views/onboarding_view.dart';
import 'package:pokedex/features/home/presentation/views/home_view.dart';

class AppRouter {
  AppRouter._();
  static const kHomeView = '/homeView';

  static final router = GoRouter(
    routes: [
      // GoRoute(path: '/', builder: (context, state) => const OnboardingView()),
      GoRoute(path: '/', builder: (context, state) => const HomeView()),
    ],
  );
}

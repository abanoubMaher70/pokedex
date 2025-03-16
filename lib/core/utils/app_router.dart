import 'package:go_router/go_router.dart';
import 'package:pokedex/features/Onboarding/presentation/views/onboarding_view.dart';
import 'package:pokedex/features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const OnboardingView()),

      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
    ],
  );
}

import 'package:go_router/go_router.dart';
import 'package:pokedex/features/Onboarding/presentation/views/onboarding_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const OnboardingView()),
    ],
  );
}

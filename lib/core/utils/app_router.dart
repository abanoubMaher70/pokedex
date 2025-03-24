import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/core/utils/service_locator.dart';
import 'package:pokedex/features/Onboarding/presentation/views/onboarding_view.dart';
import 'package:pokedex/features/favorites/presentation/views/favorites_view.dart';
import 'package:pokedex/features/home/data/repos/home_repo_impl.dart';
import 'package:pokedex/features/home/presentation/manager/favorite_pokemon_cubit/favorite_pokemon_cubit.dart';
import 'package:pokedex/features/home/presentation/views/home_view.dart';
import 'package:pokedex/features/search/presentation/views/search_view.dart';

class AppRouter {
  AppRouter._();
  static const kOnboardingView = '/homeView';
  static const kHomeView = '/homeView';
  static const kSearchView = '/searchView';
  static const kFavoritesView = '/favoritesView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kOnboardingView,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: '/',
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      FavoritePokemonCubit(locator.get<HomeRepoImpl>())
                        ..getFavoritePokemon(id: 6),
              child: const HomeView(),
            ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kFavoritesView,
        builder: (context, state) => const FavoritesView(),
      ),
    ],
  );
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/core/models/pokemon_model_hive.dart';
import 'package:pokedex/features/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> searchPokemonById({required String id}) async {
    emit(SearchLoading());
    final result = await searchRepo.searchPokemonById(id: id);
    result.fold(
      (failure) => emit(SearchError(failure.message)),
      (pokemon) => emit(SearchSuccess(pokemon)),
    );
  }
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/core/models/hive_models/pokemon_model_hive.dart';
import 'package:pokedex/features/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;
  Timer? _debounce;

  void searchPokemonById({required int? id}) {
    if (id == null || id == 0 || id.isNegative || id > 1302) {
      emit(const SearchError("Invalid range: Choose between 1 and 1302"));
      return;
    }

    _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 2), () async {
      emit(SearchLoading());
      final result = await searchRepo.searchPokemonById(id: id);
      result.fold(
        (failure) => emit(SearchError(failure.message)),
        (pokemon) => emit(SearchSuccess(pokemon)),
      );
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}

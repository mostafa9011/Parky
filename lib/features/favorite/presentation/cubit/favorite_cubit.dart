import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  static FavoriteCubit get(BuildContext context) => BlocProvider.of(context);

  List<int> favorites = [
    0,
    1,
    2,
  ];

  removeFavorite(int id) {
    favorites.remove(id);
    emit(FavoriteUpdated());
  }
}

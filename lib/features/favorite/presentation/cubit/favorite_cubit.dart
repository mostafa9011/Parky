import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/favorite_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  static FavoriteCubit get(BuildContext context) => BlocProvider.of(context);

  List<FavoriteModel> favorites = [
    FavoriteModel(
      id: 10,
    ),
    FavoriteModel(
      id: 20,
    ),
    FavoriteModel(
      id: 30,
    ),
  ];

  removeFavorite(int id) {
    favorites.removeWhere((element) => element.id == id);
    emit(FavoriteUpdated());
  }
}

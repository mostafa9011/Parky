import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

  List<int> familyList = [
    0,
    1,
    2,
    3,
  ];

  void removeFamily(int id) {
    familyList.removeWhere((element) => element == id);
    emit(FamilyComunityUpdated());
  }
}

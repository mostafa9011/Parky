import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parky/core/utils/functions/kprint.dart';
import 'package:parky/features/auth/data/models/register_model.dart';

import '../../../../core/helpers/cache_helper.dart';
import '../../data/repositories/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  final ProfileRepository profileRepository = ProfileRepository();

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

  // get all users
  Future<void> getAllUsers() async {
    emit(AllUsersLoading());
    final result = await profileRepository.getAllUsers();
    result.fold(
      (failure) => emit(AllUsersError(failure.message)),
      (users) {
        RegisterModel registerModel = RegisterModel();
        String? savedEmail = registerModel.emailController.text.isEmpty
            ? CacheHelper.getStringData('email')
            : registerModel.emailController.text;
        for (var user in users) {
          if (savedEmail == user.email) {
            registerModel.firstNameController.text =
                user.firstName ?? registerModel.firstNameController.text;
            registerModel.lastNameController.text =
                user.lastName ?? registerModel.lastNameController.text;
            registerModel.emailController.text =
                user.email ?? registerModel.emailController.text;
            // registerModel.passwordController.text = user.password;
            registerModel.licensePlateController.text =
                user.licenseId ?? registerModel.licensePlateController.text;
            // registerModel.carModelController.text = user.carModel;
            registerModel.phoneController.text =
                user.phoneNumber ?? registerModel.phoneController.text.isEmpty
                    ? "0123456789"
                    : registerModel.phoneController.text;
            registerModel.gender = user.gender ?? registerModel.gender;
            registerModel.nationalId.text =
                user.nationalId ?? registerModel.nationalId.text;
          }
        }
        kprint('Hello ${registerModel.firstNameController.text}');
        emit(AllUsersSuccess());
      },
    );
  }
}

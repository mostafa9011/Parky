part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

// family comunity
class FamilyComunityUpdated extends ProfileState {}

// all users states
class AllUsersLoading extends ProfileState {}

class AllUsersSuccess extends ProfileState {}

class AllUsersError extends ProfileState {
  final String message;
  AllUsersError(this.message);
}

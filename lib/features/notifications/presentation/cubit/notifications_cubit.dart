import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parky/features/notifications/data/models/notification_model.dart';
import 'package:parky/features/notifications/data/repositories/notifications_repository.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());
  static NotificationsCubit get(BuildContext context) =>
      BlocProvider.of(context);
  final NotificationsRepository _notificationsRepository =
      NotificationsRepository();

  List<NotificationModel>? notifications;

  Future<void> getNotifications() async {
    emit(NotificationsLoading());
    final result = await _notificationsRepository.getNotifications();
    result.fold((failure) => emit(NotificationError(message: failure.message)),
        (notifications) {
      this.notifications = notifications;
      emit(NotificationSuccess());
    });
  }

  // delete all notifications
  void deleteAllNotifications() {
    notifications?.clear();
    emit(NotificationDeleted());
  }
}

import '../../domain/entities/reminder.dart';
import '../../domain/repositories/reminders_repository.dart';
import '../datasources/reminders_local_data_source.dart';
import '../models/reminder_model.dart';
import '../../core/services/notification_service.dart';
import 'package:flutter/foundation.dart';

class RemindersRepositoryImpl implements RemindersRepository {
  final RemindersLocalDataSource localDataSource;
  final NotificationService notificationService;

  RemindersRepositoryImpl({
    required this.localDataSource,
    required this.notificationService,
  });

  @override
  Future<List<Reminder>> getAllReminders() async {
    final models = await localDataSource.getCachedReminders();
    final domainList = models.map((m) => m.toDomain()).toList();
    // Sort chronologically (nearest/upcoming reminder first)
    domainList.sort((a, b) => a.reminderDateTime.compareTo(b.reminderDateTime));
    return domainList;
  }

  @override
  Future<void> addReminder(Reminder reminder) async {
    if (kDebugMode) {
      print(
        'RemindersRepositoryImpl [DEBUG]: addReminder called for "${reminder.title}" at ${reminder.reminderDateTime}',
      );
    }
    final model = ReminderModel.fromDomain(reminder);
    await localDataSource.cacheReminder(model);

    final now = DateTime.now();
    final isFuture = reminder.reminderDateTime.isAfter(now);
    if (kDebugMode) {
      print(
        'RemindersRepositoryImpl [DEBUG]: Current system time: $now, isFuture? $isFuture',
      );
    }

    if (isFuture) {
      if (kDebugMode) {
        print(
          'RemindersRepositoryImpl [DEBUG]: Calling scheduleNotification...',
        );
      }
      try {
        await notificationService.scheduleNotification(
          id: reminder.id.hashCode.abs() & 0x7FFFFFFF,
          title: 'Incoming Reminder',
          body: 'You have a scheduled reminder.',
          scheduledDate: reminder.reminderDateTime,
          payload: reminder.id,
        );
      } catch (e) {
        if (kDebugMode) {
          print(
            'RemindersRepositoryImpl [DEBUG]: Error inside scheduleNotification: $e',
          );
        }
      }
    } else {
      if (kDebugMode) {
        print(
          'RemindersRepositoryImpl [DEBUG]: Skipping notification scheduling because scheduled time is in the past.',
        );
      }
    }
  }

  @override
  Future<void> updateReminder(Reminder reminder) async {
    if (kDebugMode) {
      print(
        'RemindersRepositoryImpl [DEBUG]: updateReminder called for "${reminder.title}" at ${reminder.reminderDateTime}',
      );
    }
    final model = ReminderModel.fromDomain(reminder);
    await localDataSource.cacheReminder(model);

    final notificationId = reminder.id.hashCode.abs() & 0x7FFFFFFF;
    if (kDebugMode) {
      print(
        'RemindersRepositoryImpl [DEBUG]: Canceling old notification with ID: $notificationId',
      );
    }
    await notificationService.cancelNotification(notificationId);

    final now = DateTime.now();
    final isFuture = reminder.reminderDateTime.isAfter(now);
    if (kDebugMode) {
      print(
        'RemindersRepositoryImpl [DEBUG]: Current system time: $now, isFuture? $isFuture',
      );
    }

    if (isFuture) {
      if (kDebugMode) {
        print(
          'RemindersRepositoryImpl [DEBUG]: Calling scheduleNotification for updated reminder...',
        );
      }
      try {
        await notificationService.scheduleNotification(
          id: notificationId,
          title: 'Incoming Reminder',
          body: 'You have a scheduled reminder.',
          scheduledDate: reminder.reminderDateTime,
          payload: reminder.id,
        );
      } catch (e) {
        if (kDebugMode) {
          print(
            'RemindersRepositoryImpl [DEBUG]: Error inside scheduleNotification for updated reminder: $e',
          );
        }
      }
    } else {
      if (kDebugMode) {
        print(
          'RemindersRepositoryImpl [DEBUG]: Skipping notification scheduling because scheduled time is in the past.',
        );
      }
    }
  }

  @override
  Future<void> deleteReminder(String id) async {
    await localDataSource.deleteCachedReminder(id);

    // Cancel any scheduled notification
    await notificationService.cancelNotification(
      id.hashCode.abs() & 0x7FFFFFFF,
    );
  }

  static const int _snoozeDurationMinutes = 10;

  @override
  Future<void> snoozeReminder(String reminderId) async {
    if (kDebugMode) {
      print(
        'RemindersRepositoryImpl [DEBUG]: snoozeReminder called for "$reminderId" — rescheduling in $_snoozeDurationMinutes min.',
      );
    }
    final notificationId = reminderId.hashCode.abs() & 0x7FFFFFFF;
    await notificationService.cancelNotification(notificationId);
    await notificationService.scheduleSnoozeNotification(
      id: notificationId,
      snoozeDurationMinutes: _snoozeDurationMinutes,
      payload: reminderId,
    );
  }

  @override
  Future<Reminder?> getReminderById(String id) async {
    final model = await localDataSource.getCachedReminderById(id);
    return model?.toDomain();
  }

  @override
  Future<List<Reminder>> searchReminders(String query) async {
    final allReminders = await getAllReminders();
    if (query.isEmpty) return allReminders;
    final lowerQuery = query.toLowerCase();
    return allReminders.where((reminder) {
      return reminder.title.toLowerCase().contains(lowerQuery) ||
          reminder.description.toLowerCase().contains(lowerQuery);
    }).toList();
  }
}

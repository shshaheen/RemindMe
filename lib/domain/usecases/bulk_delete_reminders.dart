import '../repositories/reminders_repository.dart';

/// Domain use case that deletes a set of reminders by ID in sequence.
///
/// Encapsulating the loop here keeps the Bloc handler thin and makes the
/// bulk-delete logic independently testable without a widget tree.
class BulkDeleteRemindersUseCase {
  final RemindersRepository _repository;

  const BulkDeleteRemindersUseCase({required this._repository});

  /// Deletes every reminder whose [id] is in [ids].
  /// Throws on the first repository error encountered.
  Future<void> call({required Set<String> ids}) async {
    for (final id in ids) {
      await _repository.deleteReminder(id);
    }
  }
}

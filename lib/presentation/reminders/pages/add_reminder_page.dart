import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/reminders_bloc.dart';
import '../blocs/reminders_event.dart';
import '../../../domain/entities/reminder.dart';
import '../../../core/di/injection_container.dart';
import '../../../core/permissions/permission_manager.dart';
import '../cubits/speech_input/speech_input_cubit.dart';
import '../cubits/speech_input/speech_input_state.dart';
import '../cubits/speech_input/speech_target_field.dart';
import '../widgets/speech_listening_sheet.dart';

class AddReminderPage extends StatefulWidget {
  final Reminder? reminder;

  const AddReminderPage({super.key, this.reminder});

  @override
  State<AddReminderPage> createState() => _AddReminderPageState();
}

class _AddReminderPageState extends State<AddReminderPage>
    with WidgetsBindingObserver {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descController;

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  bool _isSheetOpen = false;

  bool get _isEdit => widget.reminder != null;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _titleController = TextEditingController(
      text: widget.reminder?.title ?? '',
    );
    _descController = TextEditingController(
      text: widget.reminder?.description ?? '',
    );
    _selectedDate = widget.reminder?.reminderDateTime;
    _selectedTime = widget.reminder != null
        ? TimeOfDay.fromDateTime(widget.reminder!.reminderDateTime)
        : null;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      if (mounted) {
        try {
          final cubit = context.read<SpeechInputCubit>();
          if (cubit.state is SpeechInputListening) {
            cubit.cancelListening();
          }
        } catch (_) {}
      }
    }
  }

  void _showListeningSheet(BuildContext context, SpeechTargetField field) {
    if (_isSheetOpen) return;
    _isSheetOpen = true;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetCtx) {
        return BlocProvider.value(
          value: context.read<SpeechInputCubit>(),
          child: SpeechListeningSheet(targetField: field),
        );
      },
    ).then((_) {
      _isSheetOpen = false;
      if (!context.mounted) return;
      final cubit = context.read<SpeechInputCubit>();
      if (cubit.state is SpeechInputListening) {
        cubit.cancelListening();
      }
    });
  }

  void _dismissListeningSheet(BuildContext context) {
    if (_isSheetOpen) {
      _isSheetOpen = false;
      Navigator.of(context).pop();
    }
  }

  void _showPermissionDeniedDialog(
    BuildContext context,
    SpeechTargetField targetField,
    bool permanently,
  ) {
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Microphone Access Required'),
        content: Text(
          permanently
              ? 'Microphone permission is permanently denied. Please enable it in your device settings to use voice input.'
              : 'Microphone permission is required to transcribe speech to text.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogCtx).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogCtx).pop();
              if (permanently) {
                sl<PermissionManager>().openSettings();
              } else {
                context.read<SpeechInputCubit>().startListening(
                  targetField: targetField,
                );
              }
            },
            child: Text(permanently ? 'Open Settings' : 'Allow'),
          ),
        ],
      ),
    );
  }

  Future<void> _pickDate() async {
    // 1. Instantly dismiss the virtual keyboard
    FocusScope.of(context).unfocus();

    final now = DateTime.now();

    final initialDate = _selectedDate ?? now;

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: initialDate.isBefore(now) ? initialDate : now,
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime() async {
    // 1. Instantly dismiss the virtual keyboard
    FocusScope.of(context).unfocus();

    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Please select a date')));
        return;
      }
      if (_selectedTime == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Please select a time')));
        return;
      }

      final reminderDateTime = DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      );

      if (_isEdit) {
        final updatedReminder = widget.reminder!.copyWith(
          title: _titleController.text.trim(),
          description: _descController.text.trim(),
          reminderDateTime: reminderDateTime,
        );
        context.read<RemindersBloc>().add(
          UpdateReminder(reminder: updatedReminder),
        );
      } else {
        final uniqueId = DateTime.now().microsecondsSinceEpoch.toString();
        final reminder = Reminder(
          id: uniqueId,
          title: _titleController.text.trim(),
          description: _descController.text.trim(),
          reminderDateTime: reminderDateTime,
        );
        context.read<RemindersBloc>().add(AddReminder(reminder: reminder));
      }
      context.pop();
    }
  }

  String _formatDate() {
    if (_selectedDate == null) return 'No Date Selected';
    return '${_selectedDate!.day.toString().padLeft(2, '0')}/${_selectedDate!.month.toString().padLeft(2, '0')}/${_selectedDate!.year}';
  }

  String _formatTime() {
    if (_selectedTime == null) return 'No Time Selected';
    return _selectedTime!.format(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SpeechInputCubit>(
      create: (context) => sl<SpeechInputCubit>(),
      child: Builder(
        builder: (context) {
          return BlocListener<SpeechInputCubit, SpeechInputState>(
            listener: (context, state) {
              state.whenOrNull(
                initial: () {
                  _dismissListeningSheet(context);
                },
                listening: (targetField, _, __) {
                  _showListeningSheet(context, targetField);
                },
                success: (targetField, recognizedText) {
                  _dismissListeningSheet(context);
                  if (recognizedText.trim().isNotEmpty) {
                    final controller = targetField == SpeechTargetField.title
                        ? _titleController
                        : _descController;
                    final text = controller.text;
                    final selection = controller.selection;

                    if (text.isEmpty) {
                      controller.text = recognizedText;
                    } else {
                      if (selection.isValid && selection.start >= 0) {
                        final start = selection.start;
                        final end = selection.end;
                        final newText = text.replaceRange(
                          start,
                          end,
                          recognizedText,
                        );
                        controller.text = newText;
                        controller.selection = TextSelection.fromPosition(
                          TextPosition(offset: start + recognizedText.length),
                        );
                      } else {
                        controller.text = '$text $recognizedText';
                      }
                    }
                  }
                  context.read<SpeechInputCubit>().reset();
                },
                failure: (targetField, errorMessage) {
                  _dismissListeningSheet(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Speech failed: $errorMessage'),
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ),
                  );
                  context.read<SpeechInputCubit>().reset();
                },
                permissionDenied: (targetField, permanently) {
                  _dismissListeningSheet(context);
                  _showPermissionDeniedDialog(
                    context,
                    targetField,
                    permanently,
                  );
                  context.read<SpeechInputCubit>().reset();
                },
              );
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(_isEdit ? 'Edit Reminder' : 'Add Reminder'),
              ),
              body: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(
                          _isEdit
                              ? Icons.edit_calendar_rounded
                              : Icons.alarm_add_rounded,
                          size: 72,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _isEdit
                              ? 'Modify Your Reminder'
                              : 'Create New Reminder',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 24),

                        // Sleek Forms Card
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Title Input
                              TextFormField(
                                controller: _titleController,
                                decoration: InputDecoration(
                                  labelText: 'Title *',
                                  hintText: 'Enter reminder title',
                                  prefixIcon: Icon(
                                    Icons.title_rounded,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.mic_rounded,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                    tooltip: 'Voice Input',
                                    onPressed: () {
                                      context
                                          .read<SpeechInputCubit>()
                                          .startListening(
                                            targetField:
                                                SpeechTargetField.title,
                                          );
                                    },
                                  ),
                                  filled: true,
                                  fillColor: Theme.of(
                                    context,
                                  ).colorScheme.surfaceVariant.withOpacity(0.2),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.outline.withOpacity(0.15),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      width: 2,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.error,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 16,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Title is required';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),

                              // Description Input
                              TextFormField(
                                controller: _descController,
                                maxLines: 3,
                                decoration: InputDecoration(
                                  labelText: 'Description (Optional)',
                                  hintText: 'Add notes or description...',
                                  prefixIcon: Icon(
                                    Icons.description_rounded,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                  suffixIcon: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.mic_rounded,
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                        ),
                                        tooltip: 'Voice Input',
                                        onPressed: () {
                                          context
                                              .read<SpeechInputCubit>()
                                              .startListening(
                                                targetField: SpeechTargetField
                                                    .description,
                                              );
                                        },
                                      ),
                                    ],
                                  ),
                                  filled: true,
                                  fillColor: Theme.of(
                                    context,
                                  ).colorScheme.surfaceVariant.withOpacity(0.2),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.outline.withOpacity(0.15),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      width: 2,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Sleek Date & Time Pickers Row
                        Row(
                          children: [
                            // Date Picker Pill
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer
                                      .withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary.withOpacity(0.1),
                                  ),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: _pickDate,
                                    borderRadius: BorderRadius.circular(20),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                        horizontal: 12,
                                      ),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.calendar_today_rounded,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                            size: 28,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Date *',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            _formatDate(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Time Picker Pill
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer
                                      .withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary.withOpacity(0.1),
                                  ),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: _pickTime,
                                    borderRadius: BorderRadius.circular(20),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                        horizontal: 12,
                                      ),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.access_time_rounded,
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                            size: 28,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Time *',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.secondary,
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            _formatTime(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 32),

                        // Submit Button
                        ElevatedButton(
                          onPressed: _submit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onPrimary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 2,
                          ),
                          child: Text(
                            _isEdit ? 'Save Changes' : 'Create Reminder',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

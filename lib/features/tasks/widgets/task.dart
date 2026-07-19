import 'package:flutter/material.dart';
import '../task_model.dart';
import '../../../shared/functions/helpers.dart';

class Task extends StatelessWidget {
  final TaskModel task;
  final VoidCallback? onPressed;

  const Task({super.key, required this.task, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final done = task.isDone;

    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.taskName.isEmpty ? "Untitled task" : task.taskName,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: done ? scheme.onSurfaceVariant : scheme.onSurface,
                        // Struck-through name makes a completed task obvious at a glance.
                        decoration: done ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.schedule,
                            size: 14, color: scheme.onSurfaceVariant),
                        const SizedBox(width: 4),
                        Text(
                          "${Helpers.toTimeOfTheDay(task.startTime).format(context)} – ${Helpers.toTimeOfTheDay(task.endTime).format(context)}",
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Filled/primary when done, muted outline when not.
              Icon(
                done ? Icons.check_circle : Icons.radio_button_unchecked,
                color: done ? scheme.primary : scheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_statemanagement/Lacture6/itemProvider.dart';

class TodoHomeScreen extends ConsumerWidget {
  const TodoHomeScreen({super.key});

  // Collects task text and dispatches add action through the notifier.
  Future<void> _showAddItemDialog(BuildContext context, WidgetRef ref) async {
    final controller = TextEditingController();

    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Task'),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Task title',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (_) {
              final text = controller.text.trim();
              if (text.isEmpty) return;

              ref.read(itemProvider.notifier).addItem(text);
              Navigator.of(context).pop();
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                final text = controller.text.trim();
                if (text.isEmpty) return;

                ref.read(itemProvider.notifier).addItem(text);
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showEditItemDialog(
    BuildContext context,
    WidgetRef ref,
    String id,
    String currentName,
  ) async {
    final controller = TextEditingController(text: currentName);

    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Update task title',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (_) {
              final text = controller.text.trim();
              if (text.isEmpty) return;

              ref.read(itemProvider.notifier).updateItem(id, text);
              Navigator.of(context).pop();
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                final text = controller.text.trim();
                if (text.isEmpty) return;

                ref.read(itemProvider.notifier).updateItem(id, text);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Rebuilds the screen whenever the task list changes.
    final items = ref.watch(itemProvider);
    final theme = Theme.of(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddItemDialog(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Add Task'),
      ),
      appBar: AppBar(
        title: const Text('Task Board'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF2F6FF), Color(0xFFE9FFF7)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x22000000),
                        blurRadius: 14,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundColor: Color(0xFF2563EB),
                        child: Icon(
                          Icons.checklist_rounded,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'My Tasks',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${items.length} task(s) in your list',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: items.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.inbox_outlined,
                                size: 68,
                                color: Colors.blueGrey.shade300,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'No tasks yet',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Tap Add Task to create your first item.',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.separated(
                          itemCount: items.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            final item = items[index];
                            final shortId = item.id.split('.').first;

                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x18000000),
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 6,
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: const Color(0xFFE0EDFF),
                                  child: Text(
                                    '${index + 1}',
                                    style: const TextStyle(
                                      color: Color(0xFF1D4ED8),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text(
                                  'Created: $shortId',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      tooltip: 'Edit',
                                      icon: const Icon(Icons.edit_outlined),
                                      onPressed: () {
                                        _showEditItemDialog(
                                          context,
                                          ref,
                                          item.id,
                                          item.name,
                                        );
                                      },
                                    ),
                                    IconButton(
                                      tooltip: 'Delete',
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        color: Colors.redAccent,
                                      ),
                                      onPressed: () {
                                        ref
                                            .read(itemProvider.notifier)
                                            .removeItem(item.id);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

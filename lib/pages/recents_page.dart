import 'package:flutter/material.dart';

class RecentsPage extends StatelessWidget {
  const RecentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Recents')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 10,
        itemBuilder: (context, index) {
          final isMissed = index % 3 == 0;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: colorScheme.secondaryContainer.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor: isMissed
                      ? colorScheme.error.withOpacity(0.2)
                      : colorScheme.secondaryContainer,
                  child: Icon(
                    Icons.person,
                    color: isMissed ? colorScheme.error : colorScheme.onSecondaryContainer,
                    size: 28,
                  ),
                ),
                title: Text(
                  index % 2 == 0 ? 'John Doe' : '+1 234 567 890',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: colorScheme.onSurface,
                  ),
                ),
                subtitle: Row(
                  children: [
                    Icon(
                      isMissed ? Icons.call_missed : Icons.call_made,
                      size: 14,
                      color: isMissed ? colorScheme.error : colorScheme.secondary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Mobile, 2h ago',
                      style: TextStyle(
                        fontSize: 12,
                        color: colorScheme.outline,
                      ),
                    ),
                  ],
                ),
                trailing: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme.secondaryContainer.withOpacity(0.5),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.call,
                      size: 18,
                      color: colorScheme.onSecondaryContainer,
                    ),
                    onPressed: () {},
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

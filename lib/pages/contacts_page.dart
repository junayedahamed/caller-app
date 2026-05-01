import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 15,
        itemBuilder: (context, index) {
          final name = 'Contact ${index + 1}';
          final phone = '+1 (555) 000-${index.toString().padLeft(4, '0')}';
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF2B2930).withOpacity(0.6)
                    : colorScheme.primaryContainer.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor: isDark
                      ? colorScheme.primaryContainer
                      : colorScheme.primaryContainer,
                  child: Text(
                    name[0],
                    style: TextStyle(
                      color: isDark
                          ? const Color(0xFFEADDFF)
                          : colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                ),
                title: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: isDark ? const Color(0xFFEADDFF) : colorScheme.onSurface,
                  ),
                ),
                subtitle: Text(
                  phone,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? const Color(0xFFB39DDB) : colorScheme.outline,
                  ),
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
                      color: isDark
                          ? const Color(0xFFEADDFF)
                          : colorScheme.onSecondaryContainer,
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

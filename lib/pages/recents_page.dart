import 'package:flutter/material.dart';
import '../models/recent_call.dart';
import '../widgets/dialpad_widget.dart';

class RecentsPage extends StatefulWidget {
  const RecentsPage({super.key});

  @override
  State<RecentsPage> createState() => _RecentsPageState();
}

class _RecentsPageState extends State<RecentsPage> {
  String _searchQuery = '';
  bool _isDialpadVisible = false;
  List<RecentCall> _filteredCalls = mockRecentCalls;

  void _onDigitPressed(String digit) {
    setState(() {
      _searchQuery += digit;
      _filterCalls();
    });
  }

  void _onBackspace() {
    if (_searchQuery.isNotEmpty) {
      setState(() {
        _searchQuery = _searchQuery.substring(0, _searchQuery.length - 1);
        _filterCalls();
      });
    }
  }

  void onLongBackPress() {
    setState(() {
      _searchQuery = '';
      _filterCalls();
    });
  }

  void _filterCalls() {
    if (_searchQuery.isEmpty) {
      _filteredCalls = mockRecentCalls;
    } else {
      _filteredCalls = mockRecentCalls.where((call) {
        return call.phoneNumber.contains(_searchQuery) ||
            call.name.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }
  }

  void _toggleDialpad() {
    setState(() {
      _isDialpadVisible = !_isDialpadVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recents'),
        actions: [
          if (_searchQuery.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  _searchQuery = '';
                  _filterCalls();
                });
              },
            ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.fromLTRB(
              12,
              12,
              12,
              _isDialpadVisible ? 380 : 80,
            ),
            itemCount: _searchQuery.isNotEmpty && _filteredCalls.isEmpty
                ? 1
                : _filteredCalls.length,
            itemBuilder: (context, index) {
              if (_searchQuery.isNotEmpty && _filteredCalls.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer.withValues(
                        alpha: 0.2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: colorScheme.primary.withValues(alpha: 0.1),
                      ),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundColor: colorScheme.primaryContainer,
                        child: Icon(
                          Icons.person_add,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                      title: Text(
                        'Create new contact',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      subtitle: Text(
                        'Add $_searchQuery to contacts',
                        style: TextStyle(color: colorScheme.outline),
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Adding $_searchQuery to contacts...',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }

              final call = _filteredCalls[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer.withValues(
                      alpha: 0.3,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundColor: call.isMissed
                          ? colorScheme.error.withValues(alpha: 0.2)
                          : colorScheme.secondaryContainer,
                      child: Icon(
                        Icons.person,
                        color: call.isMissed
                            ? colorScheme.error
                            : colorScheme.onSecondaryContainer,
                        size: 28,
                      ),
                    ),
                    title: Text(
                      call.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          call.phoneNumber,
                          style: TextStyle(
                            fontSize: 13,
                            color: colorScheme.secondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              call.isMissed
                                  ? Icons.call_missed
                                  : Icons.call_made,
                              size: 14,
                              color: call.isMissed
                                  ? colorScheme.error
                                  : colorScheme.secondary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${call.type}, 2h ago',
                              style: TextStyle(
                                fontSize: 12,
                                color: colorScheme.outline,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorScheme.secondaryContainer.withValues(
                          alpha: 0.5,
                        ),
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
          if (_isDialpadVisible)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: DialpadWidget(
                onLongBackPress: onLongBackPress,
                phoneNumber: _searchQuery,
                onDigitPressed: _onDigitPressed,
                onBackspace: _onBackspace,
                onCallPressed: () {
                  if (_searchQuery.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Calling $_searchQuery...')),
                    );
                  }
                },
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _toggleDialpad,
        label: Text(_isDialpadVisible ? 'Close' : 'Dialpad'),
        icon: Icon(
          _isDialpadVisible ? Icons.keyboard_arrow_down : Icons.dialpad,
        ),
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
      ),
    );
  }
}

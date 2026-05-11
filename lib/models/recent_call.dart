class RecentCall {
  final String name;
  final String phoneNumber;
  final DateTime timestamp;
  final bool isMissed;
  final String type;

  RecentCall({
    required this.name,
    required this.phoneNumber,
    required this.timestamp,
    required this.isMissed,
    this.type = 'Mobile',
  });
}

final List<RecentCall> mockRecentCalls = [
  RecentCall(
    name: 'John Doe',
    phoneNumber: '1234567890',
    timestamp: DateTime.now().subtract(const Duration(hours: 2)),
    isMissed: true,
  ),
  RecentCall(
    name: 'Jane Smith',
    phoneNumber: '0987654321',
    timestamp: DateTime.now().subtract(const Duration(hours: 5)),
    isMissed: false,
  ),
  RecentCall(
    name: 'Alice Johnson',
    phoneNumber: '1122334455',
    timestamp: DateTime.now().subtract(const Duration(days: 1)),
    isMissed: false,
  ),
  RecentCall(
    name: 'Bob Brown',
    phoneNumber: '5544332211',
    timestamp: DateTime.now().subtract(const Duration(days: 2)),
    isMissed: true,
  ),
  RecentCall(
    name: 'Charlie Davis',
    phoneNumber: '6677889900',
    timestamp: DateTime.now().subtract(const Duration(days: 3)),
    isMissed: false,
  ),
  RecentCall(
    name: 'David Wilson',
    phoneNumber: '1231231234',
    timestamp: DateTime.now().subtract(const Duration(days: 4)),
    isMissed: true,
  ),
  RecentCall(
    name: 'Eve Miller',
    phoneNumber: '4321432143',
    timestamp: DateTime.now().subtract(const Duration(days: 5)),
    isMissed: false,
  ),
];

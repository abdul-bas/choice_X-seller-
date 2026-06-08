

String formatLabel(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));
  if (date == today) return 'Today';
  if (date == yesterday) return 'Yesterday';
  const m = [
    '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];
  return date.year != now.year
      ? '${date.day} ${m[date.month]} ${date.year}'
      : '${date.day} ${m[date.month]}';
}
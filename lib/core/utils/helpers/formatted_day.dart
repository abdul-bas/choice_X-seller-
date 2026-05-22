String formatDay(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final messageDay = DateTime(date.year, date.month, date.day);

  if (messageDay == today) return 'Today';
  if (messageDay == today.subtract(const Duration(days: 1))) {
    return 'Yesterday';
  }

  return '${date.day}/${date.month}/${date.year}';
}

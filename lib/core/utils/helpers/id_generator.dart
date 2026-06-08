String generateProductId() {
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  final random = timestamp.toString().substring(timestamp.toString().length - 4);
  return "PROD$random$timestamp";
}

import 'dart:ui';

Color returnStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'pending':      return const Color(0xFFFB923C);
    case 'under review': return const Color(0xFF60A5FA);
    case 'approved':     return const Color(0xFF34D399);
    case 'refunded':     return const Color(0xFF4ADE80);
    case 'rejected':     return const Color(0xFFF87171);
    default:             return const Color(0xFF6B7280);
  }
}
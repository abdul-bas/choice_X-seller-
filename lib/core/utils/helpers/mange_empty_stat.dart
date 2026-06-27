String getEmptyMessage(String title) {
  return switch (title) {
    'Total Earnings' => 'Start earning today ',
    'Total Orders' => 'No orders yet ',
    'Pending Orders' => 'No pending orders ',
    'Completed Orders' => 'Complete your first order ',
    _ => 'No data available',
  };
}
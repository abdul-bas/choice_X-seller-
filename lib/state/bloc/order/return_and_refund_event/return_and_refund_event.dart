import 'package:choice_x_seller/state/bloc/order/order_event/order_event.dart';

class ReadReturnAndRefund extends OrderEvent {
  
  
  

}
class ChangeReturnAndRefundStatus extends OrderEvent {
  final String status;
  final String id;
  ChangeReturnAndRefundStatus({
    required this.id,
    required this.status,
  });
  

}
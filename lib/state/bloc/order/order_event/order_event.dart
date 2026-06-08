

abstract class OrderEvent {}

class ChangeOrderItemStatus extends OrderEvent {
  final String status;
  final String id;
  ChangeOrderItemStatus({
    required this.id,
    required this.status,
  });
  

}
class ReadOrders extends OrderEvent {
  
  
  

}




class ReturnRequestModel {
  final String requestId;
  final String orderId;
  final String userId;
  final String sellerId;
  final String paymentId;
  final String type;
  final String reason;
  final String status;
  final DateTime createdAt;
  ReturnRequestModel({
    required this.requestId,
    required this.orderId,
    required this.userId,
    required this.sellerId,
    required this.paymentId,
    required this.type,
    required this.reason,
    required this.status,
    required this.createdAt,
  });

  factory ReturnRequestModel.fromJson(Map<String, dynamic> json) {
    return ReturnRequestModel(
      requestId: json['requestId'],
      orderId: json['orderId'],
      userId: json['userId'],
      sellerId: json['sellerId'],
      paymentId: json['paymentId'],

      
      type:  json['type'],
      

      status:  json['status'],
      

      reason: json['reason'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

 
  Map<String, dynamic> toJson() {
    return {
      "requestId": requestId,
      "orderId": orderId,
      "userId": userId,
      "sellerId": sellerId,
      "paymentId": paymentId,
      "type": type,
      "status": status,
      "reason": reason,
      "createdAt": createdAt.toIso8601String(),
    };
  }
}
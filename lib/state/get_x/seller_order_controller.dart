import 'package:choice_x_seller/models/order_model/order_model.dart';
import 'package:choice_x_seller/repository/auth_repository/repository.dart';
import 'package:choice_x_seller/repository/order/orders_repository.dart';
import 'package:choice_x_seller/state/get_x/order_status_filter_controller.dart';
import 'package:choice_x_seller/state/get_x/stat_filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SellerOrderController extends GetxController {
  List<OrderModel> allOrders = [];
  List<OrderModel> filteredOrders = [];

  bool init = false;
  bool searchOpen = false;
  bool isLoading = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController searchCtrl = TextEditingController();
  final FocusNode searchFocus = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String image = '';

  int placed = 0;
  int confirmed = 0;
  int processing = 0;
  int outForDelivery = 0;
  int delivered = 0;
  int cancelled = 0;
  int allTotalOrders = 0;

 
  int totalOrder = 0;
  int totalRevenue = 0;
  int pendingOrders = 0;
  int completedOrders = 0;

 
  int filteredPlaced = 0;
  int filteredConfirmed = 0;
  int filteredProcessing = 0;
  int filteredOutForDelivery = 0;
  int filteredDelivered = 0;
  int filteredCancelled = 0;
  int filteredStatusTotal = 0;

  void setOrders(List<OrderModel> orders) {
    allOrders = orders;
    filteredOrders = List.from(orders);
    update();
  }

  void toggleSearch() {
    searchOpen = !searchOpen;
    if (!searchOpen) clearSearch();
    update();
  }

  void clearSearch() {
    searchCtrl.clear();
    filteredOrders = List.from(allOrders);
    update();
  }

  void searchFilter(String query) {
    final q = query.toLowerCase().trim();
    if (q.isEmpty) {
      filteredOrders = List.from(allOrders);
    } else {
      filteredOrders = allOrders.where((order) {
        return order.orderId.toLowerCase().contains(q) ||
            order.amount.toString().contains(q) ||
            order.itemStatus.toLowerCase().contains(q) ||
            order.paymentStatus.toLowerCase().contains(q) ||
            order.paymentMethod.toLowerCase().contains(q) ||
            order.paymentAddress.toLowerCase().contains(q) ||
            order.quantity.toString().contains(q);
      }).toList();
    }
    update();
  }

  Future<void> fetchTotalOrder() async {
    try {
      isLoading = true;
      update();

      final now = DateTime.now();

      final data =
          await OrdersOprations().firestore.collection('orders').get();

      allOrders = List<OrderModel>.from(
        data.docs.map((doc) {
          final map = Map<String, dynamic>.from(doc.data() as Map);
          return OrderModel.fromMap(map);
        }),
      );

      
      totalOrder = 0;
      totalRevenue = 0;
      pendingOrders = 0;
      completedOrders = 0;

      placed = 0;
      confirmed = 0;
      processing = 0;
      outForDelivery = 0;
      delivered = 0;
      cancelled = 0;
      allTotalOrders = 0;

      filteredPlaced = 0;
      filteredConfirmed = 0;
      filteredProcessing = 0;
      filteredOutForDelivery = 0;
      filteredDelivered = 0;
      filteredCancelled = 0;
      filteredStatusTotal = 0;

      final sellerId = AuthRepository().sellerId().trim();

     
      final statFilter = Get.find<StatFilterController>();
      final statusFilter = Get.find<OrderStatusFilterController>();

      for (var order in allOrders) {
        final orderSeller = order.sellerId.trim();
        if (sellerId != orderSeller) continue;

        allTotalOrders++;

        
        _accumulateStatusCounts(order, allTime: true);
<<<<<<< HEAD
      
=======

>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
      
        if (_isInPeriod(order.date, statFilter.selected, now)) {
          totalOrder++;
          totalRevenue += (order.amount * order.quantity).toInt();

          final status = order.itemStatus.toLowerCase().trim();
          if (status == 'pending' || status == 'order placed') {
            pendingOrders++;
          } else if (status == 'delivered') {
            completedOrders++;
          }
        }

     
        if (_isInPeriod(order.date, statusFilter.selected, now)) {
          filteredStatusTotal++;
<<<<<<< HEAD
        
          
=======
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
          _accumulateStatusCounts(order, allTime: false);
        }
      }

      filteredOrders = List.from(allOrders);
      isLoading = false;
      update();
    } catch (e, st) {
      print('FETCH ERROR: $e');
      print(st);
      isLoading = false;
      update();
    }
  }

  void _accumulateStatusCounts(OrderModel order, {required bool allTime}) {
    final status = order.itemStatus.toLowerCase().trim();
    switch (status) {
      case 'pending':
      case 'order placed':
        allTime ? placed++ : filteredPlaced++;
        break;
      case 'order confirmed':
        allTime ? confirmed++ : filteredConfirmed++;
        break;
      case 'processing':
        allTime ? processing++ : filteredProcessing++;
        break;
      case 'out for delivery':
        allTime ? outForDelivery++ : filteredOutForDelivery++;
        break;
      case 'delivered':
        allTime ? delivered++ : filteredDelivered++;
        break;
      case 'cancelled':
        allTime ? cancelled++ : filteredCancelled++;
        break;
    }
  }

  bool _isInPeriod(DateTime date, String filter, DateTime now) {
    switch (filter) {
      case 'Today':
        return date.year == now.year &&
            date.month == now.month &&
            date.day == now.day;
      case 'This Week':
        final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        final start = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
        final end = start.add(const Duration(days: 7));
        return date.isAfter(start.subtract(const Duration(seconds: 1))) &&
            date.isBefore(end);
      case 'This Month':
      default:
        return date.year == now.year && date.month == now.month;
    }
  }
<<<<<<< HEAD
  
=======
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7

  void setInitialization() {
    init = true;
    update();
  }

  @override
  void onClose() {
    nameController.dispose();
    searchCtrl.dispose();
    searchFocus.dispose();
    super.onClose();
  }
}
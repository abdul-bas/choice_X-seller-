import 'package:choice_x_seller/models/return_and_refund/return_and_refund.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ReturnRequestController extends GetxController {
  final searchController = TextEditingController();
  final searchFocus = FocusNode();

  final RxBool isSearchOpen = false.obs;
  final Rxn<List<ReturnRequestModel>> filteredRequests =
      Rxn<List<ReturnRequestModel>>();

  void toggleSearch() {
    isSearchOpen.value = !isSearchOpen.value;

    if (isSearchOpen.value) {
      searchFocus.requestFocus();
    } else {
      closeSearch();
    }
  }

  void closeSearch() {
    searchController.clear();
    searchFocus.unfocus();
    isSearchOpen.value = false;
    filteredRequests.value = null;
  }

  void onSearch(
    String query,
    List<ReturnRequestModel> allRequests,
  ) {
    if (query.trim().isEmpty) {
      filteredRequests.value = null;
      return;
    }

    filteredRequests.value = allRequests.where((item) {
      return item.orderId
              .toLowerCase()
              .contains(query.toLowerCase()) ||item.status
              .toLowerCase()
              .contains(query.toLowerCase()) ||
         item.reason
              .toLowerCase()
              .contains(query.toLowerCase()) || item.type
              .toLowerCase()
              .contains(query.toLowerCase());
    }).toList();
  }

  @override
  void onClose() {
    searchController.dispose();
    searchFocus.dispose();
    super.onClose();
  }
}
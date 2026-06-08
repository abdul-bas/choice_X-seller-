import 'package:flutter/material.dart';

Widget? handleSnapshot(AsyncSnapshot snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return const SizedBox();
  }

  if (snapshot.hasError) {
    print(snapshot.error);
    return Center(child: Text("Error: ${snapshot.error}"));
  }

  if (!snapshot.hasData || snapshot.data == null) {
    return const Center(child: Text("No data found"));
  }
  if (!snapshot.hasData || snapshot.data == null) {
    return const Center(child: Text("No data found"));
  }
  if (snapshot.connectionState == ConnectionState.waiting) {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

  return null;
}

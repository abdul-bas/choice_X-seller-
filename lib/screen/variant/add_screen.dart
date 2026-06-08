import 'package:choice_x_seller/screen/variant/widgets/variant_body.dart';
import 'package:choice_x_seller/screen/variant/widgets/variant_dialog_shell.dart';
import 'package:choice_x_seller/state/get_x/variant_controller.dart';
import 'package:choice_x_seller/screen/variant/widgets/variant_footer.dart';
import 'package:choice_x_seller/screen/variant/widgets/variant_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class VariantScreen extends StatefulWidget {
  const VariantScreen({super.key});

  @override
  State<VariantScreen> createState() => _VariantScreenState();
}

class _VariantScreenState extends State<VariantScreen> {
  late final VariantController c;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    c = Get.find<VariantController>();
    c.reset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => VariantDialogShell(
        formKey: _formKey,
        header:  buildVariantHeader(context),
        body:    VariantBody(context: context),
        footer:  buildVariantFooter(context, _formKey),
      );
}


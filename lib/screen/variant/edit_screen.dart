import 'package:choice_x_seller/models/variant_model/variant_model.dart';
import 'package:choice_x_seller/screen/variant/widgets/variant_body.dart';
import 'package:choice_x_seller/screen/variant/widgets/variant_dialog_shell.dart';
import 'package:choice_x_seller/screen/variant/widgets/variant_footer.dart';
import 'package:choice_x_seller/screen/variant/widgets/variant_header.dart';
import 'package:choice_x_seller/state/get_x/variant_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class EditVariantScreen extends StatefulWidget {
  const EditVariantScreen({super.key, required this.variant});
  final VariantModel variant;

  @override
  State<EditVariantScreen> createState() => _EditVariantScreenState();
}

class _EditVariantScreenState extends State<EditVariantScreen> {
  final VariantController c = Get.find<VariantController>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    c.setVariantsForEdit(widget.variant);
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
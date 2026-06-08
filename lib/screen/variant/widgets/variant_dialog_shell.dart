
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class VariantDialogShell extends StatelessWidget {
  const VariantDialogShell({
    super.key,
    required this.formKey,
    required this.header,
    required this.body,
    required this.footer,
  });

  final GlobalKey<FormState> formKey;
  final Widget header;
  final Widget body;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    final size    = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Dialog(
        backgroundColor: AppColors.transparent,
        insetPadding: EdgeInsets.symmetric(
          horizontal: isMobile ? 0 : 24,
          vertical:   isMobile ? 0 : 16,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth:  isMobile ? double.infinity : 960,
            maxHeight: isMobile ? size.height : 680,
          ),
          child: Container(
            decoration: BoxDecoration(
              color:         AppColors.variantDialogBg,
              borderRadius:  BorderRadius.circular(24),
              border:        Border.all(color: AppColors.variantBorder),
              boxShadow: [
                BoxShadow(
                  color:       AppColors.variantGlowWhite,
                  blurRadius:  80,
                  spreadRadius: 8,
                ),
                BoxShadow(
                  color:      AppColors.variantShadowDeep,
                  blurRadius: 50,
                  offset:     const Offset(0, 28),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: isMobile ? MainAxisSize.max : MainAxisSize.min,
                  children: [
                    header,
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.fromLTRB(
                          isMobile ? 16 : 22,
                          isMobile ? 16 : 20,
                          isMobile ? 16 : 22,
                          isMobile ? 16 : 20,
                        ),
                        child: body,
                      ),
                    ),
                    if (isMobile)
                      Container(
                        decoration: BoxDecoration(
                          color:  AppColors.variantDialogBg,
                          border: Border(
                            top: BorderSide(color: AppColors.variantBorder),
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
                        child: footer,
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22, 0, 22, 20),
                        child: footer,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
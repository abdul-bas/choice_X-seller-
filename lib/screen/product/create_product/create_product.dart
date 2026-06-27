import 'package:choice_x_seller/core/constants/app_colors.dart';
<<<<<<< HEAD
import 'package:choice_x_seller/screen/product/create_product/widgets/mobile_view/mobile_view.dart';
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'widgets/desk_top/desk_top.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({super.key});

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}
class _CreateProductScreenState extends State<CreateProductScreen> {
  late AddProductController c;

  @override
  void initState() {
    super.initState();

    final c = Get.find<AddProductController>();
    c.clearAll();
  }

  @override
  void dispose() {
    c.clearAll();
    super.dispose();
  }
=======
import 'package:choice_x_seller/state/get_x/product_controller.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/basic_details/basic_deails.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/bottom_bar/bottom_bar.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/category_and_type/category_and_type.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/connectivity_and_warrenty/connectivity_and_warreynty.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/description/description.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/header/desk_top_header.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/header/mobile_header.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/identifiers_and_time_line/time_line.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/physical_attributes/physical_attributes.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/product_images/images.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/section_card/section_card.dart';
import 'package:choice_x_seller/screen/product/create_product/widgets/variant/variant_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:flutter/material.dart';

// ── Palette ──────────────────────────────────────────────────────────────────
class _C {
  static const deepPurple = Color(0xFF26215C);
  static const purple = Color(0xFF3C3489);
  static const purpleMid = Color(0xFF534AB7);
  static const purpleLight = Color(0xFFEEEDFE);
  static const teal = Color(0xFF1D9E75);
  static const tealLight = Color(0xFF5DCAA5);
  static const tealPale = Color(0xFF9FE1CB);
  static const lavender = Color(0xFFAFA9EC);
  static const surface = Color(0xFFF8F8FC);
  static const white = Colors.white;
  static const red = Color(0xFFE24B4A);
}

// ── Entry point (for standalone testing) ─────────────────────────────────────
void main() => runApp(const _App());

class _App extends StatelessWidget {
  const _App();
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'sans-serif'),
        home: const ChoiceXRegistrationPage(),
      );
}

// ── Page ─────────────────────────────────────────────────────────────────────
class ChoiceXRegistrationPage extends StatelessWidget {
  const ChoiceXRegistrationPage({super.key});
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: AppColors.sellerSurfaceDeep,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;

          return isMobile
              ? const MobileLayout(
                  isCreate: true,
                )
              : DesktopLayout(
                  isMobile: false,
                  isCreate: true,
                );
=======
      backgroundColor: _C.surface,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 700;
          return isDesktop
              ? const _DesktopLayout()
              : const _MobileLayout();
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
        },
      ),
    );
  }
}
<<<<<<< HEAD
=======

// ── Desktop: side-by-side ─────────────────────────────────────────────────────
class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(32),
        constraints: const BoxConstraints(maxWidth: 900, maxHeight: 620),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black12, width: 0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Row(
            children: const [
              Expanded(child: _FormPanel()),
              Expanded(child: _BrandPanel()),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Mobile: stacked ───────────────────────────────────────────────────────────
class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          _BrandPanelMobile(),
          _FormPanel(),
        ],
      ),
    );
  }
}

// ── Left / Form Panel ─────────────────────────────────────────────────────────
class _FormPanel extends StatefulWidget {
  const _FormPanel();

  @override
  State<_FormPanel> createState() => _FormPanelState();
}

class _FormPanelState extends State<_FormPanel> {
  final _formKey = GlobalKey<FormState>();
  final _mobileCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool _obscurePass = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _mobileCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 32),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _StepIndicator(),
              const SizedBox(height: 24),
              const Text(
                'Create your seller account',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: _C.deepPurple,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Start selling on ChoiceX in minutes',
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
              const SizedBox(height: 24),
              _OtpField(
                label: 'Mobile number',
                hint: 'Enter mobile number',
                controller: _mobileCtrl,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 14),
              _OtpField(
                label: 'Email ID',
                hint: 'Enter email address',
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 14),
              _PasswordField(
                label: 'Create password',
                hint: 'Min. 8 characters',
                controller: _passCtrl,
                obscure: _obscurePass,
                onToggle: () => setState(() => _obscurePass = !_obscurePass),
              ),
              const SizedBox(height: 14),
              _PasswordField(
                label: 'Confirm password',
                hint: 'Re-enter password',
                controller: _confirmCtrl,
                obscure: _obscureConfirm,
                onToggle: () =>
                    setState(() => _obscureConfirm = !_obscureConfirm),
              ),
              const SizedBox(height: 12),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                  children: [
                    TextSpan(text: 'By continuing, I agree to ChoiceX\'s '),
                    TextSpan(
                      text: 'Terms of Use',
                      style: TextStyle(color: _C.purpleMid),
                    ),
                    TextSpan(text: ' & '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(color: _C.purpleMid),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Handle registration
                    }
                  },
                  icon: const SizedBox.shrink(),
                  label: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Register & Continue',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.4,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 16),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _C.purple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Step Indicator ────────────────────────────────────────────────────────────
class _StepIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Step(label: 'Email & Password', isDone: true, isActive: false),
        Container(width: 28, height: 1, color: Colors.black26),
        _Step(label: 'Business Details', isDone: false, isActive: true),
      ],
    );
  }
}

class _Step extends StatelessWidget {
  final String label;
  final bool isDone;
  final bool isActive;

  const _Step(
      {required this.label, required this.isDone, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final Color dotBg = isDone
        ? _C.teal
        : isActive
            ? _C.purple
            : Colors.black12;
    final Color textColor = isDone
        ? _C.teal
        : isActive
            ? _C.purple
            : Colors.black38;

    return Row(
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(color: dotBg, shape: BoxShape.circle),
          child: Icon(
            isDone ? Icons.check : Icons.circle,
            color: Colors.white,
            size: isDone ? 11 : 6,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            color: textColor,
          ),
        ),
      ],
    );
  }
}

// ── OTP Input Field ───────────────────────────────────────────────────────────
class _OtpField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const _OtpField({
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black54),
            children: const [
              TextSpan(text: ' *', style: TextStyle(color: _C.red)),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26, width: 0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  keyboardType: keyboardType,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Colors.black38),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                  ),
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Required' : null,
                ),
              ),
              Container(
                height: 44,
                decoration: const BoxDecoration(
                  border: Border(
                      left: BorderSide(color: Colors.black12, width: 0.5)),
                ),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: _C.purpleMid,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text('Send OTP',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Password Field ────────────────────────────────────────────────────────────
class _PasswordField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool obscure;
  final VoidCallback onToggle;

  const _PasswordField({
    required this.label,
    required this.hint,
    required this.controller,
    required this.obscure,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black54),
            children: const [
              TextSpan(text: ' *', style: TextStyle(color: _C.red)),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26, width: 0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscure,
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(fontSize: 14, color: Colors.black38),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              suffixIcon: IconButton(
                icon: Icon(
                  obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  size: 18,
                  color: Colors.black38,
                ),
                onPressed: onToggle,
              ),
            ),
            validator: (v) =>
                (v == null || v.length < 8) ? 'Min. 8 characters' : null,
          ),
        ),
      ],
    );
  }
}

// ── Right / Brand Panel (Desktop) ─────────────────────────────────────────────
class _BrandPanel extends StatelessWidget {
  const _BrandPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _C.deepPurple,
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            top: -40,
            right: -40,
            child: _DecoCircle(size: 200, color: _C.purple, opacity: 0.5),
          ),
          Positioned(
            bottom: 60,
            left: -60,
            child: _DecoCircle(size: 180, color: _C.teal, opacity: 0.25),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _BrandLogo(),
                const Spacer(),
              
                const SizedBox(height: 20),
                _Quote(),
                const SizedBox(height: 20),
                _Features(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Brand Panel Mobile (compact top banner) ───────────────────────────────────
class _BrandPanelMobile extends StatelessWidget {
  const _BrandPanelMobile();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: _C.deepPurple,
      padding: const EdgeInsets.fromLTRB(24, 36, 24, 28),
      child: Stack(
        children: [
          Positioned(
            top: -20,
            right: -20,
            child: _DecoCircle(size: 120, color: _C.purple, opacity: 0.5),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _BrandLogo(),
              const SizedBox(height: 20),
            
            ],
          ),
        ],
      ),
    );
  }
}

// ── Brand Logo ────────────────────────────────────────────────────────────────
class _BrandLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
            children: [
              TextSpan(text: 'choice'),
              TextSpan(text: 'X', style: TextStyle(color: _C.tealPale)),
            ],
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "India's next-generation seller marketplace",
          style: TextStyle(
              fontSize: 12,
              color: _C.lavender,
              fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}


// ── Quote ─────────────────────────────────────────────────────────────────────
class _Quote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.07),
        border: const Border(
          left: BorderSide(color: _C.tealLight, width: 2),
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '"ChoiceX helped me scale from a local shop to a nationwide brand in under 6 months."',
            style: TextStyle(
                fontSize: 12,
                color: Color(0xFFEEEDFE),
                fontStyle: FontStyle.italic,
                height: 1.6),
          ),
          SizedBox(height: 8),
          Text(
            '— Arjun Menon, Seller from Kochi',
            style: TextStyle(
                fontSize: 11,
                color: _C.lavender,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

// ── Feature List ──────────────────────────────────────────────────────────────
class _Features extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const items = [
      (Icons.local_shipping_outlined, 'Nationwide logistics & delivery network'),
      (Icons.verified_user_outlined, 'Seller protection & dispute resolution'),
      (Icons.show_chart_rounded, 'Real-time analytics dashboard'),
    ];

    return Column(
      children: items
          .map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: _C.tealLight.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(item.$1, size: 14, color: _C.tealLight),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        item.$2,
                        style: const TextStyle(
                            fontSize: 12, color: Color(0xFFEEEDFE)),
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}

// ── Decorative Circle ─────────────────────────────────────────────────────────
class _DecoCircle extends StatelessWidget {
  final double size;
  final Color color;
  final double opacity;

  const _DecoCircle(
      {required this.size, required this.color, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withValues(alpha: opacity),
        shape: BoxShape.circle,
      ),
    );
  }
}
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7

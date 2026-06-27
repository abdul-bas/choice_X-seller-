import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.sellerSurfaceDeep,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;
          final isTablet =
              constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
          final isDesktop = constraints.maxWidth >= 1024;
          if (isMobile) {
            return _MobileLayout();
          }
          return _DesktopLayout();
        },
      ),
    );
  }
}

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
              Expanded(
                child: SizedBox(),
              ),
              Expanded(child: _BrandPanel()),
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          _BrandPanelMobile(),
        ],
      ),
    );
  }
}

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
              fontSize: 12, color: _C.lavender, fontWeight: FontWeight.w300),
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
                fontSize: 11, color: _C.lavender, fontWeight: FontWeight.w500),
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
      (
        Icons.local_shipping_outlined,
        'Nationwide logistics & delivery network'
      ),
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

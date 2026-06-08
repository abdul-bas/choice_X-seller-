import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SectionCard extends StatefulWidget {
  const SectionCard({
    super.key,
    required this.tag,
    required this.title,
    required this.child,
   
  });

  final String tag;
  final String title;
  final Widget child;
  

  @override
  State<SectionCard> createState() => _SectionCardState();
}

class _SectionCardState extends State<SectionCard>
    with SingleTickerProviderStateMixin {
   final ValueNotifier<bool> _expanded=ValueNotifier(false);
  late AnimationController _rotateCtrl;

  @override
  void initState() {
    super.initState();
   
    _rotateCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
      value: _expanded.value ? 1.0 : 0.0,
    );
  }

  @override
  void dispose() {
    _rotateCtrl.dispose();
    super.dispose();
  }

  void _toggle(bool value) {
     value ? _rotateCtrl.forward() : _rotateCtrl.reverse();
   _expanded.value = !value;
   
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.07),
            width: 0.5,
          ),
        ),
        child: ValueListenableBuilder(
          valueListenable: _expanded,
          builder: (context, value, child) {
            return Column(
              children: [
               
                InkWell(
                  onTap:()=> _toggle(value),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFEEEDFE),
                          ),
                        ),
                        const Spacer(),
                        RotationTransition(
                          turns: Tween(begin: 0.0, end: 0.5).animate(_rotateCtrl),
                          child: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 18,
                            color: AppColors.lavender,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 200),
                  crossFadeState: value
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: widget.child,
                  ),
                  secondChild: const SizedBox.shrink(),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}

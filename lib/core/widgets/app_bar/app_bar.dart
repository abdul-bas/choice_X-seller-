
import 'package:choice_x_seller/core/constants/app_color.dart';
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/app_bar_config/app_bar_config.dart';
import 'package:flutter/material.dart';
class UniversalAppBar extends StatelessWidget {
  final AppBarConfig config;
  final bool isMobile;
  final BuildContext? parentContext;
  final ValueChanged<String>? onSearch;
  final VoidCallback? onAdd;
  final Widget? searchButton;
  final Widget? addButton;
  final bool searchOpen;
  final TextEditingController? searchCtrl;
  final FocusNode? searchFocus;
  final void Function()? onSearchClose;

  const UniversalAppBar({
    super.key,
    required this.config,
    this.isMobile = false,
    this.parentContext,
    this.onSearch,
    this.onAdd,
    this.searchButton,
    this.addButton,
    this.searchFocus,
    this.searchCtrl,
    required this.searchOpen,
    this.onSearchClose,
  });

  @override
  Widget build(BuildContext context) {
    final cfg = config;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      margin: isMobile ? null : const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: AppColors.sellerSurface,
        borderRadius: isMobile ? null : const BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (isMobile) Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                    width: isMobile ? 32 : 38,
                    height: isMobile ? 32 : 38,
                    decoration: BoxDecoration(
                      color: cfg.accent.withValues(alpha: 0.13),
                      borderRadius: BorderRadius.circular(isMobile ? 8 : 10),
                    ),
                    child: Icon(
                      isMobile ? Icons.menu_rounded : cfg.icon,
                      color: cfg.accent,
                      size: isMobile ? 15 : 18,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cfg.title,
                        style: TextStyle(
                          color: AppColors.appBarTitleText,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        cfg.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.appBarSubtitleText,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                if (searchButton != null) ...[
                  searchButton!,
                  const SizedBox(width: 8),
                ],
                if (addButton != null && !isMobile) addButton!,
              ],
            ),
          ),
          if (searchOpen) const SizedBox(height: 15),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            height: (searchButton != null && searchOpen) ? 40.0 : 0,
            child: ClipRect(
              child: SizedBox(
                height: 40.0,
                child: Container(
                  decoration: const BoxDecoration(),
                  padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 16),
                  child: TextField(
                    controller: searchCtrl,
                    focusNode: searchFocus,
                    onChanged: onSearch,
                    style: TextStyle(
                      color: AppColors.appBarSearchText,
                      fontSize: 13,
                    ),
                    decoration: InputDecoration(
                      hintText: cfg.searchHint ?? 'Search...',
                      hintStyle: TextStyle(
                        color: AppColors.appBarSearchHint,
                        fontSize: 13,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Icon(
                          Icons.search_rounded,
                          size: 16,
                          color: AppColors.appBarSearchIcon,
                        ),
                      ),
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 40,
                        minHeight: 0,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: onSearchClose,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: AppColors.appBarSearchCloseBg,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close_rounded,
                              size: 12,
                              color: AppColors.appBarSearchCloseIcon,
                            ),
                          ),
                        ),
                      ),
                      suffixIconConstraints: const BoxConstraints(
                        minWidth: 40,
                        minHeight: 0,
                      ),
                      filled: true,
                      fillColor: bg,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 4,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: AppColors.appBarSearchBorder,
                          width: 0.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: AppColors.appBarSearchBorder,
                          width: 0.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: AppColors.appBarSearchFocusBorder,
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
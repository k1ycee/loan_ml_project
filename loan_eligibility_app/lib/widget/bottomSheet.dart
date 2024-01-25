import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loan_eligibility_app/services/navigation_service.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CustomBottomSheet<T> extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.child,
    this.padding,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;

  static Future<K?> show<K>({
    required Widget child,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    bool? isDismissible,
  }) =>
      showCupertinoModalBottomSheet(
        context: navigator.context,
        backgroundColor: backgroundColor ?? Colors.transparent,
        shadow: const BoxShadow(color: Colors.transparent),
        isDismissible: isDismissible,
        enableDrag: isDismissible ?? true,
        barrierColor: Colors.grey.withOpacity(0.4),
        builder: (context) {
          return CustomBottomSheet<K>(
            padding: padding,
            child: child,
          );
        },
      );

  static Future<C?> showDragIndicator<C>({
    required Widget child,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    bool? isDismissible,
    bool isModalBack = false,
    void Function()? onClose,
  }) {
    return show<C>(
      padding: padding,
      backgroundColor: backgroundColor ?? Colors.transparent,
      isDismissible: isDismissible,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(),
          Stack(
            children: [
              child,
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.all(20).add(
            const EdgeInsets.only(bottom: 9),
          ),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 300),
        builder: (_, value, child) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: value, sigmaY: value),
            child: child,
          );
        },
        child: Material(
          color: Colors.black.withOpacity(0.00),
          child: child,
        ),
      ),
    );
  }
}


class WhiteCard extends StatelessWidget {
  const WhiteCard({super.key, this.child, this.padding, this.height});

  final Widget? child;
  final EdgeInsets? padding;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: height,
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
            child: child,
          ),
        ),
      ),
    );
  }
}

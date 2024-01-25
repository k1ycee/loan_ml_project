import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomTextField extends StatefulWidget {
  final String? title, hintText, initialValue;
  final bool obscure;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool filled;
  final FormFieldValidator<String?>? valdator;
  final double titleFontSize;
  final Color? titleColor;
  final Color? hintTextColor;
  final bool enabled;
  final Widget? suffix;
  final VoidCallback? onTap;
  const CustomTextField({
    Key? key,
    this.title,
    this.obscure = false,
    this.controller,
    this.inputType,
    this.hintText,
    this.filled = false,
    this.valdator,
    this.titleFontSize = 16,
    this.initialValue,
    this.titleColor,
    this.hintTextColor,
    this.enabled = true,
    this.suffix,
    this.onTap,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 102,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title!,
            style: TextStyle(
              fontSize: widget.titleFontSize,
              fontWeight: FontWeight.w500,
              color: widget.titleColor,
            ),
          ),
          const Gap(8),
          InkWell(
            onTap: widget.onTap,
            child: SizedBox(
              height: 75,
              width: double.infinity,
              child: TextFormField(
                initialValue: widget.initialValue,
                keyboardType: widget.inputType,
                controller: widget.controller,
                obscureText: !isPasswordVisible && widget.obscure,
                validator: widget.valdator,
                enabled: widget.enabled,
                decoration: InputDecoration(
                  filled: widget.filled,
                  // fillColor: AppColors.primaryColorPurple.withOpacity(0.1),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: widget.hintTextColor,
                  ),
                  suffixIcon: widget.suffix,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

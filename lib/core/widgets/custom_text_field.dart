import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.setIcon = false,
    this.keyboardType,
    this.icon,
    this.suffix,
    this.textInputAction = TextInputAction.next,
    this.filled = true,
    this.maxLines,
    this.padding = 15,
    this.onSubmitted,
    this.initialValue,
    this.onChanged,
    this.autofocus = false,
    this.errorText,
    this.borderColor = Colors.white,
  });

  final TextEditingController? controller;
  final bool obscureText;
  final bool? filled;
  final String? hintText;
  final TextInputType? keyboardType;

  final Widget? icon;
  final bool setIcon;
  final Widget? suffix;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final double padding;
  final Color borderColor;

  final Function(String?)? onSubmitted;
  final Function(String)? onChanged;
  final String? initialValue;
  final bool autofocus;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: TextField(
        autofocus: autofocus,
        maxLines: maxLines,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          /////////////////////////////
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          /////////////////////////////
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor.withValues(alpha: 0.75),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          /////////////////////////////
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffDE0A1E), width: 2),
            borderRadius: BorderRadius.circular(12.0),
          ),
          /////////////////////////////
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffDE0A1E), width: 2),
            borderRadius: BorderRadius.circular(12.0),
          ),
          /////////////////////////////
          filled: filled,
          errorText: errorText,
          prefixIcon:
              setIcon
                  ? Padding(padding: const EdgeInsets.all(10.5), child: icon)
                  : null,
          suffixIcon: suffix,
          hintText: hintText,

          hintStyle: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

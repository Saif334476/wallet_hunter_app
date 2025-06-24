import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final void Function(String value) onChanged;
  final String? errorText;

  const CustomTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return TextFormField(
      obscureText: isPassword,
      onChanged: onChanged,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: isDark ? Colors.white : Colors.black87,
      ),
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText, // ✅ show inline error if any
        filled: true,
        fillColor: isDark ? Colors.grey[900] : Colors.grey[200],
        labelStyle: TextStyle(
          color: isDark ? Colors.white70 : Colors.black87,
        ),
        errorStyle: TextStyle(
          color: Colors.redAccent,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? Colors.white24 : Colors.black26,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: theme.colorScheme.primary,
            width: 1.8,
          ),
        ),
      ),
    );
  }
}

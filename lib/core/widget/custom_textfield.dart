import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final int? maxLine;
  final String? hintText;
  final String? errorText;
  const CustomTextfield({
    super.key,
    required this.controller,
    this.maxLine,
    this.hintText,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          onChanged: onChanged,
          controller: controller,
          maxLines: maxLine,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(),
            hintText: hintText,
          ),
        ),
        _buildErrorText(context)
      ],
    );
  }

  Widget _buildErrorText(BuildContext context) {
    if (errorText == null) return const SizedBox();
    return Text(
      "* $errorText",
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.red),
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.controller,
    this.maxLine,
    this.hintText,
    required this.onChanged,
    this.errorText,
  });

  final TextEditingController controller;
  final String? errorText;
  final String? hintText;
  final int? maxLine;
  final Function(String) onChanged;

  Widget _buildErrorText(BuildContext context) {
    if (errorText == null) return const SizedBox();
    return Text(
      "* $errorText",
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.red),
    );
  }

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
}

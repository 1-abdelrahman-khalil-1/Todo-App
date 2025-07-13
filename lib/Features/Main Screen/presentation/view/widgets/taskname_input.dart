import 'package:flutter/material.dart';

class TaskNameInput extends StatelessWidget {
  const TaskNameInput({
    super.key,
    required this.controller,
    this.onSaved,
    required this.validator,
    required this.hintText,
    required this.labelText,
  });

  final TextEditingController controller;
  final void Function(String?)? onSaved;
  final String? Function(String?) validator;
  final String hintText;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}
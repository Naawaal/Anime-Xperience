import 'package:flutter/material.dart';

class TextformfieldWidget extends StatelessWidget {
  final String? hintText;
  final Function(String)? onChanged;
  final Function(String)? onFieldSumbitted;
  final TextEditingController? controller;
  const TextformfieldWidget(
      {super.key,
      this.hintText,
      this.controller,
      this.onFieldSumbitted,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        textInputAction: TextInputAction.search,
        onFieldSubmitted: onFieldSumbitted,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}

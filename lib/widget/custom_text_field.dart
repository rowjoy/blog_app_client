// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextField extends StatelessWidget {
  final String? level;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final Key? fromkey;
  final String? hintText;
  final VoidCallback? onTap;
  final Function(dynamic)? onChanged;
  final FocusNode? focusNode;
  final bool readOnly;
  final EdgeInsetsGeometry? contentPadding;
  final bool? autofocus;
  final Iterable<String>? autofillHints;
  final Function(String)? onFieldSubmitted;
  final int? maxLines;
  const CustomTextField({
    Key? key, this.keyboardType,
    this.level, 
    this.obscureText =  false, 
    this.suffixIcon, 
    this.controller,
    this.prefixIcon,
    this.fromkey,
    this.validator,
    this.autovalidateMode,
    this.inputFormatters,
    this.hintText,
    this.onTap,
    this.focusNode,
    this.readOnly = false,
    this.contentPadding,
    this.onChanged,
    this.autofocus,
    this.autofillHints,
    this.onFieldSubmitted,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
       style: TextStyle(
         color: Colors.black,
         fontSize: 20,
         fontWeight: FontWeight.normal,
       ),
      autofocus: autofocus ?? false,
      key: fromkey,
      
      validator: validator,
      readOnly: readOnly,
      onChanged: onChanged,
      maxLines: maxLines,
      // textInputAction: TextInputAction.next,
      //autovalidateMode: autovalidateMode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      onTap: onTap,
      focusNode: focusNode,
      autofillHints:autofillHints,
      onFieldSubmitted:onFieldSubmitted,
      decoration: InputDecoration(
        contentPadding: contentPadding ?? const EdgeInsets.all(15),
        hintText: hintText,
        isDense: true,
        filled: true,
        suffixIcon: suffixIcon,
        prefixIcon:prefixIcon,
        fillColor: Colors.white,
        label:  level != null ? Text(level!, style: TextStyle(
          color: Colors.black,
        ) ):Text(''),
        errorStyle: TextStyle(
          color: Colors.red,
          fontSize: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color:  Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color:  Colors.black),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color:  Colors.black),
        ),
      ),
    );
  }
}
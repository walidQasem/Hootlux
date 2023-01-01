import 'package:flutter/material.dart';
import 'package:widget/constant/color.dart';
import 'package:widget/main.dart';
import 'package:widget/shared/isBlack.dart';

class Edittext extends StatelessWidget {
  final String labele;
  final String hint;

  final bool obescure;
  final int? maxlent;
  final Widget? icon;
  final Function(String)? onChanged;

  final bool? enabel;
  final double? hightInput;
  final String? type;
  final FocusNode? ff;
  final String? Function(String?) validator;
  final Icon? prifixicon;
  final Function()? onTap;
  final TextEditingController? controller;

  const Edittext(
      {super.key,
      required this.hint,
      this.icon,
      this.controller,
      required this.obescure,
      required this.labele,
      required this.validator,
      this.type,
      this.prifixicon,
      this.maxlent,
      this.enabel,
      this.onTap,
      this.hightInput,
      this.onChanged,
      this.ff});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: ff,
      keyboardType: type == "phone" ? TextInputType.phone : TextInputType.text,
      validator: validator,
      onChanged: onChanged,
      style: TextStyle(
          color: shardp!.getString("themeColor") == "ThemeData#7e127"
              ? const Color.fromARGB(255, 232, 232, 232)
              : const Color.fromARGB(255, 124, 124, 124),
          fontWeight: FontWeight.w600,
          fontSize: 16,
          fontFamily: "cairo"),
      maxLength: maxlent,
      obscureText: obescure,
      readOnly: enabel ?? false,
      controller: controller,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: icon,
        prefixIcon: prifixicon,
        label: Text(labele),
        hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        contentPadding:
            EdgeInsets.symmetric(horizontal: 20, vertical: hightInput ?? 16),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 0.0,
                color: isblack(const Color.fromARGB(255, 74, 74, 74),
                    const Color.fromARGB(255, 229, 229, 229))),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 0,
                color: isblack(const Color.fromARGB(255, 74, 74, 74),
                    const Color.fromARGB(255, 229, 229, 229))),
            borderRadius: BorderRadius.circular(10)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 1.2, color: Color.fromARGB(255, 255, 0, 0)),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                width: 1.2, color: Color.fromARGB(255, 255, 0, 0)),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

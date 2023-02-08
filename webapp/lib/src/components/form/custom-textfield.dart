import 'package:flutter/material.dart';
import 'package:webapp/src/components/form/style/theme.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isObscureText;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    this.isObscureText = false,
    required this.icon,
    required this.label,
    this.validator
  }): super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isOcult = false;
  @override
  void initState() {
    super.initState();
      isOcult = widget.isObscureText;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        validator: widget.validator,
        style: TextStyle(color: CustomColors.gray.shade50, height: 1.5),
        obscureText: isOcult,
        cursorColor: CustomColors.gray.shade50,
        decoration: InputDecoration(
            fillColor: CustomColors.gray.shade50,
            prefixIconColor: CustomColors.gray.shade50,
            suffixIconColor: CustomColors.gray.shade50,
            hoverColor: CustomColors.gray.shade50,
            focusColor: CustomColors.gray.shade50,
            labelText: widget.label,
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.isObscureText ? IconButton(onPressed: (){
              setState(() {
                isOcult = !isOcult;
              });
            }, icon: Icon(isOcult ?  Icons.visibility :  Icons.visibility_off )) : null,
            isDense: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12) )),
      ),
    );
  }
}

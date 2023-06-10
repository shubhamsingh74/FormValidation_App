import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  // final Icon icon;
  // final Icon? suffixIcon;

  const PasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    // this.suffixIcon,
    // required this.icon,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _passwordVisible = false;

  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (pass_valid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        controller: widget.controller,

        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter password";
          } else {
            //call function to check password
            bool result = validatePassword(value);
            if (result) {
              // create account event
              return null;
            } else {
              return " Password should contain Capital,small letter & \n Number & Special";
            }
          }
        },

        keyboardType: TextInputType.emailAddress,
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color:  Color(0xffF7FAF7), width: 1),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          filled: true,
          fillColor: const Color(0xffF7FAF7),
          hintText: widget.hintText,
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(
                () {
                  _passwordVisible = !_passwordVisible;
                },
              );
            },
          ),
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

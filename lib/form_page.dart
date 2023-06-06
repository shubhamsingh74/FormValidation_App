import 'dart:developer';
import 'dart:io';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_project/widgets/custom_buttons.dart';
import 'package:form_project/widgets/custom_textfields.dart';
import 'package:form_project/widgets/profile_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //code for the picking the date of birth of user.
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));

    if (picked != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);

      setState(() {
        //here we can print the date with time
        // _dateOfBirthController.text = picked.toString();

        //here we can only print the formatted year-month-day
        _dateOfBirthController.text = formattedDate;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _userNameController.dispose();
    _dateOfBirthController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  "Welcome..!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                const ProfileImage(),
                CustomTextField(
                  controller: _nameController,
                  hintText: "Name",
                  icon: const Icon(Icons.person),
                  keyboardType: TextInputType.text,
                ),
                CustomTextField(
                  controller: _userNameController,
                  hintText: "User Name",
                  icon: const Icon(Icons.perm_identity_outlined),
                  keyboardType: TextInputType.emailAddress,
                ),

                InkWell(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: AbsorbPointer(
                    child: CustomTextField(
                      controller: _dateOfBirthController,
                      hintText: "Date of Birth",
                      icon: const Icon(Icons.calendar_month_outlined),
                    ),
                  ),
                ),
                CustomTextField(
                  controller: _emailController,
                  hintText: "Email",
                  icon: const Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                ),

                CustomTextField(
                  controller: _passwordController,
                  hintText: "Password",
                  icon: const Icon(
                    Icons.lock,
                  ),
                  suffixIcon: const Icon(Icons.remove_red_eye),
                  keyboardType: TextInputType.number,
                ),

                //forget password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: const Text(
                          "Forget Password..!",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )),
                  ],
                ),

                //submit button
                CustomButton(
                    onTap: () {
                      log("hello");
                    },
                    text: "Submit"),

                const SizedBox(
                  height: 60,
                ),

                //already have an account just login or move to the next page.
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "already have an Account..?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      " Log In",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

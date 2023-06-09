import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_project/constants/string_constants.dart';
import 'package:form_project/widgets/custom_buttons.dart';
import 'package:form_project/widgets/custom_textfields.dart';
import 'package:form_project/widgets/passwordtextformfield.dart';
import 'package:form_project/widgets/profile_image.dart';
import 'package:intl/intl.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formGlobalKey = GlobalKey<FormState>();
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

  //validation for the name
  bool isValidName ({required String value}){
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(value);
  }

  // //validation for the mobile number
  // bool get isValidPhone {
  //   final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
  //   return phoneRegExp.hasMatch(this as String );
  // }
  //
  // //validation for the email id
  // bool get isValidEmail {
  //   final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  //   return emailRegExp.hasMatch(this as String);
  // }

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
            padding:  EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: formGlobalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    "Welcome",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  const ProfileImage(),

                  CustomTextField(
                    controller: _nameController,
                    hintText: "Name",
                    icon: const Icon(Icons.person),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter name";
                      } else {
                        //call function to check password
                        bool result = isValidName(value: value);
                        if (result) {
                          // create account event
                          return null;
                        } else {
                          return "Enter valid name";
                        }
                      }
                    },
                  ),

                  CustomTextField(
                    controller: _userNameController,
                    hintText: "Mobile number",
                    icon: const Icon(Icons.call),
                    keyboardType: TextInputType.number,
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return "Please enter mobile number";
                    //   } else {
                    //     //call function to check password
                    //     bool result = isValidPhone;
                    //     if (result) {
                    //       // create account event
                    //       return null;
                    //     } else {
                    //       return "Enter valid mobile number";
                    //     }
                    //   }
                    // },
                  ),

                  CustomTextField(
                    controller: _emailController,
                    hintText: "Email",
                    icon: const Icon(Icons.email),
                    keyboardType: TextInputType.emailAddress,
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return "Please enter email id";
                    //   } else {
                    //     //call function to check password
                    //     bool result = isValidEmail;
                    //     if (result) {
                    //       // create account event
                    //       return null;
                    //     } else {
                    //       return "Enter valid email id";
                    //     }
                    //   }
                    // },
                  ),

                  InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: AbsorbPointer(
                      child: CustomTextField(
                        controller: _dateOfBirthController,
                        hintText: "Date of birth",
                        icon: const Icon(Icons.calendar_month_outlined),
                      ),
                    ),
                  ),

                  PasswordField(
                    controller: _passwordController,
                    hintText: "Password",
                  ),

                  //forget password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {},
                          child: const Text(
                            "Forget Password",
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
                        formGlobalKey.currentState!.validate();
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
                        "Already have an account?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        " Log in",
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
      ),
    );
  }
}

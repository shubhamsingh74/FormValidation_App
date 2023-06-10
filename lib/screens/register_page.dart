import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:form_project/widgets/custom_buttons.dart';
import 'package:form_project/widgets/custom_textfields.dart';
import 'package:form_project/widgets/passwordtextformfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/backImage.png"),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25)
                  .copyWith(top: 60, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Hi,Create your new account here.",
                    style: TextStyle(
                        color: Color(0xff6C806B),
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Card(
                      color: Colors.white,
                      elevation: 4,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Full Name",
                                style: TextStyle(
                                    color: Color(0xffA5A5A7),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              CustomTextField(
                                icon: const Icon(Icons.person),
                                controller: _nameController,
                                hintText: "Enter Name",
                              ),
                              const Text(
                                "Email",
                                style: TextStyle(
                                    color: Color(0xffA5A5A7),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              CustomTextField(
                                icon: const Icon(Icons.email),
                                controller: _emailController,
                                hintText: "Shubhamsingh@28612gmail.com",
                              ),
                              const Text(
                                "Create Password",
                                style: TextStyle(
                                    color: Color(0xffA5A5A7),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              PasswordField(
                                  controller: _passwordController,
                                  hintText: "hs387cuda"),
                              const Text(
                                "Confirm Password",
                                style: TextStyle(
                                    color: Color(0xffA5A5A7),
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              PasswordField(
                                controller: _confirmController,
                                hintText: "•••••••••••",
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.check_box_outlined),
                                    RichText(
                                      overflow: TextOverflow.ellipsis,
                                      text: const TextSpan(
                                        text: 'I agree to the ',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'Terms & Conditions',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(text: ' and \n'),
                                          TextSpan(
                                              text: 'Privacy Policy',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: CustomButton(
                                    onTap: () {}, text: "Register Now"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20)
                        .copyWith(top: 20),
                    child: Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Already have",
                              style: TextStyle(
                                  fontSize: 17, color: Color(0xffB7B7B7)),
                            ),
                            Text(
                              "an account?",
                              style: TextStyle(
                                  fontSize: 17, color: Color(0xffB7B7B7)),
                            )
                          ],
                        ),
                        const Text(
                          "   -----",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.black)),
                            backgroundColor: Colors.white,
                            minimumSize: const Size(60, 60),
                          ),
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

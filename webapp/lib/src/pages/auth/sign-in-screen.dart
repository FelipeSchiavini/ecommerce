import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webapp/src/components/form/style/theme.dart';
import 'package:webapp/src/components/others/animated-text.dart';
import 'package:webapp/src/components/others/separator.dart';
import 'package:webapp/src/components/services/validator.dart';
import 'package:webapp/src/routes/index.dart';

import '../../components/form/custom-textfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key}); 

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.gray.shade100,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            height: size.height,
            width: size.width > 600 ? 600 : size.width,
            child: Column(children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                      TextSpan(style: const TextStyle(fontSize: 64), children: [
                    const TextSpan(
                        text: "In8",
                        style: TextStyle(
                            color: Colors.purple, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "_Shop_",
                        style: TextStyle(
                          color: CustomColors.red,
                        )),
                  ])),
                  const SizedBox(
                    height: 35,
                    child: DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 25,
                        ),
                        child: CustomAnimatedText()),
                  )
                ],
              )),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 40),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.vertical(
                          top: const Radius.circular(45),
                          bottom: size.width > 600
                              ? const Radius.circular(45)
                              : const Radius.circular(0)),
                    ),
                    child: Form(
                      key: _formState,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const CustomTextField(
                            icon: Icons.email,
                            label: "email",
                            validator: emailValidator,
                          ),
                          
                          const VSmallSeparator(),
                          const CustomTextField(
                            icon: Icons.lock,
                            label: "senha",
                            isObscureText: true,
                            validator: passwordValidator
                          ),
                          const VSeparator(),
                          SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if(_formState.currentState!.validate()){
                                      
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  child: const Text("ENTRAR",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700)))),
                          const VSeparator(),
                          TextButton(
                              onPressed: () {
                                Get.toNamed(PagesRoutes.signUp);
                              },
                              child: Text(
                                "Cadastrar nova conta",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: CustomColors.red),
                              ))
                        ],
                      ),
                    )),
              ),
              Visibility(
                visible: size.width > 600 ? true : false,
                child:
                    SizedBox(height: 80, child: Expanded(child: Container())),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

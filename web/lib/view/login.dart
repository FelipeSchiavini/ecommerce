import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web/style/palette-colors.dart';

import '../utils/validators.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  
  bool _userRegister = false;

  _validate() async {
    String name = _controllerName.text;
    String email = _controllerEmail.text;
    String password = _controllerPassword.text;

    bool isValidEmail = emailValidator(email);
    bool passwordIsValid = passwordValidator(password);
    bool nameIsValid = nameValidator(name);
  }

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
      width: pageWidth,
      height: pageHeight,
      child: Stack(
        children: [
          SvgPicture.string('''<svg width="$pageWidth" height="$pageHeight" viewBox="0 0 $pageWidth $pageHeight" xmlns="http://www.w3.org/2000/svg"><rect width="$pageWidth" height="$pageHeight" fill="#202024"/><path d="M1535,558.9999999999999C1535.8333333333335,713.0544456622766,1400.3176849594101,966.1961330313263,1277.5,1027.6633369868302C1154.6823150405899,1089.1305409423342,936.6772235768722,1004.0804465641621,798.0938902435388,927.8032237330237C659.5105569102054,851.5260009018854,457.5989817072565,704.5777601199757,446,570C434.4010182927435,435.42223988002434,590.7499999999999,198.11388584430824,728.4999999999998,120.33666301316981C866.2499999999997,42.559440182031395,1138.0833333333328,30.226106848697853,1272.4999999999995,103.33666301316953C1406.9166666666663,176.44721917764122,1534.1666666666665,404.94555433772314,1535,558.9999999999999C1535.8333333333335,713.0544456622766,1400.3176849594101,966.1961330313263,1277.5,1027.6633369868302" fill="#5046CA"/></svg>'''),

          Center(
            child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Card(
                elevation: 6,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Container(
                  width: 500,
                  height: _userRegister ? 450 : 400,
                  color: ThemeColors.gray['700'],
                  padding: const EdgeInsets.all(36),
                  child: Column(children: [
                    Image.asset('assets/images/logo.png', width: 85 ),
                    Visibility(
                      visible: _userRegister,
                      child: TextField(
                        keyboardType: TextInputType.name,
                        controller: _controllerName,
                        decoration: const InputDecoration(
                          hintText: "fulano de tal",
                          labelText: "Nome",
                          suffixIcon: Icon(Icons.person_2_outlined),
                        ),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _controllerEmail,
                      decoration: const InputDecoration(
                        hintText: "felipe@stabel.com.br",
                        labelText: "Email",
                        suffixIcon: Icon(Icons.email_sharp),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller: _controllerPassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "123456",
                          labelText: "Senha",
                          suffixIcon: Icon(Icons.lock_outline)),
                    ),
                    const SizedBox(height: 28),
                    ElevatedButton(
                        onPressed: () {
                          _validate();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: ThemeColors.purple['500']),
                        child: Container(
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(_userRegister ? "CADASTRO" : "LOGAR",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18)),
                            ))),
                    const SizedBox(height: 28),
                    Row(
                      children: [
                        const Text("Logar"),
                        Switch(
                            value: _userRegister,
                            onChanged: (bool value) {
                              setState(() {
                                _userRegister = value;
                              });
                            }),
                        const Text("Cadastrar")
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ))
        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:front/alert_password.dart';
import 'package:front/domain/password_entity.dart';
import 'package:front/service/http_methods.dart';
import 'package:front/service/password_service.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PasswordService service = PasswordService('check', HttpMethods());

  Future<void> validatePassword(BuildContext context) async {
    var passwordClass =
        await service.verifyPassword(PasswordEntity(passwordController.text));

    print(passwordClass.predicao + 5);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertPassword(
          password: passwordController.text,
          nivelSeguranca: chooseSecurityLevel(passwordClass.predicao),
        );
      },
    );
  }

  String chooseSecurityLevel(int pClass) {
    if (pClass == 0) {
      return 'Extremamente fraca';
    }

    if (pClass == 1) {
      return 'Fraca';
    }

    if (pClass == 2) {
      return 'Média';
    }

    if (pClass == 3) {
      return 'Forte';
    }

    if (pClass == 4) {
      return 'Extremamente forte';
    }

    return 'Erro';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('../assets/background.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.4,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Image(
                    image: AssetImage('../assets/logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        inputDecorationTheme: InputDecorationTheme(
                          errorStyle: TextStyle(
                            backgroundColor: Colors.transparent,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira uma senha';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      validatePassword(context);
                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return AlertPassword(
                      //         password: passwordController.text);
                      //   },
                      // );
                    }
                  },
                  child: Text('Testar Senha'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

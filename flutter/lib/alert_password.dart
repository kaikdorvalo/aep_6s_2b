import 'package:flutter/material.dart';

class AlertPassword extends StatelessWidget {
  const AlertPassword(
      {super.key, required this.password, required this.nivelSeguranca});
  final String password;
  final String nivelSeguranca;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.grey, width: 2.0),
        ),
        child: Expanded(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      'Senha: $password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height / 30,
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.grey, thickness: 1.0),
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nível de segurança: ${nivelSeguranca}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Dicas para aumentar a segurança da senha:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('1. Utilize mais de 8 caracteres'),
                        Text('2. Intercale letras maiúsculas e minúsculas'),
                        Text('3. Adicione caracteres especiais como *()*%¨&'),
                        Text('4. Não utilize nomes disponíveis em dicionário'),
                        Text('5. Utilize números de forma não sequencial'),
                        Text('6. Não utilize informações pessoais'),
                        Text(
                            '7. Não utilize datas e nomes de animais de estimação'),
                      ],
                    ),
                  ),
                ),
                Divider(color: Colors.grey, thickness: 1.0),
                Container(
                  height: MediaQuery.of(context).size.height / 20,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Retornar'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 172, 172, 172)),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

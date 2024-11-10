import 'package:flutter/material.dart';

class AlertPassword extends StatelessWidget {
  const AlertPassword({super.key, required this.password});
  final String password;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), 
        side: BorderSide(color: Colors.grey, width: 2.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.height / 2,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 20,
              child: Center(
                child: Text(
                  'Senha: $password',
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height / 30,),
                ),
              ),
            ),
            Divider(color: Colors.grey, thickness: 1.0),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 3.5,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Nível de Segurança: [ADICIONAR O NÍVEL NA INTEGRAÇÃO]',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Dicas para aumentar a segurança da senha:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    //placeholder das sugestões
                    Text(password),
                    Text(password),
                    Text(password),
                    Text(password),
                    Text(password),
                    Text(password),
                    Text(password),
                    Text(password),
                    Text(password),
                    Text(password),
                    Text(password),
                    Text(password),
                    Text(password),
                    Text(password),
                    Text(password),
                    Text(password),
                    Text(password),
                    Text(password),
                    Text(password),
                    Text(password),
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
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

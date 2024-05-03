import 'package:flutter/material.dart';
import 'package:simulatech/login.dart';
import 'package:simulatech/service/autenticacao.dart';

void main() {
  runApp(CadastroPage());
}

class CadastroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro',
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _areaController = TextEditingController();
  String _type = 'Profissional';

  Autenticacao _autenticacao = Autenticacao();

  void _exibirMensagem(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(23, 118, 88, 1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Image.asset(
                    'assets/logo.jpeg',
                    width: 160,
                    height: 150,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'E-mail',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'Digite seu e-mail',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nome',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'Digite seu nome',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sobrenome',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'Digite seu sobrenome',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Senha',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'Digite sua senha',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Confirmar Senha',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextField(
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'Confirme sua senha',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Área de Atuação',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.white),
                      ),
                      child: TextField(
                        controller: _areaController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: 'Digite sua área de atuação',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    SizedBox(width: 10),
                    Radio(
                      value: 'Profissional',
                      groupValue: _type,
                      onChanged: (value) {
                        setState(() {
                          _type = value!;
                        });
                      },
                      activeColor: Colors.white,
                    ),
                    Text(
                      'Profissional',
                      style: TextStyle(color: Colors.white),
                    ),
                    Radio(
                      value: 'Estudante',
                      groupValue: _type,
                      onChanged: (value) {
                        setState(() {
                          _type = value!;
                        });
                      },
                      activeColor: Colors.white,
                    ),
                    Text(
                      'Estudante',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      String email = _emailController.text;
                      String firstName = _firstNameController.text;
                      String lastName = _lastNameController.text;
                      String password = _passwordController.text;
                      String confirmPassword = _confirmPasswordController.text;
                      String area = _areaController.text;

                      // Lógica para realizar o cadastro
                      bool sucesso = await _autenticacao.cadastrarUsuario(
                        email: email,
                        firstName: firstName,
                        lastName: lastName,
                        password: password,
                        confirmPassword: confirmPassword,
                        area: area,
                      );

                      // Exibir mensagem de sucesso apenas se o cadastro for bem-sucedido
                      if (sucesso) {
                        _exibirMensagem('Cadastro realizado com sucesso!');
                      } else {
                        // Caso contrário, exiba uma mensagem de erro
                        _exibirMensagem('Erro ao realizar o cadastro. Por favor, tente novamente.');
                      }

                      // verificando a validade dos campos e inserindo os dados no banco de dados.
                      print('Email: ${_emailController.text}');
                      print('Nome: ${_firstNameController.text}');
                      print('Sobrenome: ${_lastNameController.text}');
                      print('Senha: ${_passwordController.text}');
                      print('Confirmar Senha: ${_confirmPasswordController.text}');
                      print('Área de Atuação: ${_areaController.text}');
                      print('$_type');
                    },
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(32, 101, 79, 1),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push( context,
                        MaterialPageRoute(builder: (context) => LoginApp()),
                         );
                         },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(32, 101, 79, 1),
                    ),
                  ),
                ],
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

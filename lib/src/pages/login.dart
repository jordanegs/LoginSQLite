import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_sqlite/src/model/user.dart';
import 'package:login_sqlite/src/service/auth.dart';
import 'package:edge_alert/edge_alert.dart';

class LoginPage extends StatefulWidget  {
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();

  AuthService authService = new AuthService();

  login(String _username, String _password) async {
    User user = await this.authService.getLogin(_username, _password);
    List<User> users = await this.authService.getUsers();
    users.forEach((user) => print(user.toMap().toString()));

    if(user != null) {
      EdgeAlert.show(context, title: 'Ingreso Correcto', gravity: EdgeAlert.TOP, backgroundColor: Colors.blue);
    } else {
      EdgeAlert.show(context, title: 'Credenciales Incorrectas', gravity: EdgeAlert.TOP, backgroundColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              color: Colors.redAccent,
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50.0,),
                        Image.asset('images/logo.png', scale: 3,),
                        SizedBox(height: 10.0,),
                        Text('Inicio de Sesión', style: TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      margin: EdgeInsets.all(10.0),
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text('Nombre de Usuario'),
                            ),
                            SizedBox(height: 5.0,),
                            TextField(
                              controller: _username,
                            ),
                            SizedBox(height: 30.0,),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text('Contraseña'),
                            ),
                            SizedBox(height: 5.0,),
                            TextField(
                              controller: _password,
                              obscureText: true,
                            ),
                            SizedBox(height: 30.0,),
                            MaterialButton(
                              height: 55.0,
                              minWidth: MediaQuery.of(context).size.width/2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.redAccent,
                              textColor: Colors.white,
                              child: Text("Acceder",),
                              onPressed: () => login(_username.text, _password.text),
                              splashColor: Colors.white,
                            ),
                          ],
                        ),
                      )
                  ),
                  FlatButton(
                    child: Text('Crear una nueva cuenta', style: TextStyle(fontSize: 17, color: Colors.black),),
                    onPressed: ()=> Navigator.pushReplacementNamed(context, 'register'),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

}
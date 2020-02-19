import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_sqlite/src/model/user.dart';
import 'package:login_sqlite/src/service/auth.dart';
import 'package:edge_alert/edge_alert.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterPage();
  }
}

class _RegisterPage extends State<RegisterPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();

  AuthService authService = new AuthService();

  register(BuildContext context, String _username, String _password) async {
    User user = new User(_username, _password);
    int res = await this.authService.getRegister(user);
    if(res > 0) {
      Navigator.pushReplacementNamed(context, 'login');
    } else {
      EdgeAlert.show(context, title: 'Registro Incorrecto', gravity: EdgeAlert.TOP, backgroundColor: Colors.red);
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
                color: Colors.blueAccent,
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
                          Text('Registro', style: TextStyle(fontSize: 20, color: Colors.white)),
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
                                child: Text('Nombre de usuario'),
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
                                color: Colors.blueAccent,
                                textColor: Colors.white,
                                child: Text("Registrar",),
                                onPressed: () => register(context, _username.text, _password.text),
                                splashColor: Colors.white,
                              ),
                            ],
                          ),
                        )
                    ),
                    FlatButton(
                      child: Text('Volver a Inicio de Sesión', style: TextStyle(fontSize: 17, color: Colors.black),),
                      onPressed: ()=> Navigator.pushReplacementNamed(context, 'login'),
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
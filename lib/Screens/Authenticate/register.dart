import 'package:castillo_ranking/Services/auth.dart';
import 'package:castillo_ranking/Shared/constants.dart';
import 'package:castillo_ranking/Shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:castillo_ranking/Services/database.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  // text field state
  String displayName = '';
  String socio = '';
  String email = '';
  String password = '';
  String confPassword = '';

  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Form(
              key: _formKey,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.lightGreen, Colors.green],
                      ),
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 120.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Crear Cuenta',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Nombre Completo',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6.0,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                height: 60.0,
                                child: TextFormField(
                                    validator: (val) => val.isEmpty
                                        ? 'Ingresar Nombre Completo'
                                        : null,
                                    onChanged: (val) {
                                      setState(() {
                                        displayName = val;
                                      });
                                    },
                                    keyboardType: TextInputType.text,
                                    style: TextStyle(color: Colors.white),
                                    decoration: textInputDecoration.copyWith(
                                        hintText: 'Ingresar Nombre Completo')),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Número de Socio',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6.0,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                height: 60.0,
                                child: TextFormField(
                                    validator: (val) => val.isEmpty
                                        ? 'Ingresar Número de Socio'
                                        : null,
                                    onChanged: (val) {
                                      setState(() {
                                        socio = val;
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(color: Colors.white),
                                    decoration: textInputDecoration.copyWith(
                                        hintText: 'Ingresar Número de Socio')),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Correo Electrónico',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6.0,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                height: 60.0,
                                child: TextFormField(
                                  validator: (val) => val.isEmpty
                                      ? 'Ingresar Correo Electronico'
                                      : null,
                                  onChanged: (val) {
                                    setState(() {
                                      email = val;
                                    });
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(color: Colors.white),
                                  decoration: textInputDecoration.copyWith(
                                      hintText: 'Ingresar Correo Electronico'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Contraseña',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6.0,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                height: 60.0,
                                child: TextFormField(
                                  validator: (val) => val.length < 6
                                      ? 'Ingresar mas de 6 caracteres'
                                      : null,
                                  onChanged: (val) {
                                    setState(() {
                                      password = val;
                                    });
                                  },
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.white),
                                  decoration: textInputDecoration.copyWith(
                                      hintText: 'Ingresar Contraseña'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Confirmar Contraseña',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6.0,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                height: 60.0,
                                child: TextFormField(
                                  validator: (val) => val != password
                                      ? 'Contraseñas no coinciden'
                                      : null,
                                  onChanged: (val) {
                                    setState(() {
                                      confPassword = val;
                                    });
                                  },
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  style: TextStyle(color: Colors.white),
                                  decoration: textInputDecoration.copyWith(
                                      hintText: 'Ingresar Contraseña'),
                                ),
                              ),
                              SizedBox(height: 25.0),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 25.0),
                                width: double.infinity,
                                child: RaisedButton(
                                  elevation: 5.0,
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      setState(() => loading = true);
                                      dynamic result = await _auth
                                          .registerWithEmailAndPassword(
                                              email, password);
                                      DatabaseService _players =
                                          DatabaseService(uid: result.uid);
                                      _players.updateUserData(
                                          displayName, socio, 0, false);
                                      if (result == null) {
                                        setState(() {
                                          loading = false;
                                          error = 'Error Registrando Persona';
                                        });
                                      }
                                    } else {}
                                  },
                                  padding: EdgeInsets.all(15.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  color: Colors.white,
                                  child: Text(
                                    'CREAR CUENTA',
                                    style: TextStyle(
                                      color: Colors.green,
                                      letterSpacing: 1.5,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  widget.toggleView();
                                },
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Ya tiene cuenta?  ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Iniciar Sesión',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                error,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 14.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

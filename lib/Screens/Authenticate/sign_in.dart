import 'package:castillo_ranking/Services/auth.dart';
import 'package:castillo_ranking/Shared/constants.dart';
import 'package:castillo_ranking/Shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  String error = '';

  //bool _rememberMe = false;

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
                            'Iniciar Sesión',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 30.0),
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
                                      setState(() => email = val);
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(color: Colors.white),
                                    decoration: textInputDecoration.copyWith(
                                        hintText:
                                            'Ingresar Correo Electronico')),
                              ),
                              SizedBox(height: 30.0),
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
                                      validator: (val) => val.isEmpty
                                          ? 'Ingresar Contraseña'
                                          : null,
                                      obscureText: true,
                                      onChanged: (val) {
                                        setState(() => password = val);
                                      },
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      style: TextStyle(color: Colors.white),
                                      decoration: textInputDecoration.copyWith(
                                          hintText: 'Ingresar Contraseña'),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: FlatButton(
                                      //incluir recuperacion de contraseña
                                      onPressed: () {},
                                      padding: EdgeInsets.only(right: 0.0),
                                      child: Text(
                                        'Olvido la contraseña?',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  /*Container(
                              height: 40.0,
                              child: Row(
                                children: <Widget>[
                                  Theme(
                                    data: ThemeData(
                                        unselectedWidgetColor: Colors.white),
                                    child: Checkbox(
                                      value: _rememberMe,
                                      checkColor: Colors.green,
                                      activeColor: Colors.white,
                                      onChanged: (value) {
                                        setState(() {
                                          _rememberMe = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    'Recordar contraseña',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),*/
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 25.0),
                                    width: double.infinity,
                                    child: RaisedButton(
                                      elevation: 5.0,
                                      //Incluir pagina de Inicio
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          setState(() => loading = true);
                                          dynamic result = await _auth.signIn(
                                              email, password);
                                          if (result == null) {
                                            setState(() {
                                              error =
                                                  'Credenciales no son validas';
                                              loading = false;
                                            });
                                          }
                                        } else {}
                                      },
                                      padding: EdgeInsets.all(15.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      color: Colors.white,
                                      child: Text(
                                        'INICIAR SESIÓN',
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
                                  GestureDetector(
                                    onTap: () {
                                      widget.toggleView();
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'No tiene cuenta? ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Crear Cuenta',
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

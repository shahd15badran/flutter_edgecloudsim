
import 'dart:io'show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/screens/auth_screen.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';

enum authProblems{UserNotFound,PasswordNotValid,NetworkError }

class AuthForm extends StatefulWidget {
  final AuthType authType;

  const AuthForm({Key key, @required this.authType}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '';
  AuthBase authBase = AuthBase();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your email',
                hintText: 'ex: test@gmail.com',
              ),
              onChanged: (value) {
                _email = value;
              },
              validator: (value) =>
              value.isEmpty || !value.contains('@')|| !value.contains('.com') ? 'You must enter a valid email' : null,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your password',
              ),
              obscureText: true,
              onChanged: (value) {
                _password = value;
              },
              validator: (value) => value.length <= 6
                  ? 'Your password must be larger than 6 characters'
                  : null,
            ),
            SizedBox(height: 20),
            OriginalButton(
              text: widget.authType == AuthType.login ? 'Login' : 'Register',
              color: Color(0xFF5896CB),
              textColor: Colors.white,
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  if (widget.authType == AuthType.login) {
                    bool check = false;
                    try {
                      await authBase.loginWithEmailAndPassword(
                          _email, _password);
                      // Navigator.of(context).pushReplacementNamed('startup');
                    }
                    catch (e) {
                      authProblems errorType;
                      if (Platform.isAndroid) {
                        switch (e.message) {
                          case 'There is no user record corresponding to this identifier. The user may have been deleted.':
                            errorType = authProblems.UserNotFound;
                            check=true;
                            break;
                          case 'The password is invalid or the user does not have a password.':
                            errorType = authProblems.PasswordNotValid;
                            check=true;
                            break;
                          case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
                            errorType = authProblems.NetworkError;
                            check=true;
                            break;
                        // ...
                          default:
                            print('Case ${e.message} is not yet implemented');
                            check=true;
                        }
                      } else if (Platform.isIOS) {
                        switch (e.code) {
                          case 'Error 17011':
                            errorType = authProblems.UserNotFound;
                            check=true;
                            break;
                          case 'Error 17009':
                            errorType = authProblems.PasswordNotValid;
                            check=true;
                            break;
                          case 'Error 17020':
                            errorType = authProblems.NetworkError;
                            check=true;
                            break;
                        // ...
                          default:
                            print('Case ${e.message} is not yet implemented');
                            check=true;
                        }
                      }
                      print('The error is $errorType');
                    }
                    if (check==false){Navigator.of(context).pushReplacementNamed('startup');}

                  }
                  else {
                    await authBase.registerWithEmailAndPassword(_email, _password);
                    Navigator.of(context).pushReplacementNamed('startup');
                  }
//                  print(_email);
//                  print(_password);
                }
              },
            ),
            SizedBox(height: 6),
            TextButton(
              onPressed: () {
                if (widget.authType == AuthType.login) {
                  Navigator.of(context).pushReplacementNamed('register');
                  print(widget.authType);
                } else {
                  Navigator.of(context).pushReplacementNamed('login');
                }
              },
              child: Text(
                widget.authType == AuthType.login
                    ? 'Don\'t have an account?'
                    : 'Already have an account?',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
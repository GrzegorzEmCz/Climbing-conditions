//zwracamy usera jako != null


import 'package:login/services/auth.dart';
import 'package:login/shared/constants.dart';
import 'package:login/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({
    this.toggleView
  });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State < Register > {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey < FormState > ();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  String dropdownValue = 'English';

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  int buttonColor = 0xff26A9FF;

  bool inputTextNotNull = false;

  @override
  Widget build(BuildContext context) {

    double deviseWidth = MediaQuery.of(context).size.width;

    return loading ? Loading() : Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 50,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
//start górne pole ----------------------------------------------
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topCenter,
                  child: DropdownButton < String > (
                    dropdownColor: Colors.white,
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 10,
                    style: TextStyle(color: Colors.black54),
                    underline: Container(),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: < String > ['English', 'Polski']
                    .map < DropdownMenuItem < String >> ((String value) {
                      return DropdownMenuItem < String > (
                        value: value,
                        child: Text(value, style: TextStyle(fontSize: 16), ),
                      );
                    }).toList(),
                  )
                ),
//end górne pole ------------------------------------------------
//start srodowe pole --------------------------------------------
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: deviseWidth * .10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: < Widget > [

                        SizedBox(height: deviseWidth * .1),
                        Image.asset('assets/logo3.png',
                          height: deviseWidth * .15,
                        ),
                        SizedBox(height: deviseWidth * .1),

                        TextFormField(
                          decoration: textInputDecoration.copyWith(hintText: 'email'),
                          validator: (val) => val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(height: 15.0),

                        TextFormField(
                          obscureText: true,
                          decoration: textInputDecoration.copyWith(hintText: 'password'),
                          validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(height: 15.0),

                        RaisedButton(
                          padding: const EdgeInsets.all(0.0),
                            color: Color(0xff2c3d63),
                            splashColor: Color(0xFF212E49),
                            child: Container(
                              width: deviseWidth * .90,
                              height: deviseWidth * .14,
                              decoration: BoxDecoration(
                                //color: Color(buttonColor),
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Center(
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: deviseWidth * .040,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() => loading = true);
                                dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                    error = 'Please supply a valid email';
                                  });
                                }
                              }
                            },
                        ),
                        SizedBox(height: 4.0),

                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),

                        ),
                        SizedBox(height: deviseWidth * .030, ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Forgot your login details? ',
                              style: TextStyle(
                                fontSize: deviseWidth * .035,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('Get help');
                              },
                              child: Text('Get help',
                                style: TextStyle(
                                  fontSize: deviseWidth * .035,
                                  color: Color(0xff2c3d63),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: deviseWidth * .040, ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 1,
                              width: deviseWidth * .32,
                              color: Color(0xffA2A2A2),
                            ),
                            SizedBox(width: 10, ),
                            Text('OR',
                              style: TextStyle(
                                fontSize: deviseWidth * .040,
                                color: Color(0xffA2A2A2),
                              ),
                            ),
                            SizedBox(width: 10, ),
                            Container(
                              height: 1,
                              width: deviseWidth * .32,
                              color: Color(0xffA2A2A2),
                            ),
                          ],
                        ),
                        SizedBox(height: deviseWidth * .06, ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/facebook.png',
                              height: deviseWidth * .060,
                            ),
                            SizedBox(width: 5, ),
                            Text('Login with facebook',
                              style: TextStyle(
                                color: Color(0xff1877f2),
                                fontSize: deviseWidth * .040,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
//end srodkowe pole----------------------------------------------
//start dolne pole ----------------------------------------------
                Container(
                  width: deviseWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: deviseWidth,
                        height: 1,
                        color: Color(0xff2c3d63),
                      ),
                      SizedBox(height: 5, ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("I have an account. ",
                            style: TextStyle(
                              fontSize: deviseWidth * .040,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => widget.toggleView(),
                            child: Text('Login',
                              style: TextStyle(
                                color: Color(0xffff6f5e),
                                fontSize: deviseWidth * .040,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
//end dolne pole ------------------------------------------------
              ],
            ),
          ),
        ),
      ),
    );
  }
}
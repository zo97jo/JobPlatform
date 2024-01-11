import 'package:flutter/material.dart';
import 'package:jobby/components/google_login.dart';
import 'package:jobby/home.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'register.dart';
import 'package:google_sign_in/google_sign_in.dart';


class EmailController {
  final TextEditingController controller = TextEditingController();
  bool isValid = false;

  EmailController() {
    controller.addListener(_validateEmail);
  }

  void dispose() {
    controller.dispose();
  }

  void _validateEmail() {
    isValid = false;
    String email = controller.text.trim();
    if(email.isNotEmpty){
      isValid = RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$')
          .hasMatch(email);
    }

  }
}



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  EmailController _emailController = EmailController();
  TextEditingController _passwordController = TextEditingController();
  bool isEmailValidFormat = true;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/login.png', // Replace with your image asset path
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController.controller,
                  onChanged: (value) {setState(() {
                    isEmailValidFormat = _emailController.isValid;
                  });},
                  decoration: InputDecoration(
                    labelText: 'Email',
                    errorText: isEmailValidFormat ? null: 'Invalid email format'
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
              ],
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Implement your login logic here
                _emailController._validateEmail();
                if (!_emailController.isValid) {
                  return;
                }
                String email = _emailController.controller.text;
                String password = _passwordController.text;
                // Perform validation or send login request to backend
                Navigator.pushNamed(context, '/home');
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
              },
              child: Text('Login'),
            ),
            SizedBox(height: 24.0),
            GestureDetector(
              onTap: () {
                // Navigate to the register page
                Navigator.pushNamed(context, '/register');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                'Don\'t have an account? ',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                'Register here',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              ],)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignInButton(
                  Buttons.google, 
                  onPressed: (){ } ,
                  elevation: 0.0,
                  
                ),
                SizedBox(height:12.0),
                SignInButton(
                  Buttons.apple,
                  onPressed: (){},
                  padding: EdgeInsets.all(10),
                  elevation: 0.0,
                ),
                SizedBox(height:12.0),
                 SignInButton(
                  Buttons.facebookNew,
                  onPressed: (){},
                  padding: EdgeInsets.all(10),
                  elevation: 0.0,
                ),
              ],
            ),
          ],

        ),
      ),
    );
  }
}

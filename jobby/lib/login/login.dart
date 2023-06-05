import 'package:flutter/material.dart';
import 'register.dart';



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
    String email = controller.text.trim();
    isValid = RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$')
        .hasMatch(email);
  }
}


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  EmailController _emailController = EmailController();
  TextEditingController _passwordController = TextEditingController();
  
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
            TextField(
              controller: _emailController.controller,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: _emailController.isValid ? null: 'Invalid email'
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Implement your login logic here
                if (!_emailController.isValid) {
                  return;
                }
                String email = _emailController.controller.text;
                String password = _passwordController.text;
                // Perform validation or send login request to backend
              },
              child: Text('Login'),
            ),
            SizedBox(height: 24.0),
            GestureDetector(
              onTap: () {
                // Navigate to the register page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text(
                'Don\'t have an account? Register here',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

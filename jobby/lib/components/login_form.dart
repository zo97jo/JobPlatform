import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
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
          ],
        ),;
  }
}
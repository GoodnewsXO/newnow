import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newnow/controllers/auth_controller.dart';
import 'package:newnow/utils/constants.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final AuthController _authController = AuthController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    try {
      await _authController.login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login successful'),
          backgroundColor: kPrimaryColor,
        ),
      );

      Navigator.pushNamedAndRemoveUntil(context, '/MainPage', (route) => false);
    } catch (e) {
      print("Login Error: $e"); // Debugging: Print the error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Unable to login: $e'), // Show error message in Snackbar
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100.0),
                Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6.0),
                Text(
                  'Stay informed effortlessly. Sign in and explore a world of news',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro', color: Colors.grey),
                ),
                SizedBox(height: 32),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0XFFF9FCFE),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: kTextColor,
                            fontSize: 18,
                            fontFamily: 'SourceSansPro',
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/icons/sms.svg',
                              height: 9,
                            ),
                          ),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 22),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0XFFF9FCFE),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: kTextColor,
                            fontSize: 18,
                            fontFamily: 'SourceSansPro',
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/icons/lock.svg',
                              height: 9,
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.visibility,
                            color: Color(0XFF999999),
                          ),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Spacer(),
                    Text('Forgot Password?',
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 16,
                          fontFamily: 'SourceSansPro',
                          letterSpacing: -0.2,
                        )),
                  ],
                ),
                SizedBox(height: 12),
                InkWell(
                  onTap: () {
                    _login();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: kHeadingColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Center(
                          child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                        ),
                      )),
                    ),
                  ),
                ),
                SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 1,
                      color: kStrokeColor,
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 16,
                          fontFamily: 'SourceSansPro',
                          letterSpacing: -0.2,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      width: 150,
                      height: 1,
                      color: kStrokeColor,
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: kStrokeColor)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 18),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/google.svg'),
                        SizedBox(width: 83),
                        Text(
                          'Sign in with Google',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kHeadingColor,
                              fontFamily: 'Roboto',
                              letterSpacing: -0.3),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: kStrokeColor)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 18),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/facebook.svg'),
                        SizedBox(width: 83),
                        Text(
                          'Sign in with Facebook',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kHeadingColor,
                              fontFamily: 'Roboto',
                              letterSpacing: -0.3),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 82,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?',
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 16,
                          fontFamily: 'SourceSansPro',
                          letterSpacing: -0.2,
                        )),
                    SizedBox(width: 3),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/SignUp');
                      },
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                            color: kHeadingColor,
                            fontSize: 16,
                            fontFamily: 'SourceSansPro',
                            letterSpacing: -0.2,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

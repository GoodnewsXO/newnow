import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newnow/components/button.dart';
import 'package:newnow/utils/constants.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100.0),
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                'Stay informed effortlessly. Sign in and explore a world of news',
                style:
                    TextStyle(fontFamily: 'SourceSansPro', color: Colors.grey),
              ),
              SizedBox(height: 32),
              // Form Field 1
              Container(
                decoration: BoxDecoration(
                  color: Color(0XFFF9FCFE),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Full Name',
                        hintStyle: TextStyle(
                          color: kTextColor,
                          fontSize: 18,
                          fontFamily: 'SourceSansPro',
                        ),
                        prefixIcon: Icon(
                          Icons.person_4_outlined,
                          color: kTextColor,
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
              // Form Field 2
              Container(
                decoration: BoxDecoration(
                  color: Color(0XFFF9FCFE),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextField(
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
                  Navigator.pushNamed(context, '/HomePage');
                },
                child: Button(
                  text: 'Sign Up',
                  textColor: Colors.white,
                  width: double.infinity,
                  buttonColor: kHeadingColor,
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
                height: 42,
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
                      Navigator.pushNamed(context, '/MainPage');
                    },
                    child: Text(
                      'LogIn',
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
    );
  }
}

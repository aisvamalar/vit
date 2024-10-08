import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speaksi/screens/signup_screen.dart';
import 'package:speaksi/screens/toast.dart';


import 'home_screen.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  bool _isSigning = false;
  SharedPreferences? sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkAuthenticationStatus();
  }

  void checkAuthenticationStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    bool isLoggedIn = sharedPreferences!.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (ctx) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 150), // Increased height for spacing
                // Animated "Welcome Back" text
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
                    .animate() // Start animation here
                    .fadeIn(duration: 1000.ms) // Fade-in effect
                    .slideY(begin: 1.0, end: 0.0, curve: Curves.easeInOut) // Slide-in effect from bottom
                    .then(delay: 500.ms) // Delay between animations
                ,

                SizedBox(height: 12), // Adjusted spacing
                Text(
                  'welcome back we missed you',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 60), // More spacing before form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email Input
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.email, color: Colors.grey),
                          fillColor: Colors.grey[800],
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30), // Added spacing between input fields
                      // Password Input
                      TextFormField(
                        controller: _passwordController,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.lock, color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureText ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                          fillColor: Colors.grey[800],
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 40), // More spacing before button
                      // Login Button
                      SizedBox(
                        width: 200,
                        height:50,// Add your custom width here
                        child: ElevatedButton(
                          onPressed: _isSigning ? null : _signIn,
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50), // This will now be adjusted by the SizedBox width
                            backgroundColor: Color(0xFF7B3DFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          child: _isSigning
                              ? CircularProgressIndicator(color: Colors.white,)
                              : Text('Log in',style: TextStyle(color: Colors.white,),),
                        ),
                      ),
                      SizedBox(height: 30), // Added spacing after the login button
                      // Social Media Login
                      Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 30), // More spacing before icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialLoginButton('images/img_1.png',),
                          SizedBox(width: 16),
                          _buildSocialLoginButton('images/img_3.png'),
                          SizedBox(width: 16),
                          _buildSocialLoginButton('images/img.png'),
                        ],
                      ),
                      SizedBox(height: 40), // Added more spacing before the Sign-up option
                      // Signup Option
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => SignupScreen()),
                              );
                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(color: Color(0xFF7B3DFF)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Social Media Login Button
  Widget _buildSocialLoginButton(String imagePath) {
    return InkWell(
      onTap: _signInWithGoogle, // You can assign specific handlers for each
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[800],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(imagePath),
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSigning = true;
      });

      try {
        UserCredential userCredential = await _firebaseAuth
            .signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        setState(() {
          _isSigning = false;
        });

        if (userCredential.user != null) {
          sharedPreferences!.setBool('isLoggedIn', true);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => HomeScreen(),
            ),
          );
        }
      } catch (e) {
        setState(() {
          _isSigning = false;
        });
        showToast(message: 'Sign in failed: $e');
      }
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
      await _firebaseAuth.signInWithCredential(credential);
      if (userCredential.user != null) {
        sharedPreferences!.setBool('isLoggedIn', true);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (ctx) => HomeScreen()),
        );
      }
    } catch (e) {
      showToast(message: 'Google sign in failed: $e');
    }
  }
}
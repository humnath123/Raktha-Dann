import 'dart:async';

import 'package:flutter/material.dart';

import 'register_page.dart';

void main() {
  runApp(RaktaDaanApp());
}

class RaktaDaanApp extends StatelessWidget {
  const RaktaDaanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rakta Daan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

// ===============================
// LOGIN PAGE
// ===============================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;
  bool _isNepali = false;

  // ===============================
  // TEXT
  // ===============================

  String get welcomeText => _isNepali ? 'फेरि स्वागत छ!' : 'Welcome Back!';

  String get emailLabel => _isNepali ? 'इमेल' : 'Email';

  String get passwordLabel => _isNepali ? 'पासवर्ड' : 'Password';

  String get emailHint =>
      _isNepali ? 'आफ्नो इमेल लेख्नुहोस्' : 'Enter your email';

  String get passwordHint =>
      _isNepali ? 'आफ्नो पासवर्ड लेख्नुहोस्' : 'Enter your password';

  String get forgotPassword =>
      _isNepali ? 'पासवर्ड बिर्सनुभयो?' : 'Forgot Password?';

  String get loginText => _isNepali ? 'लगइन' : 'Login';

  String get orContinue =>
      _isNepali ? 'वा यसबाट जारी राख्नुहोस्' : 'Or continue with';

  String get googleText =>
      _isNepali ? 'Google बाट जारी राख्नुहोस्' : 'Continue with Google';

  String get dontHaveAccount =>
      _isNepali ? 'खाता छैन?' : "Don't have an account?";

  String get registerText => _isNepali ? 'Register' : 'Register';

  // ===============================
  // DISPOSE
  // ===============================

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // ===============================
  // LOGIN FUNCTION
  // ===============================

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulating API request
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Login successful!')));
  }

  // ===============================
  // BUILD
  // ===============================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ===============================
      // APP BAR
      // ===============================
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: const Text(
          'Rakta Daan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,

        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isNepali = !_isNepali;
              });
            },
            icon: const Icon(Icons.language),
          ),
        ],
      ),

      // ===============================
      // BODY
      // ===============================
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                // ===============================
                // LOGO
                // ===============================

                const SizedBox(height: 20),

                Container(
                  width: 90,
                  height: 90,

                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    shape: BoxShape.circle,
                  ),

                  child: const Icon(
                    Icons.bloodtype,
                    color: Colors.red,
                    size: 55,
                  ),
                ),

                const SizedBox(height: 20),

                // ===============================
                // APP NAME
                // ===============================
                const Text(
                  'Rakta Daan',
                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  welcomeText,
                  textAlign: TextAlign.center,

                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 35),

                // ===============================
                // EMAIL LABEL
                // ===============================
                Text(
                  emailLabel,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 8),

                // ===============================
                // EMAIL FIELD
                // ===============================
                TextFormField(
                  controller: _emailController,

                  keyboardType: TextInputType.emailAddress,

                  decoration: InputDecoration(
                    hintText: emailHint,

                    prefixIcon: const Icon(Icons.email_outlined),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }

                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // ===============================
                // PASSWORD LABEL
                // ===============================
                Text(
                  passwordLabel,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 8),

                // ===============================
                // PASSWORD FIELD
                // ===============================
                TextFormField(
                  controller: _passwordController,

                  obscureText: _obscurePassword,

                  decoration: InputDecoration(
                    hintText: passwordHint,

                    prefixIcon: const Icon(Icons.lock_outline),

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },

                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                    ),
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }

                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }

                    return null;
                  },
                ),

                // ===============================
                // FORGOT PASSWORD
                // ===============================
                Align(
                  alignment: Alignment.centerRight,

                  child: TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Forgot password feature coming soon'),
                        ),
                      );
                    },

                    child: Text(
                      forgotPassword,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // ===============================
                // LOGIN BUTTON
                // ===============================
                SizedBox(
                  height: 55,

                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    child: _isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,

                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            loginText,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 25),

                // ===============================
                // OR
                // ===============================
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade300)),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),

                      child: Text(
                        orContinue,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),

                    Expanded(child: Divider(color: Colors.grey.shade300)),
                  ],
                ),

                const SizedBox(height: 20),

                // ===============================
                // GOOGLE BUTTON
                // ===============================
                OutlinedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Google login coming soon')),
                    );
                  },

                  icon: const Icon(Icons.login),

                  label: Text(googleText),

                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(52),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // ===============================
                // REGISTER
                // ===============================
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(dontHaveAccount),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },

                      child: Text(
                        registerText,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account created successfully!'),
          backgroundColor: Color(0xFFD32F2F),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // =========================
              // TOP RED HEADER
              // =========================

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 30,
                ),

                decoration: const BoxDecoration(
                  color: Color(0xFFD32F2F),

                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                ),

                child: Column(
                  children: [
                    // Back button
                    Align(
                      alignment: Alignment.topLeft,

                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),

                    const SizedBox(height: 5),

                    // Blood icon
                    Container(
                      width: 70,
                      height: 70,

                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.bloodtype,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Rakta Daan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      'Create your account',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),

              // =========================
              // REGISTRATION FORM
              // =========================
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 28,
                ),

                child: Form(
                  key: _formKey,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0D1B2A),
                        ),
                      ),

                      const SizedBox(height: 4),

                      const Text(
                        'Register to get started',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF607080),
                        ),
                      ),

                      const SizedBox(height: 28),

                      // =========================
                      // FULL NAME
                      // =========================
                      const Text(
                        'Full Name',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0D1B2A),
                        ),
                      ),

                      const SizedBox(height: 8),

                      TextFormField(
                        controller: _nameController,

                        decoration: _inputDecoration(
                          hint: 'Enter your full name',
                          icon: Icons.person_outline,
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Full name is required';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      // =========================
                      // EMAIL
                      // =========================
                      const Text(
                        'Email Address',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0D1B2A),
                        ),
                      ),

                      const SizedBox(height: 8),

                      TextFormField(
                        controller: _emailController,

                        keyboardType: TextInputType.emailAddress,

                        decoration: _inputDecoration(
                          hint: 'Enter your email',
                          icon: Icons.email_outlined,
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }

                          if (!value.contains('@')) {
                            return 'Enter a valid email';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      // =========================
                      // PASSWORD
                      // =========================
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0D1B2A),
                        ),
                      ),

                      const SizedBox(height: 8),

                      TextFormField(
                        controller: _passwordController,

                        obscureText: _obscurePassword,

                        decoration: _inputDecoration(
                          hint: 'Enter your password',
                          icon: Icons.lock_outline,

                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,

                              color: const Color(0xFF607080),
                            ),

                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }

                          if (value.length < 6) {
                            return 'Minimum 6 characters required';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      // =========================
                      // CONFIRM PASSWORD
                      // =========================
                      const Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0D1B2A),
                        ),
                      ),

                      const SizedBox(height: 8),

                      TextFormField(
                        controller: _confirmPasswordController,

                        obscureText: _obscureConfirmPassword,

                        decoration: _inputDecoration(
                          hint: 'Confirm your password',
                          icon: Icons.lock_outline,

                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,

                              color: const Color(0xFF607080),
                            ),

                            onPressed: () {
                              setState(() {
                                _obscureConfirmPassword =
                                    !_obscureConfirmPassword;
                              });
                            },
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }

                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 28),

                      // =========================
                      // REGISTER BUTTON
                      // =========================
                      SizedBox(
                        width: double.infinity,
                        height: 52,

                        child: ElevatedButton(
                          onPressed: _register,

                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD32F2F),

                            foregroundColor: Colors.white,

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),

                            elevation: 2,
                          ),

                          child: const Text(
                            'Create Account',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // =========================
                      // LOGIN LINK
                      // =========================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Color(0xFF607080),
                              fontSize: 14,
                            ),
                          ),

                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },

                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Color(0xFFD32F2F),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
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
      ),
    );
  }

  // =========================
  // INPUT DECORATION
  // =========================

  InputDecoration _inputDecoration({
    required String hint,
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,

      hintStyle: const TextStyle(color: Color(0xFFB0BEC5), fontSize: 14),

      prefixIcon: Icon(icon, color: const Color(0xFFD32F2F), size: 22),

      suffixIcon: suffixIcon,

      filled: true,

      fillColor: Colors.white,

      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),

        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),

        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),

        borderSide: const BorderSide(color: Color(0xFFD32F2F), width: 2),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),

        borderSide: const BorderSide(color: Colors.red),
      ),
    );
  }
}

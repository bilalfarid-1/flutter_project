import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swift_trip/screen/login_screen.dart';
import 'package:swift_trip/screen/destination.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _isFormValid = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameCtrl.addListener(_updateFormValid);
    _emailCtrl.addListener(_updateFormValid);
    _passwordCtrl.addListener(_updateFormValid);
    _confirmCtrl.addListener(_updateFormValid);
    _updateFormValid();
  }

  @override
  void dispose() {
    _nameCtrl.removeListener(_updateFormValid);
    _emailCtrl.removeListener(_updateFormValid);
    _passwordCtrl.removeListener(_updateFormValid);
    _confirmCtrl.removeListener(_updateFormValid);
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _isLoading = true);
    final name = _nameCtrl.text.trim();
    final email = _emailCtrl.text.trim();
    final phone = _phoneCtrl.text.trim();
    final password = _passwordCtrl.text;

    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final uid = userCredential.user?.uid;
      if (uid != null) {
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'name': name,
          'email': email,
          'phone': phone,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => destination()),
      );
    } on FirebaseAuthException catch (e) {
      final message = e.message ?? 'Authentication error';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Failed to create account')));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _updateFormValid() {
    final name = _nameCtrl.text;
    final email = _emailCtrl.text;
    final pass = _passwordCtrl.text;
    final confirm = _confirmCtrl.text;
    final valid =
        name.trim().isNotEmpty &&
        email.trim().isNotEmpty &&
        email.contains('@') &&
        pass.length >= 6 &&
        confirm == pass;
    if (valid != _isFormValid) setState(() => _isFormValid = valid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                Image.asset(
                  'assets/images/logo1.png',
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 12),
                Text(
                  'Plan Smarter. Travel Better',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameCtrl,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Full name',
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (v) => (v == null || v.trim().isEmpty)
                            ? 'Please enter your name'
                            : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _emailCtrl,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (v) {
                          if (v == null || v.trim().isEmpty)
                            return 'Please enter your email';
                          if (!v.contains('@')) return 'Enter a valid email';
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _phoneCtrl,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone',
                          prefixIcon: Icon(Icons.phone),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _passwordCtrl,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () => setState(
                              () => _obscurePassword = !_obscurePassword,
                            ),
                          ),
                        ),
                        obscureText: _obscurePassword,
                        validator: (v) => (v == null || v.length < 6)
                            ? 'Password must be at least 6 characters'
                            : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _confirmCtrl,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Confirm password',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirm
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () => setState(
                              () => _obscureConfirm = !_obscureConfirm,
                            ),
                          ),
                        ),
                        obscureText: _obscureConfirm,
                        validator: (v) {
                          if (v == null || v.isEmpty)
                            return 'Please confirm your password';
                          if (v != _passwordCtrl.text)
                            return 'Passwords do not match';
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _isFormValid ? _submit : null,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            disabledForegroundColor: Colors.white.withOpacity(
                              0.9,
                            ),
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            disabledBackgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary.withOpacity(0.9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Create Account',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),
                Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Text('Login'),
                        ),
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
}

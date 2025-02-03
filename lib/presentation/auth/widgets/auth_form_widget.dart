import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptask/core/core.dart';
import 'package:uptask/presentation/presentation.dart';

class AuthFormWidget extends StatefulWidget {
  const AuthFormWidget({super.key});

  @override
  State<AuthFormWidget> createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
  final _usernameController = TextEditingController(); // Username controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLogin = true;

  void _toggleAuthMode() => setState(() => _isLogin = !_isLogin);

  String? _validateUsername(String username) {
    return username.isNotEmpty && username.length >= 4
        ? null
        : 'Username must be at least 4 characters';
  }

  String? _validateEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
            .hasMatch(email)
        ? null
        : 'Invalid email format';
  }

  String? _validatePassword(String password) {
    return password.length >= 8
        ? null
        : 'Password must be at least 8 characters';
  }

  void _submitAuth(BuildContext context) {
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final authBloc = context.read<AuthBloc>();

    final usernameError = _isLogin ? null : _validateUsername(username);
    final emailError = _validateEmail(email);
    final passwordError = _validatePassword(password);

    setState(() {});

    if (usernameError == null && emailError == null && passwordError == null) {
      authBloc.add(_isLogin
          ? AuthLoginEvent(
              username: username,
              email: email,
              password: password,
            )
          : AuthRegisterEvent(
              username: username,
              email: email,
              password: password,
            ));
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required bool obscureText,
    String? Function(String)? validator,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Theme.of(context).shadowColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.red)),
        errorText: validator?.call(controller.text),
        errorStyle: const TextStyle(color: Colors.red),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ToggleButtons(
            isSelected: [_isLogin, !_isLogin],
            onPressed: (index) {
              if (index != (_isLogin ? 0 : 1)) _toggleAuthMode();
            },
            borderRadius: BorderRadius.circular(8),
            constraints: const BoxConstraints(minWidth: 80, minHeight: 40),
            textStyle: AppTypography.bodyText1.copyWith(
              color: AppColor.darkModePrimaryColor,
              fontWeight: FontWeight.bold,
            ),
            children: const [Text('Login'), Text('Register')],
          ),
          _buildTextField(
              controller: _usernameController,
              label: 'Username',
              obscureText: false,
              validator: _validateUsername),
          _buildTextField(
              controller: _emailController,
              label: 'Email',
              obscureText: false,
              validator: _validateEmail),
          _buildTextField(
              controller: _passwordController,
              label: 'Password',
              obscureText: true,
              validator: _validatePassword),
          ElevatedButton(
            onPressed: () => _submitAuth(context),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              minimumSize: const Size(double.infinity, 48),
            ),
            child: Text(
              _isLogin ? 'Login' : 'Register',
              style: AppTypography.headline6.copyWith(
                color: AppColor.darkModePrimaryColor,
              ),
            ),
          ),
        ],
      ).withSpacing(16),
    );
  }
}

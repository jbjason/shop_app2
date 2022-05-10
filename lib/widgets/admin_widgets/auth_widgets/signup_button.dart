import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton(
      {Key? key,
      required this.trySubmit,
      required this.isLoading,
      required this.changeStatus,
      required this.isLogin})
      : super(key: key);
  final bool isLoading, isLogin;
  final Function(BuildContext context) trySubmit;
  final void Function() changeStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        isLoading
            ? const CircularProgressIndicator()
            : Container(
                width: double.infinity,
                height: 70,
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white70,
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () => trySubmit(context),
                  child: Text(
                    isLogin ? 'Login' : 'Signup',
                    style: const TextStyle(
                        color: Color(0xFF1F787A),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                ),
              ),
        if (!isLoading)
          TextButton(
            onPressed: () => changeStatus,
            child: Text(
              isLogin ? 'Create new account' : 'I already have an account',
              style: const TextStyle(color: Colors.black),
            ),
          )
      ],
    );
  }
}

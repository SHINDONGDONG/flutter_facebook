import 'package:flutter/material.dart';
import 'package:flutter_facebook/core/constants/constants.dart';
import 'package:flutter_facebook/core/widgets/round_button.dart';
import 'package:flutter_facebook/core/widgets/round_text_field.dart';
import 'package:flutter_facebook/features/auth/presentation/screens/create_account_screen.dart';
import 'package:flutter_facebook/features/auth/utils/utils.dart';

final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: Constants.defaultPadding,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/icons/analysis_options.png',
              width: 60,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  RoundTextField(
                    controller: _emailController,
                    hintText: 'Email',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    validator: validatePassword,
                    isPassword: true,
                  ),
                  const SizedBox(height: 20),
                  RoundButton(
                    onPressed: () {},
                    label: 'Login',
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Forget Password',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),
            Column(
              children: [
                RoundButton(
                  label: 'Create new account',
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(CreateAccountScreen.routeName);
                  },
                  color: Colors.transparent,
                ),
                Image.asset(
                  'assets/icons/meta.png',
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

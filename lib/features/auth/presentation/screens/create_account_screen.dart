import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_facebook/core/constants/app_colors.dart';
import 'package:flutter_facebook/core/constants/constants.dart';
import 'package:flutter_facebook/core/utils/utils.dart';
import 'package:flutter_facebook/core/widgets/pick_image_widget.dart';
import 'package:flutter_facebook/core/widgets/round_text_field.dart';
import 'package:flutter_facebook/features/auth/utils/utils.dart';

final _formKey = GlobalKey<FormState>();

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  File? image;

  // controllers
  late final TextEditingController _fNameController;
  late final TextEditingController _lNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _fNameController = TextEditingController();
    _lNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fNameController.dispose();
    _lNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.realWhiteColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: Constants.defaultPadding,
          child: Form(
            key: _formKey,
            child: GestureDetector(
              onTap: () async {
                image = await pickImage();
                setState(() {});
              },
              child: Column(
                children: [
                  PickImageWidget(image: image),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RoundTextField(
                          controller: _fNameController, //_fNameController,
                          hintText: "First name",
                          textInputAction: TextInputAction.next,
                          validator: validateName,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RoundTextField(
                          controller: _fNameController, //_fNameController,
                          hintText: "Last name",
                          textInputAction: TextInputAction.next,
                          validator: validateName,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

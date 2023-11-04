import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_facebook/core/constants/app_colors.dart';
import 'package:flutter_facebook/core/constants/constants.dart';
import 'package:flutter_facebook/core/utils/utils.dart';
import 'package:flutter_facebook/core/widgets/pick_image_widget.dart';

final _formKey = GlobalKey<FormState>();

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  File? image;
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
              },
              child: Column(
                children: [PickImageWidget(image: image)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

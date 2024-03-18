import 'package:flutter/material.dart';
import 'package:hypermarket_user/app_config/app_config.dart';

import 'package:hypermarket_user/core/constants/color.dart';
import 'package:hypermarket_user/presentation/login_screen/view/login_screen.dart';
import 'package:hypermarket_user/presentation/registration__screen/controller/register_screen_controller.dart';
import 'package:provider/provider.dart';

class PersonalDetails extends StatefulWidget {
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String _gender = 'Male';

  @override
  Widget build(BuildContext context) {
    print(AppConfig.LOGIN_DATA);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Register yourself'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Image.asset(
                        "assets/123.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: _nameController,
                      hintText: 'Enter your name',
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      controller: _numberController,
                      hintText: 'Enter your number',
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      controller: _emailController,
                      hintText: 'Enter your email',
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      controller: _dobController,
                      hintText: 'DOB',
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                      ),
                      value: _gender,
                      items: ['Male', 'Female', 'Other']
                          .map((String value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Select your gender',
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      controller: _passwordController,
                      hintText: 'Create password',
                      isPassword: true,
                    ),
                    SizedBox(height: 10),
                    _buildTextField(
                      controller: _confirmPasswordController,
                      hintText: 'Confirm password',
                      isPassword: true,
                    ),
                    SizedBox(height: 30),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
        border: OutlineInputBorder(),
        hintText: hintText,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter $hintText';
        }
        return null;
      },
    );
  }
}

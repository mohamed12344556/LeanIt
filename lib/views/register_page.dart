// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task/widgets/custom_check_list_tile.dart';
import 'package:task/widgets/custom_drop_down.dart';
import 'package:task/widgets/custom_text_field_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool inputValid = false;
  bool isObscure1 = true;
  bool isObscure2 = true;

  File? image;
  final picker = ImagePicker();
  String? gender;
  String? country;
  String? region;
  bool? isMale = false;
  bool? isFemale = false;

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });
  }

  void inputValidation() {
    if (formKey.currentState!.validate()) {
      setState(() {
        inputValid = true;
      });
    } else {
      setState(() {
        inputValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 207, 192, 192),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: GestureDetector(
                    onTap: getImage,
                    child: image == null
                        ? Icon(Icons.add_a_photo, size: 100)
                        : Image.file(
                            image!,
                            height: 100,
                            width: 100,
                          ),
                  ),
                ),
                SizedBox(height: 20),
                CustomDropDown(
                  itemsList: const ["Male", "Female"],
                  onChanged: (val) {
                    setState(() {
                      gender = val;
                    });
                  },
                  hintText: 'Choose Gender',
                  hintStyle: TextStyle(color: Colors.black),
                  value: gender,
                ),
                SizedBox(height: 20),
                CustomDropDown(
                  itemsList: const ["Egypt", "USA", "UK", "Japan"],
                  onChanged: (value) {
                    setState(() {
                      country = value!;
                    });
                  },
                  hintText: 'Choose Country',
                  hintStyle: TextStyle(color: Colors.black),
                  value: country,
                ),
                SizedBox(height: 20),
                CustomDropDown(
                  itemsList: ["Cairo", "New York", "Paris"],
                  onChanged: (val) {
                    setState(() {
                      region = val;
                    });
                  },
                  hintText: 'Choose Region',
                  hintStyle: TextStyle(color: Colors.black),
                  value: region,
                ),
                SizedBox(height: 20),
                CustomCheckListTile(
                  title: "Male",
                  value: isMale!,
                  onChanged: (val) {
                    setState(() {
                      isMale = val;
                      if (isMale == true) {
                        isFemale = false;
                      }
                    });
                  },
                ),
                SizedBox(height: 20),
                CustomCheckListTile(
                  title: "Female",
                  value: isFemale!,
                  onChanged: (val) {
                    setState(() {
                      isFemale = val;
                      if (isFemale == true) {
                        isMale = false;
                      }
                    });
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFieldForm(
                        hintText: 'First Name',
                        controller: fNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'First name is required';
                          }
                        },
                        onChanged: (value) {
                          inputValidation();
                          fNameController.text = value;
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: CustomTextFieldForm(
                        hintText: 'Last Name',
                        controller: lNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Last name is required';
                          }
                        },
                        onChanged: (value) {
                          inputValidation();
                          lNameController.text = value;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CustomTextFieldForm(
                  hintText: 'Enter Email',
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    }
                  },
                  onChanged: (value) {
                    inputValidation();
                    emailController.text = value;
                  },
                ),
                SizedBox(height: 20),
                CustomTextFieldForm(
                  hintText: 'Enter Password',
                  isObscureText: isObscure1,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: isObscure1 == true
                      ? IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isObscure1 = false;
                            });
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isObscure1 = true;
                            });
                          },
                        ),
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'password is required';
                    }
                  },
                  onChanged: (value) {
                    inputValidation();
                    passwordController.text = value;
                  },
                ),
                SizedBox(height: 20),
                CustomTextFieldForm(
                  hintText: 'Confirm Password',
                  isObscureText: isObscure2,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: isObscure2 == true
                      ? IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isObscure2 = false;
                            });
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isObscure2 = true;
                            });
                          },
                        ),
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'confirm password is required';
                    }
                  },
                  onChanged: (value) {
                    inputValidation();
                    confirmPasswordController.text = value;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      log('Gender: $gender');
                      log('First Name: ${fNameController.text}');
                      log('Last Name: ${lNameController.text}');
                      log('Email: ${emailController.text}');
                      log('Password: ${passwordController.text}');
                      log('Confirm Password: ${confirmPasswordController.text}');
                      log('Country: $country');
                      log('Region: $region');
                      log('Male: $isMale');
                      log('Female: $isFemale');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: inputValid ? Colors.green : Colors.red,
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
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

import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/auth_widgets.dart';
import '../widgets/snackbar.dart';
import 'package:image_picker/image_picker.dart';
class CustomerRegister extends StatefulWidget {
  const CustomerRegister({Key? key}) : super(key: key);

  @override
  State<CustomerRegister> createState() => _CustomerRegisterState();
}

class _CustomerRegisterState extends State<CustomerRegister> {
  late String name;
  late String email;
  late String password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  bool passwordVisible = false;
  XFile? _imageFile;
  dynamic _pickedImageError;
  final ImagePicker _picker =ImagePicker();

  Future _pickImageFromCamera()async{
    try{
      final pickedImage = await _picker.pickImage(
          source: ImageSource.camera,
          maxHeight: 300,
          maxWidth: 300,
          imageQuality: 95);
      setState(() {
        _imageFile = pickedImage;
      });
    }catch(e){
      setState(() {
        _pickedImageError=e;
      });
      print(_pickedImageError);
    }
  }
  Future _pickImageFromGallery()async{
    try{
      final pickedImage = await _picker.pickImage(
          source: ImageSource.gallery,
          maxHeight: 300,
          maxWidth: 300,
          imageQuality: 95);
      setState(() {
        _imageFile = pickedImage;
      });
    }catch(e){
      setState(() {
        _pickedImageError=e;
      });
      print(_pickedImageError);
    }
  }


  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              reverse: true,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const AuthHeader(headerLabel: "Sign Up"),
                      Row(
                        children: [
                           Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.purpleAccent,
                              backgroundImage: _imageFile==null?null:FileImage(File(_imageFile!.path) ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15.0),
                                        topRight: Radius.circular(15))),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {_pickImageFromCamera();},
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15.0),
                                        bottomRight: Radius.circular(15))),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.photo,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {_pickImageFromGallery();},
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter your full name";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              name = value;
                            },
                            decoration: textFormDecoration.copyWith(
                                labelText: "Full Name",
                                hintText: "Enter your full name")),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter your email address";
                              } else if (value.isValidEmail() == false) {
                                return "Invalid Email";
                              } else if (value.isValidEmail() == true) {
                                return null;
                              }
                              return null;
                            },
                            onChanged: (value) {
                              email = value;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: textFormDecoration.copyWith(
                                labelText: "Email Address",
                                hintText: "Enter your email address")),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter your password";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              password = value;
                            },
                            obscureText: passwordVisible,
                            decoration: textFormDecoration.copyWith(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                      passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.purple),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                ),
                                labelText: "Password",
                                hintText: "Enter your password")),
                      ),
                      HaveAccount(
                          haveAccount: "already have an account? ",
                          actionLabel: "Log In",
                          onPressed: () {}),
                      AuthMainButton(
                        mainButtonLabel: "Sign Up",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if(_imageFile!=null){
                              print("valid");
                              print("picked image");
                              print(name);
                              print(email);
                              print(password);
                              _formKey.currentState!.reset();
                              setState(() {
                                _imageFile=null;
                              });
                            }else{
                              MyMessageHandler.showSnackBar(_scaffoldKey,"please picked image first");

                            }

                          } else {
                            MyMessageHandler.showSnackBar(_scaffoldKey,"fill all fields");
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

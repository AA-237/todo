import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/common/utils/constants.dart';
import 'package:todo/features/register/bloc/signin_bloc.dart';
import 'package:todo/features/register/sigin_controller.dart';
import 'package:todo/features/widgets/btn2.dart';
import 'package:todo/features/widgets/customtext2.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // var _isPasswordVissible = true;
  bool _obscureText = true;
  final nameComtroller = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final shape = StadiumBorder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(
        builder: (context, state) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(90.0),
                      bottomRight: Radius.circular(90)),
                  // color: Colors.red,
                  // gradient: LinearGradient(
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  //   // colors: [AppConstant.aBgBrown, AppConstant.aBgDark],
                  // ),
                ),
                child: const Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    buildTextField(
                      (value) {
                        context.read<RegisterBlocs>().add(UserNameEvent(value));
                      },
                      isPasswordType: false,
                      labelText: 'Full name',
                      controller: nameComtroller,
                      preffixIcon: const Icon(
                        Icons.person,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildTextField(
                      (value) {
                        context
                            .read<RegisterBlocs>()
                            .add(PhoneNumberEvent(value));
                      },
                      isPasswordType: false,
                      labelText: 'phone',
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      preffixIcon: const Icon(
                        Icons.phone,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildTextField(
                      (value) {
                        context.read<RegisterBlocs>().add(EmailEvent(value));
                      },
                      labelText: 'email',
                      isPasswordType: false,
                      controller: emailController,
                      preffixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    buildTextField(
                      (value) {
                        context.read<RegisterBlocs>().add(PasswordEvent(value));
                      },
                      labelText: 'password',
                      isPasswordType: _obscureText,
                      controller: passwordController,
                      preffixIcon: const Icon(
                        Icons.key,
                        color: Colors.brown,
                      ),
                      suffixIcon: IconButton(
                        color: Colors.brown,
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    reuseableButton(
                       () {
                        RegisterController(context: context).handleEmailRegister();
                       },
                      text: 'REGISTER',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already Have an Account?"),
                        TextButton(
                          onPressed: () {
                           Navigator.of(context).pop();
                          },
                          child: const Text(
                            'LogIn',
                            style: TextStyle(color: AppConstant.aBgBrown),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

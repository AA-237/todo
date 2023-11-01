import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/login/bloc/login_bloc.dart';
import 'package:todo/features/login/bloc/login_event.dart';
import 'package:todo/features/login/bloc/login_state.dart';
import 'package:todo/features/login/login_controller.dart';
import 'package:todo/features/todo/pages/home.dart';
import 'package:todo/features/widgets/btn2.dart';

import '../widgets/customtext2.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final formkey = GlobalKey();
  bool _obscureText = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogInBlocs, LogInState>(builder: (context, state) {
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
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 70,
                          width: 120,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 70,
                          width: 120,
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      buildTextField(
                          (value) {
                            context.read<LogInBlocs>().add(EmailEvent(value));
                          },
                          isPasswordType: false,
                          labelText: 'email',
                          preffixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.brown,
                          ),
                          validator: (value) {
                            if (value.isEmpty || value == null) {
                              return 'Please this field is required';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      buildTextField(
                        labelText: 'password',
                        isPasswordType: _obscureText,
                        controller: passwordController,
                        (value) {
                          context.read<LogInBlocs>().add(PasswordEvent(value));
                        },
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
                          LogInController(context: context)
                              .handleLogIn('email');
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const HomePage()));
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));

                          print('object');
                        },
                        text: 'LOGIN',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't Have an Account?"),
                          TextButton(
                            onPressed: () {
                              // to do
                              Navigator.of(context).pushNamed("register");
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.brown,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

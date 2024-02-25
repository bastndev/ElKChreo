import 'package:flutter/material.dart';
import 'package:practice/pages/controllers/auth_service.dart';
import 'package:practice/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // with SingleTickerProviderStateMixin{}
  // late AnimationController _controller;

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/logo.png'),
              const SizedBox(height: 10),
              const Text(
                'Welcome to my APP',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Enter Your Number Phone',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    keyboardType: TextInputType.phone,

                    /// `controller` to get the value of the input
                    controller: _phoneController,
                    decoration: InputDecoration(
                      prefix: const Text(
                        "+51 ",
                      ),
                      label: const Text(
                        "Phone Number",
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    validator: (value) {
                      if (value!.length != 9) return "Invalid Phone Number";
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    AuthService.sentOtp(
                      phone: _phoneController.text,
                      errorStep: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Error in sending OTP",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      ),
                      nextStep: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('OTP Verification'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Enter 6 numbers OTP'),
                                const SizedBox(height: 12),
                                Form(
                                  key: _formKey1,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,

                                    /// `controller` value of the input
                                    controller: _otpController,
                                    decoration: InputDecoration(
                                      prefix: const Text(""),
                                      label: const Text("Phone Number"),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.length != 6) {
                                        return "Invalid OTP";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            /** Button `Validator` for next page */
                            actions: [
                              TextButton(
                                onPressed: () {
                                  if (_formKey1.currentState!.validate()) {
                                    AuthService.loginWithOtp(
                                            otp: _otpController.text)
                                        .then(
                                      (value) {
                                        if (value == "Success") {
                                          Navigator.pop(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage(),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                value,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  }
                                },
                                child: const Text('Submit'),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('Send OTP'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

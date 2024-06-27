import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_app/screens/taps_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var isPassword = false;
  final Uri urlFacebook=Uri.parse('https://web.facebook.com/?_rdc=1&_rdr');
  final Uri urlGoogle=Uri.parse('https://www.google.com/search?gs_ssp=eJzj4tTP1TcwMU02T1JgNGB0YPBiS8_PT89JBQBASQXT&q=google&oq=go&aqs=chrome.3.69i65j69i57j69i59j46i131i199i433i465i512j0i131i433i512j69i60l3.6295j0j7&sourceid=chrome&ie=UTF-8');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen '),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'LOGIN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'To enjoy with our hot meals please login then take your time and have fun ',
                    style: TextStyle(fontSize: 23.0, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'gmail must not be empty and should have @ mark';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        prefixIcon: const Icon(
                          Icons.alternate_email_rounded,
                          size: 22.0,
                        )),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: passController,
                    validator: (value) {
                      if (value!.isEmpty ) {
                        return 'password is too short and should have 8 char or more';
                      }
                      return null;
                    },

                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isPassword,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        prefixIcon: const Icon(
                          Icons.lock_open_rounded,
                          size: 22.0,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                          icon: isPassword
                              ? const Icon(Icons.visibility,)
                              : const Icon(Icons.visibility_off,),
                        )
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: 400.0,
                    height: 40.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if(formKey.currentState!.validate()) {
                          Navigator.of(context).pushReplacementNamed(
                              TapsScreen.routName);
                          print(emailController.text);
                          print(passController.text);
                        }
                      },
                      child: const Text('LOGIN'),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text (
                          'Don\'t have an account?'
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'register now',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    '------------------------   OR   ------------------------',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed:()
                          {
                            launchUrl(urlFacebook);
                          },
                          child:const Icon(FontAwesomeIcons.facebook),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      ElevatedButton(
                        onPressed:()
                        {
                          launchUrl(urlGoogle);
                        },
                        child:const Icon(FontAwesomeIcons.google),
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

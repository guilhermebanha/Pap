import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pap/routes/router.dart';
import 'package:pap/utils/utils.dart';

Future<void> register(String email, String password, String name,
    String surname, String dob) async {
  final url = Uri.parse(
    '${Aux().getStr()}/register?name=$name&surname=$surname&dob=$dob&email=$email&password=$password',
  );
  final request = http.MultipartRequest(
    'POST',
    url,
  );
}

@RoutePage()
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late String? email;
    late String? pwd;
    late String? name;
    late String? surname;
    late String? dob;
    var controller = TextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 125,
                width: 125,
                child: Image.asset('imgs/socialverse.png'),
              ),
            ],
          ),
          const SizedBox(
            height: 12.5,
          ),
          // Name
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (txt) {
                    name = txt;
                  },
                  decoration: const InputDecoration(hintText: 'Name'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          // Surname
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (txt) {
                    surname = txt;
                  },
                  decoration: const InputDecoration(hintText: 'Surname'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          // Date of Birth
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  maxLength: 10,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(hintText: 'Day/Month/Year'),
                  controller: controller,
                  keyboardType: TextInputType.number,
                  onChanged: (txt) {
                    if (txt.length == 3 || txt.length == 6) {
                      if (txt.substring(txt.length - 1) != '/') {
                        controller
                          ..text =
                              '${txt.substring(0, txt.length - 1)}/${txt.substring(txt.length - 1)}'
                          ..selection = TextSelection.fromPosition(
                            TextPosition(offset: controller.text.length),
                          );
                      }
                    } else if (txt.length == 2 || txt.length == 5) {
                      if (txt.substring(txt.length - 1) != '/') {
                        controller
                          ..text = '$txt/'
                          ..selection = TextSelection.fromPosition(
                            TextPosition(offset: controller.text.length),
                          );
                      }
                    }

                    dob = txt;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12.5,
          ),
          // Email
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (txt) {
                    email = txt;
                  },
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          // Password
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (txt) {
                    pwd = txt;
                  },
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12.5,
          ),
          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (email != null && email != '') {
                    if (pwd != null && pwd != '') {
                      register(email!, pwd!, name!, surname!, dob!);
                    }
                  }
                },
                child: const Text('Submit'),
              ),
              const SizedBox(width: 25),
              ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(LoginRoute());
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

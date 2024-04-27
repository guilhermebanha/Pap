import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pap/routes/router.dart';
import 'package:pap/utils/utils.dart';

Future<void> login(String email, String password) async {
  final url = Uri.parse(
    '${Aux().getStr()}/login?email=${email}&password=$password',
  );
  final request = http.MultipartRequest(
    'POST',
    url,
  );
}

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late String? email;
    late String? pwd;
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
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (email != null && email != '') {
                    if (pwd != null && pwd != '') {
                      login(email!, pwd!);
                    }
                  }
                },
                child: const Text('Submit'),
              ),
              const SizedBox(width: 12.5),
              ElevatedButton(
                  onPressed: () {
                    AutoRouter.of(context).push(const RegisterRoute());
                  },
                  child: const Text('Register')),
            ],
          ),
        ],
      ),
    );
  }
}

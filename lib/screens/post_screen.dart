import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pap/utils/utils.dart';

@RoutePage()
class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late String? txtfinal;
  late Uint8List img = Uint8List(0);
  String toggletxt = '';

  Future<void> upload() async {
    final url = Uri.parse(
      '${Aux().getStr()}/testpost?email=someoneemail@gmail.com&content=$txtfinal',
    );
    final request = http.MultipartRequest(
      'POST',
      url,
    );

    request.files.add(
      http.MultipartFile.fromBytes(
        'image',
        img,
        filename: returnfiletype(),
      ),
    );
    await request.send();

    /*
    print('####################');
    print(resposta.statusCode);
    print(resposta);
    print(resposta.body);
    print('####################');
    */
  }

  Future<void> chooseImg() async {
    final x = await picker();
    if (x != null) img = x;
    setState(() {
      toggletxt = returnfilename();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          height: 250,
          child: Image.asset('imgs/socialverse.png'),
        ),
        const Text(
          'Socialverse',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          width: 200,
          child: TextField(
            maxLength: 80,
            onChanged: (text) {
              txtfinal = text;
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(toggletxt),
            IconButton(
              onPressed: chooseImg,
              icon: const Icon(Icons.upload_file),
            ),
          ],
        ),
        ElevatedButton(onPressed: upload, child: const Text('Submit')),
      ],
    );
  }
}

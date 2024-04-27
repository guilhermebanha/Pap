import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

late final XFile? xfi;
late final String? userEmail;
late final int? id;

class Aux {
  final String redirectUrl = 'https://pink-eels-attack.loca.lt';

  String getStr() {
    return redirectUrl;
  }
}

Future<Uint8List?> picker() async {
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  xfi = image;
  return image?.readAsBytes();
}

String returnfiletype() {
  return xfi!.path.split('/').last.split('.').last;
}

String returnfilename() {
  return xfi!.path.split('/').last;
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pap/utils/utils.dart';

class FinalPost {
  FinalPost({
    required this.id,
    required this.content,
    required this.like,
    required this.dislike,
    required this.uid,
    required this.mediapath,
  });

  final int id;
  final int uid;
  final int like;
  final int dislike;
  final String content;
  final String mediapath;
}

Future<List<FinalPost>> getPosts() async {
  final uri = Uri.parse('${Aux().getStr()}/posts');
  final List<FinalPost> lf = [];
  final response = await http.get(uri);
  List<dynamic> jsonData = json.decode(response.body) as List<dynamic>;
  for (dynamic d in jsonData) {
    FinalPost f = FinalPost(
      id: int.parse(d['ID'].toString()),
      content: d['Content'].toString(),
      like: int.parse(d['Like'].toString()),
      dislike: int.parse(d['Dislike'].toString()),
      uid: int.parse(d['User_ID'].toString()),
      mediapath: d['MediaPath'].toString(),
    );
    lf.add(f);
  }
  // print('FIRST ID: ${lf[0].id}');
  return lf;
}

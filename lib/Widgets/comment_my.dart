import 'package:flutter/material.dart';

class MyComment extends StatefulWidget {
  const MyComment({super.key});

  @override
  State<MyComment> createState() => _MyCommentState();
}

class _MyCommentState extends State<MyComment> {
  late final String comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Row(
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundImage: Image.network(
                  'https://i.etsystatic.com/34732889/r/il/b08942/3768265623/il_570xN.3768265623_sji1.jpg',
                ).image,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: 324,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 10),
                  child: TextField(
                    maxLength: 35,
                    onChanged: (txt) {
                      comment = txt;
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

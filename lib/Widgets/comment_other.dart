import 'package:flutter/material.dart';
import 'package:pap/Widgets/comment_my.dart';

class OtherComment extends StatefulWidget {
  const OtherComment({required this.id, super.key});

  final int id;

  @override
  State<OtherComment> createState() => _OtherCommentState();
}

class _OtherCommentState extends State<OtherComment> {
  @override
  Widget build(BuildContext context) {
    if (widget.id >= 1) {
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
            const Column(
              children: [
                SizedBox(
                  width: 324,
                  child: Padding(
                    padding: EdgeInsets.only(top: 15, left: 10),
                    child: Text('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaAHAHAHA BOR!'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return const MyComment();
    }
  }
}

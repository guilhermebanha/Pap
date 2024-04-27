import 'package:flutter/material.dart';
import 'package:pap/classes/post.dart';
import 'package:pap/utils/utils.dart';

class Post extends StatefulWidget {
  const Post({required this.p, super.key});

  final FinalPost p;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    const testingtext = 'AAA';
    print(widget.p.mediapath);
    const defPfp =
        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';
    return Stack(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            image: DecorationImage(
              image: NetworkImage(
                '${Aux().getStr()}/sendBytes?mediapath=${widget.p.mediapath}',
              ),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8),
                BlendMode.darken,
              ),
            ),
            color: Colors.yellow,
          ),
          // child: Text(widget.id.toString()),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const CircleAvatar(
                      backgroundImage: NetworkImage(defPfp),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8),
                    child: Text(
                      'id: ${widget.p.uid}',
                      style: const TextStyle(color: Colors.yellow),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      widget.p.content,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.p.like.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

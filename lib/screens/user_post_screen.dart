import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pap/Widgets/exporter.dart';

@RoutePage()
class UserPostScreen extends StatefulWidget {
  const UserPostScreen({super.key});

  @override
  State<UserPostScreen> createState() => _UserPostScreenState();
}

class _UserPostScreenState extends State<UserPostScreen> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color.fromRGBO(227, 223, 206, 100),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(184, 172, 130, 100),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    height: 80,
                    width: 384,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              iconSize: 72,
                              icon: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                  'https://i.etsystatic.com/34732889/r/il/b08942/3768265623/il_570xN.3768265623_sji1.jpg',
                                ),
                              ),
                            ),
                            const Column(
                              children: [
                                Text(
                                  'aaaa',
                                  style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.justify,
                                ),
                                Text(
                                  '@dweg',
                                  style: TextStyle(fontSize: 10),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  // color: Colors.teal,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Image.network(
                  'https://c4.wallpaperflare.com/wallpaper/245/509/279/fantasy-art-building-fantasy-city-wallpaper-preview.jpg',
                  width: 384,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: Color.fromRGBO(184, 172, 130, 100),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.favorite_outline,
                ),
                Text(' 999'),
                SizedBox(width: 25),
                Icon(
                  Icons.comment_outlined,
                ),
                Text(' 999'),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return OtherComment(id: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

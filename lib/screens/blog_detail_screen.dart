import 'package:flutter/material.dart';
import 'package:flutter_app/data/journeys.dart';
import 'package:flutter_html/flutter_html.dart';

class BlogDetailScreen extends StatefulWidget {
  final int id;

  const BlogDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<BlogDetailScreen> createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: FutureBuilder(
          future: getJourneyById(widget.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data =
                  Journeys.fromJson(snapshot.data as Map<String, dynamic>);

              final regExp = new RegExp(
                ' src="([^"]+)"',
                caseSensitive: false,
                multiLine: false,
              );

              return ListView(
                children: [
                  Container(
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 2,
                    child: Image.network(
                      regExp
                              .firstMatch(data.description ?? '')
                              ?.group(0)
                              ?.split('"')[1]
                              .toString() ??
                          '',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${data.title}',
                      style: TextStyle(
                        color: Colors.teal,
                        decoration: TextDecoration.none,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.remove_red_eye_sharp,
                        ),
                        Text(
                          '${data.seen}',
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.none,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.bookmark,
                        ),
                        Text(
                          '${data.bookmarks?.length}',
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.none,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Html(
                      data: data.description,
                      style: {
                        "img": Style(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 40, right: 40))
                      },
                    ),
                  )
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

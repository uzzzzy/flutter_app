import 'package:flutter/material.dart';
import 'package:flutter_app/data/journeys.dart';
import 'package:flutter_app/screens/blog_detail_screen.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const Text(
                'Blog',
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.none,
                ),
              ),
              Flexible(
                child: FutureBuilder<List<dynamic>>(
                  future: getJourneys(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: EdgeInsets.all(8),
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Journeys journey =
                                Journeys.fromJson(snapshot.data![index]);

                            final regExp = new RegExp(
                              ' src="([^"]+)"',
                              caseSensitive: false,
                              multiLine: false,
                            );
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BlogDetailScreen(id: journey.id ?? 0),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      margin: EdgeInsets.only(right: 10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          regExp
                                                  .firstMatch(
                                                      journey.description ?? '')
                                                  ?.group(0)
                                                  ?.split('"')[1]
                                                  .toString() ??
                                              '',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        journey.title.toString(),
                                        style: const TextStyle(
                                          fontSize: 24,
                                          decoration: TextDecoration.none,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

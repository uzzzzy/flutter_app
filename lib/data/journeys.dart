import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> getJourneys() async {
  http.Response response = await http.get(
    Uri.parse(
        'https://yzua-express.herokuapp.com/api/v1/journeys?order=createdAt,desc'),
    headers: {"Accept": "application/json"},
  );
  return jsonDecode(response.body)['data']['journeys'];
}

Future<Map<String, dynamic>> getJourneyById(id) async {
  http.Response response = await http.get(
    Uri.parse('https://yzua-express.herokuapp.com/api/v1/journey/$id'),
    headers: {"Accept": "application/json"},
  );
  return jsonDecode(response.body)['data'];
}

class Journeys {
  int? id;
  String? title;
  int? userId;
  String? description;
  int? seen;
  List? bookmarks;
  String? createdAt;

  Journeys(
      {this.id,
      this.title,
      this.userId,
      this.description,
      this.seen,
      this.bookmarks,
      this.createdAt});

  Journeys.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    userId = json['userId'];
    description = json['description'];
    seen = json['seen'];
    bookmarks = json['bookmarks'];

    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['userId'] = this.userId;
    data['description'] = this.description;
    data['seen'] = this.seen;
    data['bookmarks'] = this.bookmarks;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

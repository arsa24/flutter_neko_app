import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart";

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  final List<Map<String, dynamic>> _searchData = [];
  Future searchByID(String id) async {
    final response =
        await get(Uri.parse("https://api.nekosapi.com/v4/images/$id"));
    if (response.statusCode == 200) {
      final data = await json.decode(response.body);
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 38, left: 16, right: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search by id",
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(Icons.search)
            ],
          ),
          SizedBox(height: 12),
          Text(
            "Search by tags",
            textAlign: TextAlign.left,
          ),
          Wrap(
            spacing: 14,
            runSpacing: 6,
            children: [
              Chip(label: Text("data")),
              Chip(label: Text("data")),
              Chip(label: Text("data")),
              Chip(label: Text("data")),
              Chip(label: Text("data")),
              Chip(label: Text("data")),
            ],
          )
        ],
      ),
    ));
  }
}

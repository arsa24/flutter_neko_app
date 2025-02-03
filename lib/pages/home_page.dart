import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:neko_app/components/img_anime_card.dart';
import 'package:neko_app/components/toggle_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final List<Map<String, dynamic>> _imgurls = [];
  bool isLoading = false;
  Future getNeko() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    final response = await http
        .get(Uri.parse("https://api.nekosapi.com/v4/images/random"), headers: {
      "User-Agent":
          "Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101 Firefox/128.0"
    });
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Map<String, dynamic>> imgurls = [];

      for (var item in data) {
        if (item is Map<String, dynamic> &&
            item.containsKey("url") &&
            item.containsKey("id")) {
          imgurls.add(
              {"url": item['url'], "id": item['id'], "rating": item["rating"]});
        }
      }
      setState(() {
        _imgurls.addAll(imgurls);
      });
    } else {
      throw Exception("Error from API: ${response.statusCode}");
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getNeko();
  }

  @override
  Widget build(BuildContext context) {
    final toggleprov = Provider.of<ToggleProvider>(context, listen: false);
    bool isShowR18 = toggleprov.isR18;

    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotif) {
              if (scrollNotif is ScrollUpdateNotification) {
                if (scrollNotif.metrics.pixels ==
                    scrollNotif.metrics.maxScrollExtent) {
                  getNeko();
                }
              }
              return false;
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: _imgurls.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : MasonryGridView.builder(
                      gridDelegate:
                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: _imgurls.length,
                      itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.all(1),
                          child: ImgAnimeCard(
                              img: _imgurls[index]['url'],
                              show: isShowR18 ? true : false,
                              id: _imgurls[index]['id']))),
            )));
  }
}

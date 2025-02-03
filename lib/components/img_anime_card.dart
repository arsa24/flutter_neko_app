import "package:flutter/material.dart";
import 'package:neko_app/components/toggle_provider.dart';
import 'package:provider/provider.dart';

class ImgAnimeCard extends StatefulWidget {
  final String img;
  final int id;
  final bool show;
  const ImgAnimeCard(
      {super.key, required this.img, required this.id, required this.show});

  @override
  State<StatefulWidget> createState() => _ImgAnimeCard();
}

class _ImgAnimeCard extends State<ImgAnimeCard> {
  bool _isActive = false;

  void togglebtn() {
    setState(() {
      _isActive = !_isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ToggleProvider>(builder: (context, prov, child) {
      bool isDarkMode = prov.isDarkMode;

      return Card(
        color: isDarkMode ? Colors.transparent : Colors.white,
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.img, fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return widget.show
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: child,
                      )
                    : SizedBox(
                        height: 120,
                        child: Center(
                          child: Icon(Icons.warning),
                        ),
                      );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              }
            }),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.id.toString(), style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black
                  ),),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: togglebtn,
                      borderRadius: BorderRadius.circular(50),
                      child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Container(
                            alignment: Alignment.center,
                            child: Icon(_isActive
                                ? Icons.favorite
                                : Icons.favorite_border),
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}

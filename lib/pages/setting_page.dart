import "package:flutter/material.dart";

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [IsShowRContent()],
            ),
          ),
        ));
  }
}

class IsShowRContent extends StatefulWidget {
  const IsShowRContent({super.key});

  @override
  State<IsShowRContent> createState() => _IsShowRContent();
}

class _IsShowRContent extends State<IsShowRContent> {
  bool isActive = false;

  void togglebtn() {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Dark mode",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: togglebtn,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: 50,
                height: 26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: isActive ? Colors.blue : Colors.grey[400],
                ),
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: isActive
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Show R18 content",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: togglebtn,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: 50,
                height: 26,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: isActive ? Colors.blue : Colors.grey[400],
                ),
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: isActive
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

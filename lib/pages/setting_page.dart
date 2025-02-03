import "package:flutter/material.dart";
import "package:neko_app/components/toggle_button.dart";
import "package:neko_app/components/toggle_provider.dart";
import "package:provider/provider.dart";

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final toggleProvider = Provider.of<ToggleProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                spacing: 24,
                children: [
                  ToggleButton(
                    text: "Dark mode",
                    value: toggleProvider.isDarkMode,
                    onTogle: toggleProvider.toggleDarkMode,
                  ),
                  ToggleButton(
                    text: "Show R18 content",
                    onTogle: toggleProvider.toggleR18,
                    value: toggleProvider.isR18,
                  )
                ],
              )),
        ));
  }
}

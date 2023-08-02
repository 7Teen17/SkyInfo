import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({
    super.key,
  });

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final apiTextController = TextEditingController();

  @override
  void dispose() {
    apiTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Player UUID",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.normal,
                color: Colors.white)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: apiTextController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Player UUID"),
          ),
        ),
      ],
    );
  }
}

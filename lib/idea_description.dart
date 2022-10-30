import 'package:flutter/material.dart';

class DescriptionIdea extends StatefulWidget {
  const DescriptionIdea({Key? key}) : super(key: key);

  @override
  State<DescriptionIdea> createState() => _DescriptionIdeaState();
}

class _DescriptionIdeaState extends State<DescriptionIdea> {
  @override
  Widget build(BuildContext context) {
    final ideas = ModalRoute.of(context)!.settings.arguments
        as String; //распаковка аргументов, достаю значения

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(ideas), // что должно передаваться
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

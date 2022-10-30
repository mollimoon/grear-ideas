

import 'package:flutter/material.dart';
import 'package:great_ideas/idea_description.dart';
import 'idea_main.dart';



void main() {
  runApp(
    MaterialApp(
      routes: {
        '/': (context) => const GeniusIdeas(),
        '/description': (context) => const DescriptionIdea(),
      },
      // home: GeniusIdeas(),
    ),
  );
}


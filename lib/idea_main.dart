import 'package:flutter/material.dart';

class GeniusIdeas extends StatefulWidget {
  const GeniusIdeas({Key? key}) : super(key: key);

  @override
  State<GeniusIdeas> createState() => _GeniusIdeasState();
}

class _GeniusIdeasState extends State<GeniusIdeas> {
  Set<String> uniqueIdeas = {};
  // String currentIdea = '';
  final TextEditingController textEditingController =
      TextEditingController(); // объявляем контроллер

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              const Text(
                'Гениальные идеи',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: textEditingController, // присвоили контроллер
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    //проверка на пустое значение
                    setState(() {
                      uniqueIdeas.add(value);
                      textEditingController.clear(); // очистка значения
                    });
                  }
                },
                // onChanged: (String idea) {
                //   currentIdea = idea;
                // },
                decoration: const InputDecoration(
                  hintText: 'Enter your idea',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     if (currentIdea.isNotEmpty) { //проверка на пустое значение
              //       setState(() {
              //         uniqueIdeas.add(currentIdea);
              //       });
              //     }
              //   },
              //   child: const Text(
              //     'Добавить!',
              //     style: TextStyle(
              //       fontSize: 15,
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: uniqueIdeas.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async {
                        final needRemove = await Navigator.pushNamed(
                          context,
                          '/description',
                          arguments: uniqueIdeas.elementAt(
                              index), //передаем аргумент того, что мы хотим на новом экране использовать
                        ) as bool?; // до этого места ждет что мы выберем; проверяет нул или бул
                        if (needRemove == true) {
                          setState(() {
                            uniqueIdeas.remove(uniqueIdeas.elementAt(index)); //
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              uniqueIdeas.elementAt(index),
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

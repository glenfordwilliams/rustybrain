import 'package:flutter/material.dart';
import 'package:mobile/question/question_interface.dart';
import 'package:more/more.dart';

Widget objectsToWidget(Question q) {
  // var parent = Container();
  List<Widget> items = [];

  print(q.image);
  q.drawables
      .where((element) => element.isOption == false)
      .toList()
      .indexed()
      .forEach((element) {
    items.add(Text(
        q.getPrefix(
            element.index,
            element.value.text!.text!.plural!.isEmpty
                ? element.value.text!.text!.singular!
                : element.value.text!.text!.plural!),
        style: const TextStyle(fontSize: 22)));
  });

  q.drawables
      .where((element) => element.isOption == true)
      .toList()
      .indexed()
      .forEach((element) {
    items.add(Text(
      q.getPrefix(
          element.index,
          element.value.text!.text!.plural!.isEmpty
              ? element.value.text!.text!.singular!
              : element.value.text!.text!.plural!),
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ));
  });

  return Column(
    children: items,
  );
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/DbControllers.dart';

class NewNotePage extends StatelessWidget {
  const NewNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    DbController dbController = Get.put(DbController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "NEW - NOTE",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // TextFormField(
            //   controller: dbController.title,
            //   decoration: const InputDecoration(
            //     border: InputBorder.none,
            //     hintText: "Title",
            //   ),
            // ),
            TextFormField(
              controller: dbController.title,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Title"),
            ),
            TextFormField(
              controller: dbController.des,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Description",
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  dbController.addNotes();
                },
                child: const Text("SAVE"))
          ],
        ),
      ),
    );
  }
}

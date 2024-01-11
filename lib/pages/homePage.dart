import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/DbControllers.dart';
import 'package:notes_app/pages/newNotePage.dart';
import 'package:notes_app/pages/noteWidgte.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DbController controller = Get.put(DbController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "API - NOTE",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                controller.getNotes();
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(
            () => GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              children: controller.notesList
                  .map((e) => NoteWidgets(
                        note: e,
                      ))
                  .toList(),
            ),
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Get.to(() => const NewNotePage());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

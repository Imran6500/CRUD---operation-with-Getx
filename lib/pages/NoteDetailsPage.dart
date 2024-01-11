// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/Models/NoteModel.dart';
import 'package:notes_app/controllers/DbControllers.dart';

class NoteDetails extends StatelessWidget {
  final NoteModel note;
  const NoteDetails({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    DbController dbController = Get.put(DbController());
    dbController.titleDetails.text = note.title.toString();
    dbController.desDetails.text = note.description.toString();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "NOTE DETAILS",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              dbController.deleteNotes(note.id!);
            },
            icon: const Icon(Icons.delete),
            color: Colors.white,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: dbController.titleDetails,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Title"),
            ),
            TextFormField(
              controller: dbController.desDetails,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Description",
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  dbController.updateNotes(note.id!);
                },
                child: const Text("UPDATE NOTE"))
          ],
        ),
      ),
    );
  }
}

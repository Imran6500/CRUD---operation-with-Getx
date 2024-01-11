import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:notes_app/Models/NoteModel.dart';
import 'package:notes_app/pages/NoteDetailsPage.dart';

class NoteWidgets extends StatelessWidget {
  final NoteModel note;
  const NoteWidgets({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => NoteDetails(note: note));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.deepPurple.shade300,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title!,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Flexible(
                    child: Text(
                      note.description!,
                      maxLines: 8,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

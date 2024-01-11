import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:notes_app/Models/NoteModel.dart';

class DbController extends GetxController {
  String baseurl = "https://659eea3e47ae28b0bd36f736.mockapi.io/note";

  RxList<NoteModel> notesList = RxList<NoteModel>();
  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController titleDetails = TextEditingController();
  TextEditingController desDetails = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  Future<void> getNotes() async {
    var response = await http.get(Uri.parse(baseurl));
    var notes = jsonDecode(response.body);
    notesList.clear();
    for (var note in notes) {
      notesList.add(NoteModel.fromJson(note));
    }
    print("😍 got the Note");
  }

  Future<void> addNotes() async {
    var newNode = NoteModel(
      title: title.text,
      description: des.text,
      date: DateTime.now().toString(),
      time: DateTime.timestamp().toString(),
    );
    // print("${newNode.toJson().toString()}");
    // return;
    if (title.text != "" || des.text != "") {
      var response = await http.post(Uri.parse(baseurl),
          body: jsonEncode(newNode.toJson()),
          headers: {"Content-Type": "aplication/json"});
      if (response.statusCode == 201) {
        title.clear();
        des.clear();
        print("Note Added!");
        getNotes();
      }
    } else {
      print("Please add something");
    }
  }

  Future<void> deleteNotes(String id) async {
    var newBaseUrl = "https://659eea3e47ae28b0bd36f736.mockapi.io/note/$id";

    var response = await http.delete(Uri.parse(newBaseUrl));
    if (response.statusCode == 200) {
      print("Note Deleted");
      getNotes();
      Get.back();
    }
  }

  Future<void> updateNotes(String id) async {
    var newBaseUrl = "https://659eea3e47ae28b0bd36f736.mockapi.io/note/$id";
    var updateNote =
        NoteModel(title: titleDetails.text, description: desDetails.text);
    var response = await http.put(Uri.parse(newBaseUrl),
        body: jsonEncode(updateNote.toJson()),
        headers: {"Content-Type": "aplication/json"});
    if (response.statusCode == 200) {
      print("Note Updated!");
      getNotes();
    }
  }
}

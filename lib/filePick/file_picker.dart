import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({super.key});

  @override
  State<FilePickerScreen> createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Picker"),
        centerTitle: true,
      ),
      body: Container(
        width: 400,
        alignment: Alignment.center,
        color: Colors.blue,
        child: ElevatedButton(
            onPressed: () async {
              final result = await FilePicker.platform.pickFiles();
            },
            child: Text("Image Picker")),
      ),
    );
  }
}

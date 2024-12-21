import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:projectsmax/cachedImage/cache_image.dart';
import 'package:projectsmax/filePick/files_page.dart';

class DialogBoxn extends StatefulWidget {
  const DialogBoxn({super.key});

  @override
  State<DialogBoxn> createState() => _DialogBoxnState();
}

class _DialogBoxnState extends State<DialogBoxn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CacheImageScreen()));
              },
              child: const Text('Cache Screen')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: Colors.blue,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('dialog'),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(hintText: 'image picker'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('close')),
                    ],
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        width: 400,
        alignment: Alignment.center,
        color: Colors.blue,
        child: ElevatedButton(
          onPressed: () async {
            final result = await FilePicker.platform.pickFiles(
              allowMultiple: true,
              type: FileType.any,
            );
            if (result == null) return;
      
            openFiles(result.files);
            // open single file
            //   final file = result.files.first;
            //  openFile(file);
            // print('name: ${file.name}');
            // print('size: ${file.size}');
            // print('extention: ${file.extension}');
            // print('bytes: ${file.bytes}');
            // print('path: ${file.path}');
      
            // save permanently file
      
            // final newFile = await saveFilesPermanently(file);
      
            // print('FromvPath ${file.path!}');
            // print('TovPath ${newFile.path}');
          },
          child: const Text("Imagee Picker"),
        ),
      ),
    );
  }

  void openFiles(List<PlatformFile> files) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            FilesPageScreen(files: files, onOpenFile: openFile)));
  }

  Future<File> saveFilesPermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');

    return File(file.path!).copy(newFile.path);
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}

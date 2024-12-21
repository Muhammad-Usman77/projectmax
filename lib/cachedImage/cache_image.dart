import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

class CacheImageScreen extends StatefulWidget {
  const CacheImageScreen({super.key});

  @override
  State<CacheImageScreen> createState() => _CacheImageScreenState();
}

class _CacheImageScreenState extends State<CacheImageScreen> {
  final String imageUrl =
      'https://images.unsplash.com/photo-1667053508464-eb11b394df83?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fHww';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  final url = 'https://www.youtube.com/';
                  await Share.share("share this text $url");
                },
                child: const Text(
                  'Share text',
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  final urlImage =
                      'https://images.unsplash.com/photo-1667053508464-eb11b394df83?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fHww';
                  final url = Uri.parse(urlImage);
                  final response = await http.get(url);
                  final bytes = response.bodyBytes;

                  final temp = await getTemporaryDirectory();
                  final path = "${temp.path}/image.jpg";

                  File(path).writeAsBytesSync(bytes);

                  await Share.shareXFiles([XFile(path)],
                      text: 'share the girls image');
                },
                child: const Text(
                  'Share image',
                  style: TextStyle(color: Colors.black),
                )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);

                if (image == null) return;

                await Share.shareXFiles([XFile(image.path)]);
              },
              child: Text('Pick From gallery'),
            ),
            SizedBox(
              height: 10,
            ),
            // ElevatedButton(
            //   onPressed: () async {
            //     // String url =
            //     //     'https://images.unsplash.com/photo-1667053508464-eb11b394df83?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fHww';
            //     _saveNetworkImage();
            //   },
            //   child: Text("Download"),
            // ),

            // Expanded(
            //   child: ListView.builder(
            //       itemCount: 10,
            //       itemBuilder: (context, index) {
            //         return Column(
            //           children: [
            //             Container(
            //               width: 200,
            //               height: 200,
            //               decoration: BoxDecoration(
            //                 image: DecorationImage(
            //                   image: CachedNetworkImageProvider(imageUrl),
            //                 ),
            //               ),
            //             ),
            //             SizedBox(
            //               height: 10,
            //             ),
            //           ],
            //         );
            // CachedNetworkImage(
            //   imageUrl: imageUrl,
            //   fit: BoxFit.cover,
            //   width: 200,
            //   placeholder: (context, url) => CircularProgressIndicator(),
            //   errorWidget: (context, url, Error) => Icon(Icons.error),
            // );
            //       }),
            // ),
          ],
        )
        //  Column(
        //   children: [
        // Container(
        //   width: 200,
        //   height: 200,

        //   decoration: BoxDecoration(

        //     image: DecorationImage(

        //       image: CachedNetworkImageProvider(imageUrl),

        //     ),
        //   ),
        // ),

        //   ],
        // )

        );
  }

 
}

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_ui/provider/user_provider.dart';
import 'package:provider/provider.dart';

class UserImageProvider extends ChangeNotifier {
  static Uint8List _image;

  static Uint8List get image => _image;

  static Future uploaProfileImage(
    BuildContext context,
    File image,
  ) async {
    final userId = Provider.of<UserProvider>(context, listen: false).objectId;
    final base64 = base64Encode(image.readAsBytesSync());
    final imageName = image.path.split('/').last;
    // print(imageName);
    // print(base64);

    return await post(
      'https://parseapi.back4app.com/classes/ProfileImage',
      headers: {
        'X-Parse-Application-Id': '7Z4VmA2zxuZ47t56ZgFLF0bqpXsE4wfLLPBbxVad',
        'X-Parse-REST-API-Key': 'MsFJnrVh6i6hu4Jclo0hrpKC0BV0C7lW2MD4x6CB',
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'ImageId': userId,
          'Image': base64,
          'ImageName': imageName,
        },
      ),
    );
  }

  static Future<Uint8List> getProfileImage() async {
    final responce = await get(
      'https://parseapi.back4app.com/classes/ProfileImage',
      headers: {
        'X-Parse-Application-Id': '7Z4VmA2zxuZ47t56ZgFLF0bqpXsE4wfLLPBbxVad',
        'X-Parse-REST-API-Key': 'MsFJnrVh6i6hu4Jclo0hrpKC0BV0C7lW2MD4x6CB',
        'Content-Type': 'application/json',
      },
    );
    final data = jsonDecode(responce.body);
    //  print(data);
    if (data == null) {
      return null;
    }
    var lastData = [];

    lastData = data['results'];
    if (lastData.isEmpty) {
      return null;
    }
    // print(lastData);
    final imageData = lastData.last;
    if (imageData == null) {
      return null;
    }

    final imageCode = imageData['Image'];
    // print(imageCode);

    final image = base64Decode(imageCode);

    _image = image;
    // print(_image);
    return _image;
  }
}

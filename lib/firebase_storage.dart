import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  static final storage = FirebaseStorage.instance;
  static Future<String> uploadImage(File file) async {
    String url = '';

    try {
      final ref = storage.ref();
      final childRef = ref.child("/images${file.path.split('/').last}");
      final task = await childRef.putFile(file);

      if (task.state == TaskState.success) {
        url = await childRef.getDownloadURL();
      }
    } catch (e) {
      print(e);
    }
    return url;
  }
}

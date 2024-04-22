import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

Future<String> uploadImage(
    String folderName,String imageName , File file) async {
  final _storage = FirebaseStorage.instance;
  Reference reference = _storage
      .ref()
      .child("$folderName/${DateTime.now().millisecondsSinceEpoch}").child(imageName);

  UploadTask uploadTask = reference.putData(
    await file.readAsBytes(),
    SettableMetadata(contentType: 'image/png'),
  );

  // UploadTask uploadTask = reference.putFile(file);
  TaskSnapshot snapshot = await uploadTask;
  String urlImage = await snapshot.ref.getDownloadURL();
  return urlImage;
}

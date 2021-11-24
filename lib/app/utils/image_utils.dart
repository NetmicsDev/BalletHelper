import 'dart:io';

import 'package:flutter/material.dart';

class ImageUtils {
  static ImageProvider pathToImage(path) => path.contains('assets/images/')
      ? AssetImage(path)
      : path.contains('image_picker')
          ? FileImage(File(path)) as ImageProvider
          : NetworkImage(path);
}

import 'package:ballet_helper/app/data/model/image_model.dart';
import 'package:ballet_helper/app/data/model/user_model.dart';

class DummyDatas {
  static UserModel parent = UserModel(
    name: '아이유',
    profile: 'assets/images/test_student_avatar.png',
    academyName: '이화 YSM',
    branchName: '판교점',
    className: 'A반',
  );

  static List<ImageModel> imageList = List.filled(
      15, ImageModel(id: 0, uri: 'assets/images/test_grid_image.png'));
}

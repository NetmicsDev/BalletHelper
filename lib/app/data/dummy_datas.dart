import 'package:ballet_helper/app/data/model/image_model.dart';
import 'package:ballet_helper/app/data/model/notice_model.dart';
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

  static List<NoticeModel> noticeList = [
    NoticeModel(
        name: '이호철 원장님',
        profile: 'assets/images/test_owner_avatar.jpg',
        dateTime: '5분전',
        title: '휴원 안내',
        content: '2021년 12월 12일 휴원합니다.'),
    NoticeModel(
        name: '박소라 선생님',
        profile: 'assets/images/test_teacher_avatar.png',
        dateTime: '2021년 11월 28일',
        title: '휴원 안내',
        content: '2021년 12월 1일 폭설로 인해 휴원합니다.\n다들 따뜻하게 입으세요~ㅎㅎ',
        image: 'assets/images/test_notice_image.jpg'),
  ];
}
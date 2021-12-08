import 'package:ballet_helper/app/data/model/image_model.dart';
import 'package:ballet_helper/app/data/model/notice_model.dart';
import 'package:ballet_helper/app/data/model/user_model.dart';

import 'model/album_model.dart';
import 'model/parent_model.dart';
import 'model/student_model.dart';

class DummyDatas {
  static StudentModel student = StudentModel(
    id: '2',
    name: '아이유',
    birth: '2018-10-13',
    phone: '010-1234-5678',
    profile: 'assets/images/test_student_avatar.png',
    branchName: '판교점',
    className: 'A반',
  );
  static ParentModel parent = ParentModel(
    name: '아이유 어머님',
    phone: '010-1234-5678',
    email: 'parent1@naver.com',
    student: student,
  );
  static UserModel teacher = UserModel(
    name: '박소라',
    phone: '010-8765-4321',
    email: 'teacher1@naver.com',
    profile: 'assets/images/test_teacher_avatar.png',
    branchName: ['판교점'],
    className: ['A반', 'B반', 'C반'],
  );
  static UserModel owner = UserModel(
    name: '이호철',
    phone: '010-8765-4321',
    email: 'owner1@gmail.com',
    profile: 'assets/images/test_owner_avatar.jpg',
    branchName: ['판교점', '보정점'],
    className: ['A반', 'B반', 'C반'],
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

  static List<AlbumModel> albumList = [
    AlbumModel(
      id: '2',
      name: '이호철 원장님',
      profile: 'assets/images/test_owner_avatar.jpg',
      dateTime: '5분전',
      content: '허리 뽀샤뽀샤~',
      images: [
        'assets/images/test_album_2.png',
        'assets/images/test_album_3.png',
      ],
      students: studentList.getRange(2, 6).toList(),
    ),
    AlbumModel(
      id: '1',
      name: '박소라 선생님',
      profile: 'assets/images/test_teacher_avatar.png',
      dateTime: '2021년 11월 28일',
      content: '열심열심',
      images: [
        'assets/images/test_album_1.png',
      ],
      students: studentList.getRange(6, 8).toList(),
    ),
    AlbumModel(
      id: '0',
      name: '박소라 선생님',
      profile: 'assets/images/test_teacher_avatar.png',
      dateTime: '2021년 10월 28일',
      content: '단체로 뿅!',
      images: [
        'assets/images/test_album_1.png',
        'assets/images/test_album_2.png',
        'assets/images/test_album_3.png',
        'assets/images/test_album_1.png',
        'assets/images/test_album_2.png',
        'assets/images/test_album_3.png',
        'assets/images/test_album_1.png',
        'assets/images/test_album_2.png',
        'assets/images/test_album_3.png',
        'assets/images/test_album_1.png',
        'assets/images/test_album_2.png',
        'assets/images/test_album_3.png',
      ],
      students: studentList.getRange(0, 4).toList(),
    ),
  ];

  static List<StudentModel> studentList = [
    StudentModel(
      id: '0',
      name: '김재훈',
      profile: 'assets/images/test_student_avatar.png',
      branchName: '판교점',
      className: 'A반',
    ),
    StudentModel(
      id: '1',
      name: '구제연',
      profile: 'assets/images/test_student_avatar.png',
      branchName: '판교점',
      className: 'A반',
    ),
    StudentModel(
      id: '2',
      name: '아이유',
      profile: 'assets/images/test_student_avatar.png',
      branchName: '판교점',
      className: 'A반',
    ),
    StudentModel(
      id: '3',
      name: '어이유',
      profile: 'assets/images/test_student_avatar.png',
      branchName: '판교점',
      className: 'A반',
    ),
    StudentModel(
      id: '4',
      name: '나에유',
      profile: 'assets/images/test_student_avatar.png',
      branchName: '판교점',
      className: 'B반',
    ),
    StudentModel(
      id: '5',
      name: '너에유',
      profile: 'assets/images/test_student_avatar.png',
      branchName: '판교점',
      className: 'B반',
    ),
    StudentModel(
      id: '6',
      name: '휘발유',
      profile: 'assets/images/test_student_avatar.png',
      branchName: '판교점',
      className: 'C반',
    ),
    StudentModel(
      id: '7',
      name: '올리브유',
      profile: 'assets/images/test_student_avatar.png',
      branchName: '판교점',
      className: 'C반',
    )
  ];

  static List<Map<String, dynamic>> familyList = [
    {'phone': '010-1111-1111', 'relation': '아버지'},
    {'phone': '010-2222-2222', 'relation': '할아버지'},
    {'phone': '010-3333-3333', 'relation': '할머니'},
  ];

  static List<UserModel> teacherList = [
    UserModel(
      name: '박소라',
      phone: '010-8765-4321',
      email: 'teacher1@naver.com',
      profile: 'assets/images/test_teacher_avatar.png',
      branchName: ['판교점'],
      className: ['A반', 'B반', 'C반'],
      position: '교사',
    ),
    UserModel(
      name: '임동혁',
      phone: '010-8765-4321',
      email: 'teacher2@naver.com',
      profile: 'assets/images/test_teacher_avatar.png',
      branchName: ['판교점'],
      className: ['A반', 'B반', 'C반'],
      position: '관리자',
    ),
    UserModel(
      name: '나교사',
      phone: '010-8765-4321',
      email: 'teacher3@naver.com',
      profile: 'assets/images/test_teacher_avatar.png',
      branchName: ['보정점'],
      className: ['A반', 'B반', 'C반'],
      position: '교사',
    ),
    UserModel(
      name: '나조교',
      phone: '010-8765-4321',
      email: 'teacher4@naver.com',
      profile: 'assets/images/test_teacher_avatar.png',
      branchName: ['보정점'],
      className: ['A반', 'B반', 'C반'],
      position: '조교',
    ),
  ];

  static List<String> positionList = ['관리자', '교사', '조교'];
}

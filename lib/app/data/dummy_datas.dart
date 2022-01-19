import 'package:ballet_helper/app/data/model/academy_theme.dart';
import 'package:ballet_helper/app/data/model/branch_model.dart';
import 'package:ballet_helper/app/data/model/image_model.dart';
import 'package:ballet_helper/app/data/model/notice_model.dart';
import 'package:ballet_helper/app/data/model/user_model.dart';
import 'package:flutter/material.dart';

import 'model/academy_model.dart';
import 'model/album_model.dart';
import 'model/parent_model.dart';
import 'model/student_model.dart';

class DummyDatas {
  static StudentModel student = StudentModel(
    id: '2',
    name: '아이유',
    profile: 'assets/images/아이3.png',
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
    profile: 'assets/images/선생님.png',
    branchName: ['판교점'],
    className: ['A반', 'B반', 'C반'],
  );
  static UserModel owner = UserModel(
    name: '이호철',
    phone: '010-8765-4321',
    email: 'owner1@gmail.com',
    profile: 'assets/images/원장님.png',
    branchName: ['판교점', '보정점'],
    className: ['A반', 'B반', 'C반'],
  );

  static Map<String, String> academyNames = {
    'ballet': '링키즈 발레',
    'taekwondo': '링키즈 태권도',
    'art': '링키즈 미술',
  };

  static List<AcademyModel> academyList = [
    AcademyModel(
        id: 'ballet',
        name: '링키즈 발레',
        content: '대한민국 대표 발레학원입니다',
        imageUrl: 'assets/images/academy_logo_ballet.png',
        theme: AcademyTheme.fromMap({})),
    AcademyModel(
        id: 'taekwondo',
        name: '링키즈 태권도',
        content: '대한민국 대표 태권도학원입니다',
        imageUrl: 'assets/images/academy_logo_taekwondo.png',
        theme: AcademyTheme.fromMap({
          'primary': Colors.blueAccent.value,
          'primaryDark': Colors.indigo.value,
          'primaryLight': Colors.blue[200]!.value,
          'secondary': Colors.blue[200]!.value,
        })),
    AcademyModel(
        id: 'art',
        name: '링키즈 미술',
        content: '대한민국 대표 미술학원입니다',
        imageUrl: 'assets/images/academy_logo_art.png',
        theme: AcademyTheme.fromMap({
          'primary': Colors.redAccent.value,
          'primaryDark': Colors.red[900]!.value,
          'primaryLight': Colors.redAccent[100]!.value,
          'secondary': Colors.redAccent[100]!.value,
        })),
  ];

  static List<ImageModel> imageList = [
    ImageModel(academyId: 'ballet', uri: 'assets/images/ballet_academy.jpg'),
    ImageModel(academyId: 'ballet', uri: 'assets/images/ballet_academy2.jpg'),
    ImageModel(academyId: 'ballet', uri: 'assets/images/ballet_academy3.jpg'),
    ImageModel(academyId: 'ballet', uri: 'assets/images/ballet_academy4.jpg'),
    ImageModel(academyId: 'ballet', uri: 'assets/images/ballet_academy5.jpg'),
    ImageModel(academyId: 'ballet', uri: 'assets/images/ballet_academy6.jpg'),
    ImageModel(academyId: 'ballet', uri: 'assets/images/ballet_academy7.jpg'),
    ImageModel(academyId: 'ballet', uri: 'assets/images/ballet_academy8.jpg'),
    ImageModel(academyId: 'ballet', uri: 'assets/images/ballet_dancer2.jpg'),
    ImageModel(academyId: 'ballet', uri: 'assets/images/ballet-dancer.jpg'),
    ImageModel(academyId: 'taekwondo', uri: 'assets/images/taekwondo_1.jpg'),
    ImageModel(academyId: 'taekwondo', uri: 'assets/images/taekwondo_2.jpg'),
    ImageModel(academyId: 'taekwondo', uri: 'assets/images/taekwondo_3.jpg'),
    ImageModel(academyId: 'taekwondo', uri: 'assets/images/taekwondo_4.jpg'),
    ImageModel(academyId: 'taekwondo', uri: 'assets/images/taekwondo_5.jpg'),
    ImageModel(academyId: 'taekwondo', uri: 'assets/images/taekwondo_6.jpg'),
    ImageModel(academyId: 'taekwondo', uri: 'assets/images/taekwondo_7.jpg'),
    ImageModel(academyId: 'taekwondo', uri: 'assets/images/taekwondo_8.jpg'),
    ImageModel(academyId: 'taekwondo', uri: 'assets/images/taekwondo_9.jpg'),
    ImageModel(academyId: 'taekwondo', uri: 'assets/images/taekwondo_10.jpg'),
    ImageModel(academyId: 'taekwondo', uri: 'assets/images/taekwondo_11.jpg'),
    ImageModel(academyId: 'taekwondo', uri: 'assets/images/taekwondo_12.jpg'),
    ImageModel(academyId: 'art', uri: 'assets/images/art_1.jpg'),
    ImageModel(academyId: 'art', uri: 'assets/images/art_2.jpg'),
    ImageModel(academyId: 'art', uri: 'assets/images/art_3.jpg'),
    ImageModel(academyId: 'art', uri: 'assets/images/art_4.jpg'),
    ImageModel(academyId: 'art', uri: 'assets/images/art_5.jpg'),
    ImageModel(academyId: 'art', uri: 'assets/images/art_6.jpg'),
    ImageModel(academyId: 'art', uri: 'assets/images/art_7.jpg'),
    ImageModel(academyId: 'art', uri: 'assets/images/art_8.jpg'),
    ImageModel(academyId: 'art', uri: 'assets/images/art_9.jpg'),
    ImageModel(academyId: 'art', uri: 'assets/images/art_10.jpg'),
    ImageModel(academyId: 'art', uri: 'assets/images/art_11.jpg'),
    ImageModel(academyId: 'art', uri: 'assets/images/art_12.jpg'),
    ImageModel(academyId: 'art', uri: 'assets/images/art_13.jpg'),
    ImageModel(academyId: 'art', uri: 'assets/images/art_14.jpg'),
    ImageModel(academyId: 'art', uri: 'assets/images/art_15.jpg'),
    ImageModel(academyId: 'art', uri: 'assets/images/art_16.jpg'),
  ];

  static List<NoticeModel> noticeList = [
    NoticeModel(
        academyId: 'ballet',
        name: '이호철 원장님',
        profile: 'assets/images/원장님.png',
        dateTime: '5분전',
        title: '휴원 안내',
        content: '2021년 12월 12일 휴원합니다.'),
    NoticeModel(
        academyId: 'ballet',
        name: '박소라 선생님',
        profile: 'assets/images/선생님.png',
        dateTime: '2021년 11월 28일',
        title: '휴원 안내',
        content: '2021년 12월 1일 폭설로 인해 휴원합니다.\n다들 따뜻하게 입으세요~ㅎㅎ',
        image: 'assets/images/test_notice_image.jpg'),
  ];

  static List<AlbumModel> albumList = [
    AlbumModel(
      academyId: 'ballet',
      id: '2',
      name: '이호철 원장님',
      profile: 'assets/images/원장님.png',
      dateTime: '5분전',
      content: '허리 뽀샤뽀샤~',
      images: [
        'assets/images/ballet_academy.jpg',
        'assets/images/ballet_academy2.jpg',
      ],
      students: studentList.getRange(2, 6).toList(),
    ),
    AlbumModel(
      academyId: 'ballet',
      id: '1',
      name: '박소라 선생님',
      profile: 'assets/images/선생님.png',
      dateTime: '2021년 11월 28일',
      content: '열심열심',
      images: [
        'assets/images/ballet_academy8.jpg',
      ],
      students: studentList.getRange(6, 8).toList(),
    ),
    AlbumModel(
      academyId: 'ballet',
      id: '0',
      name: '박소라 선생님',
      profile: 'assets/images/선생님.png',
      dateTime: '2021년 10월 28일',
      content: '단체로 뿅!',
      images: [
        'assets/images/ballet_academy4.jpg',
        'assets/images/ballet_academy3.jpg',
        'assets/images/ballet_academy5.jpg',
        'assets/images/ballet_academy6.jpg',
        'assets/images/ballet_academy7.jpg',
        'assets/images/ballet-dancer.jpg',
        'assets/images/test_album_1.png',
        'assets/images/test_album_2.png',
        'assets/images/test_album_3.png',
        'assets/images/ballet_dancer2.jpg',
        // 'assets/images/test_album_2.png',
        // 'assets/images/test_album_3.png',
      ],
      students: studentList.getRange(0, 4).toList(),
    ),
    AlbumModel(
      academyId: 'taekwondo',
      id: '2',
      name: '박소라 선생님',
      profile: 'assets/images/선생님.png',
      dateTime: '2021년 11월 28일',
      content: '힘찬 아이들!',
      images: [
        'assets/images/taekwondo_1.jpg',
        'assets/images/taekwondo_2.jpg',
        'assets/images/taekwondo_3.jpg',
      ],
      students: studentList.getRange(2, 6).toList(),
    ),
    AlbumModel(
      academyId: 'taekwondo',
      id: '1',
      name: '이호철 원장님',
      profile: 'assets/images/원장님.png',
      dateTime: '2021년 11월 1일',
      content: '다들 긴장하고 있네요~ㅎㅎ',
      images: [
        'assets/images/taekwondo_4.jpg',
      ],
      students: studentList.getRange(6, 8).toList(),
    ),
    AlbumModel(
      academyId: 'taekwondo',
      id: '0',
      name: '박소라 선생님',
      profile: 'assets/images/선생님.png',
      dateTime: '2021년 10월 28일',
      content: '다들 수업에 집중하는 모습입니다. 자세가 빨리 잡힌 친구들도 있네요!',
      images: [
        'assets/images/taekwondo_5.jpg',
        'assets/images/taekwondo_6.jpg',
        'assets/images/taekwondo_7.jpg',
        'assets/images/taekwondo_8.jpg',
        'assets/images/taekwondo_9.jpg',
        'assets/images/taekwondo_10.jpg',
        'assets/images/taekwondo_11.jpg',
        'assets/images/taekwondo_12.jpg',
      ],
      students: studentList.getRange(0, 4).toList(),
    ),
    AlbumModel(
      academyId: 'art',
      id: '2',
      name: '박소라 선생님',
      profile: 'assets/images/선생님.png',
      dateTime: '2022년 1월 8일',
      content: '다들 수업에 집중하는 모습입니다. 자세가 빨리 잡힌 친구들도 있네요!',
      images: [
        'assets/images/art_1.jpg',
        'assets/images/art2.jpg',
        'assets/images/art3.jpg',
        'assets/images/art4.jpg',
      ],
      students: studentList.getRange(0, 4).toList(),
    ),
    AlbumModel(
      academyId: 'art',
      id: '1',
      name: '박소라 선생님',
      profile: 'assets/images/선생님.png',
      dateTime: '2021년 11월 20일',
      content: '다들 수업에 집중하는 모습입니다. 자세가 빨리 잡힌 친구들도 있네요!',
      images: [
        'assets/images/art_5.jpg',
        'assets/images/art_6.jpg',
      ],
      students: studentList.getRange(0, 4).toList(),
    ),
    AlbumModel(
      academyId: 'art',
      id: '0',
      name: '이호철 원장님',
      profile: 'assets/images/원장님.png',
      dateTime: '2021년 10월 28일',
      content: '다들 수업에 집중하는 모습입니다. 자세가 빨리 잡힌 친구들도 있네요!',
      images: [
        'assets/images/art_7.jpg',
        'assets/images/art_8.jpg',
        'assets/images/art_9.jpg',
        'assets/images/art_10.jpg',
        'assets/images/art_11.jpg',
        'assets/images/art_12.jpg',
        'assets/images/art_13.jpg',
        'assets/images/art_14.jpg',
        'assets/images/art_15.jpg',
        'assets/images/art_16.jpg',
      ],
      students: studentList.getRange(0, 4).toList(),
    ),
  ];

  static List<StudentModel> studentList = [
    StudentModel(
      id: '0',
      name: '김재훈',
      profile: 'assets/images/아이1.png',
      branchName: '판교점',
      className: 'A반',
    ),
    StudentModel(
      id: '1',
      name: '구제연',
      profile: 'assets/images/아이2.png',
      branchName: '판교점',
      className: 'A반',
    ),
    StudentModel(
      id: '2',
      name: '아이유',
      profile: 'assets/images/아이3.png',
      branchName: '판교점',
      className: 'A반',
    ),
    StudentModel(
      id: '3',
      name: '어이유',
      profile: 'assets/images/아이4.png',
      branchName: '판교점',
      className: 'A반',
    ),
    StudentModel(
      id: '4',
      name: '나에유',
      profile: 'assets/images/아이5.png',
      branchName: '판교점',
      className: 'B반',
    ),
    StudentModel(
      id: '5',
      name: '너에유',
      profile: 'assets/images/아이6.png',
      branchName: '판교점',
      className: 'B반',
    ),
    StudentModel(
      id: '6',
      name: '휘발유',
      profile: 'assets/images/아이1.png',
      branchName: '판교점',
      className: 'C반',
    ),
    StudentModel(
      id: '7',
      name: '올리브유',
      profile: 'assets/images/아이2.png',
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
      profile: 'assets/images/선생님.png',
      branchName: ['판교점'],
      className: ['A반', 'B반', 'C반'],
      position: '교사',
    ),
    UserModel(
      name: '임동혁',
      phone: '010-8765-4321',
      email: 'teacher2@naver.com',
      profile: 'assets/images/선생님.png',
      branchName: ['판교점'],
      className: ['A반', 'B반', 'C반'],
      position: '관리자',
    ),
    UserModel(
      name: '나교사',
      phone: '010-8765-4321',
      email: 'teacher3@naver.com',
      profile: 'assets/images/선생님.png',
      branchName: ['보정점'],
      className: ['A반', 'B반', 'C반'],
      position: '교사',
    ),
    UserModel(
      name: '나조교',
      phone: '010-8765-4321',
      email: 'teacher4@naver.com',
      profile: 'assets/images/선생님.png',
      branchName: ['보정점'],
      className: ['A반', 'B반', 'C반'],
      position: '조교',
    ),
  ];

  static List<String> positionList = ['관리자', '교사', '조교'];

  static List<BranchModel> branchList = [
    BranchModel(
      name: '판교점',
      address: '경기도 성남시 분당구 대왕판교로 670 (유스페이스2) 310호',
      teachers: teacherList.getRange(0, 2).toList(),
      classList: ['A반', 'B반', 'C반'],
      studentCount: studentList.length,
    ),
    BranchModel(
      name: '보정점',
      address: '경기도 용인시 기흥구 보정로 87',
      teachers: teacherList.getRange(2, 4).toList(),
      classList: ['A반', 'B반', 'C반'],
      studentCount: 0,
    ),
  ];
}

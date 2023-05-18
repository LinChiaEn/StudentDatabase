import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_database/main.dart';

String answer = '';

final String tableStudent = 'student';
final String colStudentID = 'id';
final String colNameS = 'name';
final String colGenderS = 'gender';
final String colAgeS = 'age';
final String colSchoolS = 'school';

// class StudentDB {
//   int? id;
//   String? nameS;
//   int? ageS;
//   String? genderS;
//   String? schoolS;

//   StudentDB();
// }

final String tableTeacher = 'teacher';
final String colTeacherID = 'id';
final String colNameT = 'name';
final String colGenderT = 'gender';
final String colSubjectT = 'subject';

// class TeacherDB {
//   int? id;
//   String? nameT;
//   String? genderT;
//   String? subjectT;

//   TeacherDB();
// }

final String tableClass = 'class';
final String colClassID = 'class';
final String colLocatin = 'location';
final String colMentorID = 'mentorID';

// class ClassDB {
//   String? id;
//   String? location;
//   int? menterID;

//   ClassDB();
// }

final String tableActivity = 'activity';
final String colNameA = 'name';
final String colTimeA = 'time';
final String colLocationA = 'location';
final String colAttendA = 'attend';

// class ActivityDB {
//   String? nameA;
//   String? timeA;
//   String? locationA;
//   String? attendA;

//   ActivityDB();
// }

final String tableScore = 'score';
final String colPaperID = 'id';
final String colScore = 'score';
final String colStudent_id = 'studentID';
final String colTeacher_id = 'teacherID';
final String colSubject_paper = 'subject';

// class ScoreDB {
//   int? id;
//   int? score;
//   int? student_id;
//   int? teacher_id;
//   String? subject_paper;

//   ScoreDB();
// }

class StudentDBProvider {
  Database? dbStudent;
  Database? dbTeacher;
  Database? dbClass;
  Database? dbActivity;
  Database? dbScore;

  Future openStudent() async {
    var docDir = await getApplicationDocumentsDirectory();
    var path = join(docDir.path, "student.db");
    dbStudent = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableStudent ( 
  $colStudentID integer primary key, 
  $colNameS text not null,
  $colAgeS integer not null,
  $colGenderS text not null,
  $colSchoolS text not null)
''');
    });
  }

  Future openTeacher() async {
    var docDir = await getApplicationDocumentsDirectory();
    var path = join(docDir.path, "teacher.db");
    dbTeacher = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableTeacher ( 
  $colTeacherID integer primary key, 
  $colNameT text not null,
  $colGenderT text not null,
  $colSubjectT text not null)
''');
    });
  }

  Future openClass() async {
    var docDir = await getApplicationDocumentsDirectory();
    var path = join(docDir.path, "Class.db");
    dbClass = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableClass ( 
  $colClassID text primary key, 
  $colLocatin text not null,
  $colMentorID integer not null)
''');
    });
  }

  Future openActivity() async {
    var docDir = await getApplicationDocumentsDirectory();
    var path = join(docDir.path, "Activity.db");
    dbActivity = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableActivity ( 
  $colNameA text primary key, 
  $colTimeA text not null,
  $colLocationA text not null,
  $colAttendA text not null)
''');
    });
  }

  Future openScore() async {
    var docDir = await getApplicationDocumentsDirectory();
    var path = join(docDir.path, "Score.db");
    dbScore = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableScore ( 
  $colPaperID integer primary key, 
  $colScore integer not null,
  $colStudent_id integer not null,
  $colTeacher_id integer not null,
  $colSubject_paper text not null)
''');
    });
  }

  void insert(String str) async {
    if (str.contains("student"))
      await dbStudent!.rawInsert('$str');
    else if (str.contains("teacher"))
      await dbTeacher!.rawInsert('$str');
    else if (str.contains("class"))
      await dbClass!.rawInsert('$str');
    else if (str.contains("activity"))
      await dbActivity!.rawInsert('$str');
    else if (str.contains("score")) await dbScore!.rawInsert('$str');
  }

  void delete_1(String str) async {
    if (str.contains("student"))
      await dbStudent!.rawDelete('$str');
    else if (str.contains("teacher"))
      await dbTeacher!.rawDelete('$str');
    else if (str.contains("class"))
      await dbClass!.rawDelete('$str');
    else if (str.contains("activity"))
      await dbActivity!.rawDelete('$str');
    else if (str.contains("score")) await dbScore!.rawDelete('$str');
  }

  void delete(String str) async {
    if (str.contains("student"))
      await dbStudent!.rawDelete('$str');
    else if (str.contains("teacher"))
      await dbTeacher!.rawDelete('$str');
    else if (str.contains("class"))
      await dbClass!.rawDelete('$str');
    else if (str.contains("activity"))
      await dbActivity!.rawDelete('$str');
    else if (str.contains("score")) await dbScore!.rawDelete('$str');
  }

  void update(String str) async {
    if (str.contains("student"))
      await dbStudent!.rawUpdate('$str');
    else if (str.contains("teacher"))
      await dbTeacher!.rawUpdate('$str');
    else if (str.contains("class"))
      await dbClass!.rawUpdate('$str');
    else if (str.contains("activity"))
      await dbActivity!.rawUpdate('$str');
    else if (str.contains("score")) await dbScore!.rawUpdate('$str');
  }

  Future<String> Count(String str) async {
    var x;
    if (str.contains("student"))
      x = await dbStudent!.rawQuery('$str');
    else if (str.contains("teacher"))
      x = await dbTeacher!.rawQuery('$str');
    else if (str.contains("class"))
      x = await dbClass!.rawQuery('$str');
    else if (str.contains("activity"))
      x = await dbActivity!.rawQuery('$str');
    else if (str.contains("score")) x = await dbScore!.rawQuery('$str');

    int? count = Sqflite.firstIntValue(x);
    return count.toString();
  }

  Future<String> INStudent(String str) async {
    List<Map> result = await dbStudent!.rawQuery('$str');
    String answer = '';
    result.forEach((row) {
      print(row);
      answer += row.toString();
      answer += '\n\n';
    });
    return answer;
  }

  Future<String> INTeacher(String str) async {
    List<Map> result = await dbTeacher!.rawQuery('$str');
    String answer = '';
    result.forEach((row) {
      print(row);
      answer += row.toString();
      answer += '\n\n';
    });
    return answer;
  }

  Future<String> INClass(String str) async {
    List<Map> result = await dbClass!.rawQuery('$str');
    String answer = '';
    result.forEach((row) {
      print(row);
      answer += row.toString();
      answer += '\n\n';
    });
    return answer;
  }

  Future<String> INScore(String str) async {
    List<Map> result = await dbScore!.rawQuery('$str');
    String answer = '';
    result.forEach((row) {
      print(row);
      answer += row.toString();
      answer += '\n\n';
    });
    return answer;
  }

  Future<String> INActivity(String str) async {
    List<Map> result = await dbActivity!.rawQuery('$str');
    String answer = '';
    result.forEach((row) {
      print(row);
      answer += row.toString();
      answer += '\n\n';
    });
    return answer;
  }

  Future close() async => dbStudent!.close();
}

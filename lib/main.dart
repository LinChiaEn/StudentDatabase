import 'package:flutter/material.dart';
import 'db.dart';

String answer = '';
String data = '';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) => Scaffold(
        // Global GestureDetector that will dismiss the keyboard
        body: GestureDetector(
          onTap: () {
            hideKeyboard(context);
          },
          child: child,
        ),
      ),
      routes: {
        '/result': (context) => ResultInPage(),
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

String value = "0";

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController QueryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = new TextEditingController();

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Container(
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "查詢工具  ",
                          style:
                              const TextStyle(fontSize: 20, color: Colors.blue),
                        )),
                    Container(
                      alignment: Alignment.center,
                      // ignore: unnecessary_new
                      child: new DropdownButton(
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "SQLite",
                              style: TextStyle(
                                  color: value == "0"
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                            value: "0",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "SELECT-FROM-WHERE",
                              style: TextStyle(
                                  color: value == "1"
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                            value: "1",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "DELETE",
                              style: TextStyle(
                                  color: value == "2"
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                            value: "2",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "INSERT",
                              style: TextStyle(
                                  color: value == "3"
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                            value: "3",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "UPDATE",
                              style: TextStyle(
                                  color: value == "4"
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                            value: "4",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "IN",
                              style: TextStyle(
                                  color: value == "5"
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                            value: "5",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "NOT IN",
                              style: TextStyle(
                                  color: value == "6"
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                            value: "6",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "EXISTS",
                              style: TextStyle(
                                  color: value == "7"
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                            value: "7",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "NOT EXISTS",
                              style: TextStyle(
                                  color: value == "8"
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                            value: "8",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "COUNT",
                              style: TextStyle(
                                  color: value == "9"
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                            value: "9",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "SUM",
                              style: TextStyle(
                                  color: value == "10"
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                            value: "10",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "MAX",
                              style: TextStyle(
                                  color: value == "11"
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                            value: "11",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "MIN",
                              style: TextStyle(
                                  color: value == "12"
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                            value: "12",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "AVG",
                              style: TextStyle(
                                  color: value == "13"
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                            value: "13",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "HAVING",
                              style: TextStyle(
                                  color: value == "14"
                                      ? Colors.black
                                      : Colors.grey),
                            ),
                            value: "14",
                          ),
                        ],
                        hint: new Text("提示資訊"), // 當沒有初始值時顯示
                        onChanged: (selectValue) {
                          setState(() {
                            value = selectValue.toString();
                            print(value);
                            if (value == '0') QueryController.text = '';
                            if (value == '1')
                              QueryController.text =
                                  'SELECT * FROM student WHERE gender=\'boy\'';
                            if (value == '2')
                              QueryController.text =
                                  'DELETE FROM student WHERE id = 10';
                            if (value == '3')
                              QueryController.text =
                                  'INSERT INTO student VALUES(10,"JASMINE",15,"girl","303")';
                            if (value == '4')
                              QueryController.text =
                                  'UPDATE score SET score=90 WHERE id=1';
                            if (value == '5')
                              QueryController.text =
                                  'SELECT name FROM teacher WHERE subject IN ("English","Chinese")';
                            if (value == '6')
                              QueryController.text =
                                  'SELECT name FROM teacher WHERE subject NOT IN ("English","Chinese")';
                            ;
                            if (value == '7')
                              QueryController.text =
                                  'SELECT name FROM activity WHERE EXISTS(SELECT * FROM activity WHERE time="2022/08/25")';
                            if (value == '8')
                              QueryController.text =
                                  'SELECT name FROM activity WHERE NOT EXISTS(SELECT * FROM activity WHERE location="2022/08/25")';
                            if (value == '9')
                              QueryController.text =
                                  'SELECT COUNT (*) from  activity';
                            if (value == '10')
                              QueryController.text =
                                  'SELECT SUM(score) FROM score WHERE subject="Chinese"';
                            if (value == '11')
                              QueryController.text =
                                  'SELECT MAX(score) FROM score WHERE subject="Chinese"';
                            if (value == '12')
                              QueryController.text =
                                  'SELECT MIN(score) FROM score WHERE subject="Chinese"';
                            if (value == '13')
                              QueryController.text =
                                  'SELECT AVG(score) FROM score WHERE subject="Chinese"';
                            if (value == '14')
                              QueryController.text =
                                  'SELECT * FROM score WHERE subject="Chinese" GROUP BY score HAVING score>50';
                          });
                        },
                        value: value, // 設定初始值，要與列表中的value是相同的
                        elevation: 10, //設定陰影
                        style: new TextStyle(
                            //設定文字框裡面文字的樣式
                            color: Colors.blue,
                            fontSize: 15),
                        iconSize: 30, //設定三角標icon的大小
                        underline: Container(
                          height: 1,
                          color: Colors.blue,
                        ), // 下劃線
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 200,
                  child: Row(children: [
                    const Flexible(
                        child: Text(
                      "查詢關鍵字  ",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    )),
                    Flexible(
                      child: buildQueryField("輸入指令"),
                    ),
                  ])),
              Container(
                  child: RaisedButton(
                      color: Colors.white54,
                      child: const Text("填寫完成"),
                      onPressed: () async {
                        var studentPro = new StudentDBProvider();
                        await studentPro.openStudent();
                        await studentPro.openTeacher();
                        await studentPro.openClass();
                        await studentPro.openScore();
                        await studentPro.openActivity();
                        if (value == '0') {
                          if (QueryController.text.contains('DELETE'))
                            value = '2';
                          else if (QueryController.text.contains('INSERT'))
                            value = '3';
                          else if (QueryController.text.contains('UPDATE'))
                            value = '4';
                          else if (QueryController.text.contains('COUNT'))
                            value = '9';
                        }
                        //DELETE
                        if (value == '2') {
                          studentPro.delete_1(QueryController.text);
                          if (QueryController.text.contains('student')) {
                            data = await studentPro.INStudent(
                                'SELECT * FROM student');
                          } else if (QueryController.text.contains('teacher')) {
                            data = await studentPro.INTeacher(
                                'SELECT * FROM teacher');
                          } else if (QueryController.text.contains('class')) {
                            data =
                                await studentPro.INClass('SELECT * FROM class');
                          } else if (QueryController.text
                              .contains('activity')) {
                            data = await studentPro.INActivity(
                                'SELECT * FROM activity');
                          } else if (QueryController.text.contains('score')) {
                            data =
                                await studentPro.INScore('SELECT * FROM score');
                          }
                        }
                        //INSERT
                        else if (value == '3') {
                          studentPro.insert(QueryController.text);
                          if (QueryController.text.contains('student')) {
                            data = await studentPro.INStudent(
                                'SELECT * FROM student');
                          } else if (QueryController.text.contains('teacher')) {
                            data = await studentPro.INTeacher(
                                'SELECT * FROM teacher');
                          } else if (QueryController.text.contains('class')) {
                            data =
                                await studentPro.INClass('SELECT * FROM class');
                          } else if (QueryController.text.contains('score')) {
                            data =
                                await studentPro.INScore('SELECT * FROM score');
                          } else if (QueryController.text
                              .contains('activity')) {
                            data = await studentPro.INActivity(
                                'SELECT * FROM activity');
                          }
                        }
                        //UPDATE
                        else if (value == '4') {
                          studentPro.update(QueryController.text);
                          if (QueryController.text.contains('student')) {
                            data = await studentPro.INStudent(
                                'SELECT * FROM student');
                          } else if (QueryController.text.contains('teacher')) {
                            data = await studentPro.INTeacher(
                                'SELECT * FROM teacher');
                          } else if (QueryController.text.contains('class')) {
                            data =
                                await studentPro.INClass('SELECT * FROM class');
                          } else if (QueryController.text.contains('score')) {
                            data =
                                await studentPro.INScore('SELECT * FROM score');
                          } else if (QueryController.text
                              .contains('activity')) {
                            data = await studentPro.INActivity(
                                'SELECT * FROM activity');
                          }
                        }
                        //COUNT
                        else if (value == '9') {
                          answer = await studentPro.Count(QueryController.text);
                          if (QueryController.text.contains('student')) {
                            data = await studentPro.INStudent(
                                'SELECT * FROM student');
                          } else if (QueryController.text.contains('teacher')) {
                            data = await studentPro.INTeacher(
                                'SELECT * FROM teacher');
                          } else if (QueryController.text.contains('class')) {
                            data =
                                await studentPro.INClass('SELECT * FROM class');
                          } else if (QueryController.text.contains('score')) {
                            await studentPro.INScore('SELECT * FROM score');
                          } else if (QueryController.text
                              .contains('activity')) {
                            data = await studentPro.INActivity(
                                'SELECT * FROM activity');
                          }
                        } else {
                          if (QueryController.text.contains('student')) {
                            answer = await studentPro.INStudent(
                                QueryController.text);
                            data = await studentPro.INStudent(
                                'SELECT * FROM student');
                          } else if (QueryController.text.contains('teacher')) {
                            answer = await studentPro.INTeacher(
                                QueryController.text);
                            data = await studentPro.INTeacher(
                                'SELECT * FROM teacher');
                          } else if (QueryController.text.contains('class')) {
                            answer =
                                await studentPro.INClass(QueryController.text);
                            data =
                                await studentPro.INClass('SELECT * FROM class');
                          } else if (QueryController.text.contains('score')) {
                            answer =
                                await studentPro.INScore(QueryController.text);
                            data =
                                await studentPro.INScore('SELECT * FROM score');
                          } else if (QueryController.text
                              .contains('activity')) {
                            answer = await studentPro.INActivity(
                                QueryController.text);
                            data = await studentPro.INActivity(
                                'SELECT * FROM activity');
                          }
                        }

                        Navigator.popAndPushNamed(context, '/result');
                      }))
            ],
          ),
        ));
  }

  Widget buildQueryField(txt) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: TextField(
        maxLines: 10, //最多多少行
        minLines: 1, //最少多少行
        controller: QueryController, // 為了獲得TextField中的value
        decoration: InputDecoration(
          fillColor: Colors.white,
          // 背景顏色，必須結合filled: true,才有效
          filled: true,
          // 重點，必須設定為true，fillColor才有效
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)), // 設定邊框圓角弧度
            borderSide: BorderSide(
              color: Colors.black87, // 設定邊框的顏色
              width: 2.0, // 設定邊框的粗細
            ),
          ),
          // when user choose the TextField
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.red, // 設定邊框的顏色
            width: 2, // 設定邊框的粗細
          )),
          hintText: txt,
          // 提示 文字
        ),
      ),
    );
  }
}

class ResultInPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('個人資料'),
          backgroundColor: Color(0xFF18b6b2),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
            height: 75,
            width: 400,
            child: Text(
              "結果:",
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
          ),
          Container(
            child: Text(
              answer,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
          Container(
            height: 75,
            width: 400,
            child: Text(
              "資料庫:",
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
          ),
          Container(
            child: Text(
              data,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
          RaisedButton(
              child: Text("返回"),
              onPressed: () async {
                //print("p:" + pName + pHospital);
                answer = '';
                data = '';
                value = '0';
                Navigator.popAndPushNamed(context, '/');
              }),
        ])));
  }
}

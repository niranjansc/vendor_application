import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_vendor/Route/routeNames.dart';
import 'package:new_vendor/homescreen.dart';
import 'package:new_vendor/homescreen01.dart';
import 'package:new_vendor/dopa_glb.dart' as glb;
import 'package:http/http.dart' as http;

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

const List<String> list = <String>[
  'SELECTED ZONE',
  'Goa',
  'Belgaum',
  'Hubli',
];

TextEditingController UsrId_Con = TextEditingController();
TextEditingController Pswd_Con = TextEditingController();

class _loginState extends State<login> {
  @override
  void initState() {
    // TODO: implement initState
    ZoneAsync();
  }

  String dropdownValue = list.first;
  Widget buildcombobox() {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
          ]),
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            value: dropdownValue,
            icon: Icon(
              Icons.arrow_drop_down_outlined,
              size: 35,
            ),
            elevation: 20,
            style: TextStyle(color: Colors.black),
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget buildUserID() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'User ID',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            controller: UsrId_Con,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff5ac18e),
                ),
                hintText: 'User ID',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            obscureText: true,
            controller: Pswd_Con,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff5ac18e),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        )
      ],
    );
  }

  Widget buildForgotpassBtn() {
    return Container(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
            onPressed: () {
              print("Forgot password pressed");
            },
            child: Text(
              'Forgot password?',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )));
  }

  bool isRemberMe = false;
  Widget buildRemeberCb() {
    return Container(
      height: 20,
      child: Row(children: <Widget>[
        Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: isRemberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  isRemberMe = value!;
                });
              },
            )),
        Text(
          'Rember me',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }

  Widget buildLoginBtn() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            print('login tap');
            String usrId = UsrId_Con.text;
            String pswd = Pswd_Con.text;
            if (usrId == "123" && pswd == "321") {
              print("crt");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => homeScreen()));
            }
          },
          child: Text('LOGIN',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dopanet Vendor",
          style: TextStyle(color: Colors.black),
        ),
        shadowColor: Colors.green,
        backgroundColor: Colors.greenAccent[100],
        foregroundColor: Colors.transparent,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0x665ac18e),
                      Color(0x995ac18e),
                      Color(0xcc5ac18e),
                      Color(0xff5ac18e),
                    ])),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            print('zone tap');
                            ZoneAsync();
                          },
                          child: Icon(
                            Icons.refresh,
                            size: 50,
                          )),
                      Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      buildcombobox(),
                      SizedBox(height: 50),
                      buildUserID(),
                      SizedBox(
                        height: 20,
                      ),
                      buildPassword(),
                      buildForgotpassBtn(),
                      buildRemeberCb(),
                      buildLoginBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // ================
  bool _showData = false, _isLoading = true, isCached = false;
  ZoneAsync() async {
    String url = glb.endpoint;
//print('TimeTable async url:$url');
    print('TimeTable tlv:: $url');
    final Map dict = {
      "tlvNo": "210",
      "uid": "-1",
      "authToken": "AABBCCDD",
    };
    print('tlv = $dict');

    try {
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            "Accept": "application/json",
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(dict));
      print(' res = ${response.body}');
      print(response.statusCode);
      if (response.statusCode == 200) {
        var res = response.body;
        if (res.contains("ErrorCode#2")) {
          print('error2');

          setState(() {
            _isLoading = false;
          });

          //        glb.showToast('No new notifications');
          return;
        } else if (res.contains("ErrorCode#8")) {
          glb.showToast('Something Went Wrong');
          return;
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("Subject:$SubjectMap");
            var pname = SubjectMap['pname'];
            var id = SubjectMap['id'];
            var uid = SubjectMap['uid'];

            // print('hc== ${Hc}');

            List pname_list = glb.strToLst(pname);
            List id_list = glb.strToLst(id);
            List uid_list = glb.strToLst(uid);

            // print('$pname_list');

            print(id_list);
            print(uid_list);

            glb.pnameLst = pname_list;
            glb.AdIdLst = id_list;
            glb.AdUidLst = uid_list;

            print('siccess');
            print('ad id = ${glb.AdIdLst.length}');

            // print(lib);

            //var timetblid = SubjectMap['3'];

            print('pname$pname');
            print('id==$id');
            print('uid==$uid');
          } catch (e) {
            print(e);
            return "Failed";
          }
        }
      }
    } catch (e) {
      print("handle Exception here::$e");
      setState(() {
        _isLoading = false;
      });
      if (e.toString().contains("Connection refused")) {
        glb.showToast('No Internet Connection Found / Server is Down');
      } else if (e.toString().contains("Operation timed out")) {
        glb.showToast('Operation Timed Out');
      }
    }

    return "Success";
  }
  // ====================
}

















































































































































































// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class login extends StatefulWidget {
//   const login({super.key});

//   @override
//   State<login> createState() => _loginState();
// }

// class _loginState extends State<login> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(25),
//         child: Center(
//           child: Column(
//             children: [
//               SizedBox(height: 40),
//               Icon(Icons.person_outlined, color: Colors.grey[300], size: 140),
//               SizedBox(height: 13),
//               Text(
//                 "Wellcome Back",
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 "sign in to continue",
//                 style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.grey[400]),
//               ),
//               SizedBox(height: 30),
//               Container(
//                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   child: TextFormField(
//                     style: TextStyle(
//                         color: Theme.of(context).primaryColor,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 22),
//                     decoration: InputDecoration(
//                         border: InputBorder.none,
//                         prefixIcon: Icon(
//                           Icons.mail,
//                           color: Colors.green[300],
//                           size: 30,
//                         ),
//                         labelText: "EMAIL",
//                         labelStyle: TextStyle(
//                             fontSize: 18,
//                             color: Colors.green[300],
//                             fontWeight: FontWeight.w800)),
//                   )),
//               SizedBox(
//                 height: 10,
//               ),
//               Container(
//                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   child: TextFormField(
//                     obscureText: true,
//                     style: TextStyle(
//                         color: Theme.of(context).primaryColor,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 22),
//                     decoration: InputDecoration(
//                         border: InputBorder.none,
//                         prefixIcon: Icon(
//                           Icons.lock,
//                           color: Colors.green[300],
//                           size: 30,
//                         ),
//                         labelText: "Password",
//                         labelStyle: TextStyle(
//                             fontSize: 18,
//                             color: Colors.green[300],
//                             fontWeight: FontWeight.w800)),
//                   )),
//               Row(
//                 children: [
//                   TextButton(
//                     onPressed: () {},
//                     child: Text("Forogt password"),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

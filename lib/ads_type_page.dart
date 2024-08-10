import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_vendor/dopa_glb.dart' as glb;
import 'package:http/http.dart' as http;

class ads_type_page extends StatefulWidget {
  const ads_type_page({super.key});

  @override
  State<ads_type_page> createState() => _ads_type_pageState();
}

List<String> adstyp = <String>['Special', 'Regular'];
List<String> specialTyp = <String>['Super', 'Campus', 'primer'];
List<String> Tags = <String>['sup'];
List<String> myLst = ['Select subtag'];

bool Spl_vis = false;
bool tags_vis = false;

class _ads_type_pageState extends State<ads_type_page> {
  String selectedItem1 = adstyp.first;
  String selectedItem2 = specialTyp.first;
  String selectedItem3 = myLst.first;
  @override
  void initState() {
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ads Type'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              children: [
                DropdownButton<String>(
                  value: selectedItem1,
                  onChanged: (String? value) {
                    setState(() {
                      selectedItem1 = value!;
                      if (selectedItem1 == "Special") {
                        setState(() {
                          glb.spacial = "1";
                        });
                      } else if (selectedItem1 == "Regular") {
                        glb.spacial = "0";
                        setState(() {
                          glb.spacial = "0";
                        });
                      }
                    });
                  },
                  selectedItemBuilder: (BuildContext context) {
                    return adstyp.map<Widget>((String item) {
                      return Container(
                        alignment: Alignment.centerLeft,
                        constraints: const BoxConstraints(minWidth: 100),
                        child: Text(
                          item,
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                        ),
                      );
                    }).toList();
                  },
                  items: adstyp.map<DropdownMenuItem<String>>((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      Select_adstype();
                    },
                    child: Text('Button'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Visibility(
              visible: Spl_vis,
              child: Row(
                children: [
                  DropdownButton<String>(
                    value: selectedItem2,
                    onChanged: (String? value) {
                      setState(() => selectedItem2 = value!);
                      setState(() {
                        tags_vis = true;
                        if (selectedItem2 == 'Super') {
                          glb.tagtype = 'supertag';
                          glb.subTag = 'Super';
                        } else if (selectedItem2 == 'Campus') {
                          glb.tagtype = 'campustag';
                          glb.subTag = 'Campus';
                        } else if (selectedItem2 == 'primer') {
                          glb.tagtype = 'onpremtag';
                          glb.subTag = 'Premier';
                        }
                      });
                      Select_tags1();
                    },
                    selectedItemBuilder: (BuildContext context) {
                      return specialTyp.map<Widget>((String item) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          constraints: const BoxConstraints(minWidth: 100),
                          child: Text(
                            item,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600),
                          ),
                        );
                      }).toList();
                    },
                    items:
                        specialTyp.map<DropdownMenuItem<String>>((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {
                        Select_tags();
                        print('123');
                      },
                      child: Text('Button'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
            ),
            child: Visibility(
              visible: tags_vis,
              child: Row(
                children: [
                  DropdownButton<String>(
                    value: selectedItem3,
                    onChanged: (String? value) {
                      glb.subTagType = value!;
                      setState(() => selectedItem3 = value!);
                    },
                    selectedItemBuilder: (BuildContext context) {
                      return myLst.map<Widget>((String item) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          // constraints: const BoxConstraints(minWidth: 100),
                          child: Text(
                            item,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600),
                          ),
                        );
                      }).toList();
                    },
                    items: myLst.map<DropdownMenuItem<String>>((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: tags_vis,
            child: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  if (glb.subTagType == 'Select subtag') {
                    glb.showToast('Select Subtag type');
                  } else {
                    Select_tags_submit();
                  }
                },
                child: Text('Button'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isLoading = true;
  Select_adstype() async {
    print('Select_adstype');
    String url = glb.endpoint;

    print('TimeTable tlv:: $url');
    print(glb.spacial);
    print(glb.AdID);

    final Map dict = {
      "tlvNo": "101",
      "pid": glb.AdID,
      "special": glb.spacial,
      "key": "28",
      "uid": "-1",
      "authToken": "AABBCCDD"
    };
    print(dict);

    try {
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            "Accept": "application/json",
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(dict));
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var res = response.body;
        print('res === $res');
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
        } else if (res.contains("ErrorCode#0")) {
          print("Done");
          glb.Done_popup(context);
          setState(() {
            if (glb.spacial == "1") {
              Spl_vis = true;
              tags_vis = true;
            } else {
              Spl_vis = false;
              tags_vis = false;
            }
          });
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("json str:$SubjectMap");
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
      } else if (e.toString().contains(
          "Failed host lookup: 'container-isp-suite.ubk7f2p444mio.ap-south-1.cs.amazonlightsail.com'")) {
        glb.showToast('No Internet Connection');
      }
    }

    return "Success";
  }

// ====================================================================

  Select_tags() async {
    print('Select_tags');
    String url = glb.endpoint;

    print('TimeTable tlv:: $url');
    print(glb.tag);
    print(glb.AdID);
    var key = "";
    var tag = "";
    if (glb.tagtype == 'supertag') {
      key = "31";
      tag = 'Super';
    } else if (glb.tagtype == 'campustag') {
      key = "32";
      tag = 'Campus';
    } else if (glb.tagtype == 'onpremtag') {
      key = "33";
      tag = 'Primer';
    }
    tag = glb.tagtype;
    String tag_val = "Sample";
    print(key);
    print("tag::" + tag);
    final Map dict = {
      "tlvNo": "101",
      "pid": glb.AdID,
      tag: tag_val,
      "tagtype": tag,
      "key": key,
      "uid": "-1",
      "authToken": "AABBCCDD"
    };
    print('n dict $dict');
    try {
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            "Accept": "application/json",
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(dict));
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var res = response.body;
        print('res === $res');
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
        } else if (res.contains("ErrorCode#0")) {
          print("Done");
          glb.Done_popup(context);
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("json str:$SubjectMap");
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
      } else if (e.toString().contains(
          "Failed host lookup: 'container-isp-suite.ubk7f2p444mio.ap-south-1.cs.amazonlightsail.com'")) {
        glb.showToast('No Internet Connection');
      }
    }

    return "Success";
  }

  // =======================================================================

  Select_tags1() async {
    print('Select_tags1');
    String url = glb.endpoint;

    print('TimeTable tlv:: $url');

    var tag = "";
    String type = glb.tag;

    print("tag::" + glb.tagtype);
    final Map dict = {
      "tlvNo": "43",
      // "pid": glb.AdID,
      "key": "3",
      "Type": glb.subTag,
      "uid": "-1",
      "authToken": "AABBCCDD"
    };
    print('pres $dict');

    try {
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            "Accept": "application/json",
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(dict));
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var res = response.body;
        print('res === $res');
        print('stsCode = ${response.statusCode}');
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
        } else if (res.contains("ErrorCode#0")) {
          print("Done");
          glb.Done_popup(context);
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("json str:$SubjectMap");
            var subtags = SubjectMap['name'];
            print('subtags = $subtags');
            List sbtags = glb.strToLst(subtags);
            print('+ > $sbtags');
            setState(() {
              selectedItem3 = myLst.first;
              glb.subTags_lst.clear();
              myLst.removeRange(1, myLst.length);
              myLst = ['Select subtag'];
              for (int i = 0; i < sbtags.length; i++) {
                glb.subTags_lst.add(sbtags[i]);
                myLst.add(glb.subTags_lst[i].toString());
              }
              glb.subTags_lst.add(glb.strToLst(subtags));
              print('dn');
            });
            print('lst ==> ${glb.subTags_lst}');
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
      } else if (e.toString().contains(
          "Failed host lookup: 'container-isp-suite.ubk7f2p444mio.ap-south-1.cs.amazonlightsail.com'")) {
        glb.showToast('No Internet Connection');
      }
    }

    return "Success";
  }

  Select_tags_submit() async {
    print('Select_tags1');
    String url = glb.endpoint;

    print('TimeTable tlv:: $url');

    print("sub tag type ::" + glb.subTagType);
    final Map dict = {
      "tlvNo": "101",
      // "pid": glb.AdID,
      "key": "33a",
      "Type": glb.subTagType,
      "uid": "-1",
      "authToken": "AABBCCDD"
    };
    print('pres $dict');

    try {
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            "Accept": "application/json",
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(dict));
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var res = response.body;
        print('res === $res');
        print('stsCode = ${response.statusCode}');
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
        } else if (res.contains("ErrorCode#0")) {
          print("Done");
          glb.Done_popup(context);
        } else {
          try {
            Map<String, dynamic> SubjectMap = json.decode(response.body);
            print("json str:$SubjectMap");
            var subtags = SubjectMap['name'];
            print('subtags = $subtags');
            List sbtags = glb.strToLst(subtags);
            print('+ > $sbtags');
            setState(() {
              glb.subTags_lst.clear();
              myLst.clear();
              myLst = ['Select subtag'];
              for (int i = 0; i < sbtags.length; i++) {
                glb.subTags_lst.add(sbtags[i]);
                myLst.add(glb.subTags_lst[i].toString());
              }
              glb.subTags_lst.add(glb.strToLst(subtags));
              print('dn');
            });
            print('lst ==> ${glb.subTags_lst}');
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
      } else if (e.toString().contains(
          "Failed host lookup: 'container-isp-suite.ubk7f2p444mio.ap-south-1.cs.amazonlightsail.com'")) {
        glb.showToast('No Internet Connection');
      }
    }

    return "Success";
  }
}

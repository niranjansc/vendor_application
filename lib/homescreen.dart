import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:new_vendor/LD_mode.dart';
import 'package:new_vendor/dark_mode_provider.dart' as dm;
import 'package:new_vendor/dopa_glb.dart';
import 'package:new_vendor/languages.dart';
import 'package:new_vendor/lst_Ads.dart';
import 'package:new_vendor/ads_creation.dart';
import 'package:new_vendor/reports.dart';
import 'package:new_vendor/support.dart';
// import 'package:new_ vendor/vendor_aunthatication_list.dart';
import 'package:new_vendor/vendor_aunthatication_list.dart';
import 'package:new_vendor/widgets/custom_size.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    double widths = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("VENDOR CONTROL PANEL"),
      ),
      body: Column(
        children: [
          InkWell(
              onTap: () {
                print('height= $height');
                print('width = $widths ');
                print(customSize.h120);
              },
              child: Icon(Icons.home)),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const profile()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 241, 241, 241),
                        borderRadius: BorderRadius.circular(10)),
                    height: customSize.h120,
                    width: customSize.w170,
                    child: Column(children: [
                      Image.asset(
                        'assets/images/createadss.png',
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Create Ads',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LstAds()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 241, 241, 241),
                      borderRadius: BorderRadius.circular(10)),
                  height: customSize.h120,
                  width: customSize.w170,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          child: Image.asset(
                            'assets/images/ads.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          ' Ads',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 241, 241, 241),
                      borderRadius: BorderRadius.circular(10)),
                  height: customSize.h120,
                  width: customSize.w170,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 80,
                        child: Image.asset(
                          'assets/images/recharge.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'Recharge',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => reports()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 241, 241, 241),
                      borderRadius: BorderRadius.circular(10)),
                  height: customSize.h120,
                  width: customSize.w170,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(children: [
                      Image.asset(
                        'assets/images/report.png',
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Report',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ]),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 241, 241, 241),
                  borderRadius: BorderRadius.circular(10)),
              height: customSize.h120,
              width: customSize.w170,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
                    child: Image.asset(
                      'assets/images/enquiry.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  'Enquiry',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ]),
            ),
          )
        ],
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          Container(
            height: 150,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.lightBlue),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 100,
                  width: 100,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Version:',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'ID :',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle_rounded,
              size: 30,
            ),
            title: const Text('My Profile'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Aunthatication_lst()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.language, size: 30),
            title: const Text('Languages'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RadioExampleApp()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.dark_mode_outlined,
              size: 30,
            ),
            title: const Text('Mode'),
            onTap: () {
              setState(() {
                isDark = false;
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LD_mode()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.support_agent,
              size: 30,
            ),
            title: const Text('Support'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Support()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete_forever, size: 30),
            title: const Text('Deactivate Account'),
          ),
          ListTile(
            leading: const Icon(Icons.logout, size: 30),
            title: const Text('Signout'),
          )
        ],
      )),
    );
  }
}

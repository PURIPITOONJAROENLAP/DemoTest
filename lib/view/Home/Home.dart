import 'dart:async';

import 'package:facebook/bloc/home_bloc.dart';
import 'package:facebook/view/registerMain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);
  bool loading = true;
  void initState() {
    super.initState();
    countDown();
  }
  calHeight(double val) {
    var a = (val / 812 * 100);
    var result = ((a/100) * 812);
    return result;
  }
  calWidth(double val) {
    var a = (val / 375 * 100);
    var result = ((a/100) * 375);
    return result;
  }

  void countDown() {
    int seconds = 3;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds--;
      if (seconds < 0) {
        timer.cancel();
        loading = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterBloc, CounterState>(
      listener: (context, state) {},
      child: loading
      ? Container(color:Colors.white,child: Center(child: Image.asset('assets/images/Home/loading.png')))
      : Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: 4,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      itemBuilder: (context, index) {
                        return page(index);
                      },
                    ),
                  ),
                  Container(
                    height: 30,
                    child: Center(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: _currentPage == index ? calWidth(14) : calWidth(10),
                            height: _currentPage == index ? calHeight(14) : calHeight(10),
                            margin: EdgeInsets.symmetric(horizontal: calWidth(10)),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == index ? Color(0xFF1FA44F) : Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )
          ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child:Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Color(0xFF1FA44F),
                                    width: 2.0,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'เข้าสู่ระบบ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF1FA44F),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterMain()),);
                              },
                              child: Container(
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xFF1FA44F),
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                    color: Color(0xFF1FA44F),
                                    width: 2.0,
                                  ),
                                ),
                                child: const Center(
                                    child: Text(
                                      'สมัครสมาชิก',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    )),
                              )),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: "พบปัญหาติดต่อ ",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                          children: [
                            TextSpan(text: "ศูนย์ช่วยเหลือ", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1FA44F))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget page(int index) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: SvgPicture.asset('assets/images/Home/welcome.svg'),
          ),
          Column(
            children: [
              Text(index == 0 ? "ยินดีต้อนรับสู่" : "เริ่มต้นใช้งาน",style: TextStyle(fontWeight: FontWeight.bold,fontSize:36 ,color: Color(0xFF1FA44F))),
              Text('DEMO',style: TextStyle(fontWeight: FontWeight.bold,fontSize:36 ,color: Color(0xFF1FA44F))),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Align(
                alignment: Alignment.center,
                child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard",textAlign: TextAlign.center,)
            ),
          ),
        ]
      )
    );
  }
}

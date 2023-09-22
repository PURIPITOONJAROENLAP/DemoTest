import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Person extends StatefulWidget {
  const Person({Key? key}) : super(key: key);

  @override
  State<Person> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<Person> {
  int _selectedTabIndex =0;
  int _charCount = 0;
  bool isButtonEnabled = false;
  TextEditingController _shopController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _IDController = TextEditingController();
  TextEditingController _mailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  void initState() {
    _shopController.addListener(_updateCharCount);
    _shopController.addListener(textListener);
    _nameController.addListener(textListener);
    _IDController.addListener(textListener);
    _mailController.addListener(textListener);
    _phoneController.addListener(textListener);
    super.initState();
  }
  void _updateCharCount() {
    setState(() {
      _charCount = _shopController.text.length;
    });
  }
  textListener() {
    isButtonEnabled = _shopController.text.isNotEmpty &&
        _nameController.text.isNotEmpty &&
        _IDController.text.isNotEmpty &&
        _mailController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty;

    setState(() {});
  }
  @override
  void dispose() {
    _shopController.removeListener(_updateCharCount);
    _shopController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('สมัครสมาชิก'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Color(0xFF1FA44F),
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(Icons.circle, color: Colors.white, size: 40.0,),
                      Text('1',style: TextStyle(color: Color(0xFF1FA44F), fontWeight: FontWeight.bold, fontSize: 18.0,),),
                    ]
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:10 ),
                    child: Text('ชื่อร้านค้า / ผู้ขาย',style: TextStyle(color: Colors.white,overflow: TextOverflow.ellipsis,),),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(Icons.circle, color: Colors.white, size: 40.0,),
                      Text('2',style: TextStyle(color: Color(0xFF1FA44F), fontWeight: FontWeight.bold, fontSize: 18.0,),),
                    ]
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:10 ),
                    child: Text('ที่อยู่',style: TextStyle(color: Colors.white,overflow: TextOverflow.ellipsis,),),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(Icons.circle, color: Colors.white, size: 40.0,),
                      Text('3',style: TextStyle(color: Color(0xFF1FA44F), fontWeight: FontWeight.bold, fontSize: 18.0,),),
                    ]
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:10 ),
                    child: Text('ยืนยันตัวตน',style: TextStyle(color: Colors.white,overflow: TextOverflow.ellipsis,),),
                  )

                ],
              ),
            ),
          ),
          Padding (
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text('ข้อมูลร้านค้า',style: TextStyle(color: Colors.black,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      _selectedTabIndex = 0;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text('บุคคลธรรมดา')),
                          ),
                          _selectedTabIndex == 0
                              ? Container(
                              width: double.infinity,
                              height: 2,
                              color: Color(0xFF1FA44F),
                            )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      _selectedTabIndex = 1;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text('นิติบุคคล')),
                          ),
                          _selectedTabIndex == 1
                          ? Container(
                            width: double.infinity,
                            height: 2,
                            color: Color(0xFF1FA44F),
                          )
                          : Container()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: () {
              showCupertinoModalPopup<void>(
                context: context,
                builder: (BuildContext context) => CupertinoActionSheet(
                actions: <Widget>[
                  CupertinoActionSheetAction(child: Text('ถ่ายภาพ'), onPressed: () =>  _dialogBuilder(context,'Demo" ต้องการที่จะเข้าถึง รูปภาพของคุณ','KhoomKha will use photo album for user profile avatar etc')),
                  CupertinoActionSheetAction(child: Text('เลือกจากอัลบัม'), onPressed: () =>  _dialogBuilder(context,'Demo" ต้องการที่จะเข้าถึง รูปภาพของคุณ','KhoomKha will use photo album for user profile avatar etc')),
                ],
                cancelButton: CupertinoActionSheetAction(
                  child: Text('ยกเลิก'),
                  onPressed: () => Navigator.pop(context),
                ),
                ),
              );
            },
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: Center(
                child: Icon(Icons.person,size: 80.0, color: Colors.white,),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: page1(),
          )),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child:Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child:  ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {}
                    : null,
                style: ButtonStyle(
                  backgroundColor: isButtonEnabled
                      ? MaterialStateProperty.all<Color>(Colors.green)
                      : MaterialStateProperty.all<Color>(Colors.grey.shade400), // Change button color based on isEnabled condition
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                child: Container(height: 50, child: Center(child: Text('บันทึก', style: TextStyle(fontSize: 18, color: Colors.white,),))),
              ),
            )
        ),
      ),
    );
  }
  Widget page1(){
    return ListView(
      children: [
        TextField(
          controller: _shopController,
          decoration: InputDecoration(
            counterText: '$_charCount/250', // ข้อความนับจำนวนคำ
            counterStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelText: 'ชื่อร้านค้า',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        textFieldForm(_nameController,'ชื่อและนามสกุล ตามบัตรประชาชน'),
        textFieldForm(_IDController,'เลขประจำตัวประชาชน'),
        textFieldForm(_mailController,'อีเมล'),
        textFieldForm(_phoneController,'หมายเลขโทรศัพท์'),
      ],
    );
  }
  Widget textFieldForm(TextEditingController controller,String labelText ){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: '$labelText',
          labelStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 16.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
  Future<void> _dialogBuilder(BuildContext context,String title,String content) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              Icon(Icons.info_outline,size: 50,),
              Text('$title'),
            ],
          ),
          content:  Text('$content',textAlign: TextAlign.center,),
          actions: [
            Expanded(
              child: Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                    primary: Colors.blue,
                  ),
                  child: const Text('ดำเนินการต่อ'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                    primary: Colors.blue,
                  ),
                  child: Text('อนุญาตให้เข้าถึงรูปภาพทั้งหมด'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                    primary: Colors.blue,
                  ),
                  child: Text('ไม่อนุญาต'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

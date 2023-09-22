import 'package:flutter/material.dart';

import 'complete.dart';

class RegisterMain extends StatefulWidget {
  const RegisterMain({Key? key}) : super(key: key);

  @override
  State<RegisterMain> createState() => _RegisterMainScreenState();
}

class _RegisterMainScreenState extends State<RegisterMain> {
  bool _isObscuredConfirmPW = true;
  bool _isObscuredPW = true;
  bool?  pwIsMatch;
  TextEditingController OTPTextController = TextEditingController();
  TextEditingController phoneMailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  TextEditingController confirmPWController = TextEditingController();
  bool isButtonEnabled = false;
  void initState() {
    super.initState();
    OTPTextController.addListener(textListener);
    phoneMailController.addListener(textListener);
    pwController.addListener(textListener);
    confirmPWController.addListener(textListener);
  }

  textListener() {
    isButtonEnabled = phoneMailController.text.isNotEmpty &&
        OTPTextController.text.isNotEmpty &&
        pwController.text.isNotEmpty &&
        confirmPWController.text.isNotEmpty;
    if(pwController.text != null && confirmPWController.text != null && pwController.text.isNotEmpty && confirmPWController.text.isNotEmpty) {
      pwIsMatch = (pwController.text == confirmPWController.text) ? true : false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('สมัครสมาชิก'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, size: 30,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: [
              //  phone || Mail
              TextField(
                controller: phoneMailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'อีเมล / หมายเลขโทรศัพท์',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              //รหัส OTP
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            controller: OTPTextController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'รหัส OTP',
                              enabledBorder:InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          if(phoneMailController.text.contains('@')){
                            _dialogBuilder(context, 'รหัส OTP', 'เราได้ส่งรหัส OTP ไปยังอีเมลของคุณ กรุณาตรวจสอบอีเมล', 'ดำเนินการ');
                          }else {
                            _dialogBuilder(context, 'รหัส OTP', 'เราได้ส่งรหัส OTP ไปยังหมายเลขโทรศัพท์ ของคุณ กรุณาตรวจสอบ SMS', 'ดำเนินการ');
                          }
                        },
                        child: Container(
                          width: 80,
                          height: double.infinity,
                          color: Colors.green.shade100,
                          child: Center(child: Text('ส่ง OTP',style: TextStyle(color:Colors.green ),))),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              // รหัสผ่าน
              TextField(
                controller: pwController,
                obscureText: _isObscuredPW,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: pwIsMatch?? true ? Colors.grey :Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'รหัสผ่าน',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscuredPW ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: (){
                      _isObscuredPW = !_isObscuredPW;
                      setState(() {});
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              const Text('ตัวอักษร ตัวเลข และสัญลักษณ์ผสมกัน อย่างน้อย 8 ตัว'),
              const SizedBox(height: 10,),
              // Confirm รหัสผ่าน
              TextField(
                controller: confirmPWController,
                obscureText: _isObscuredConfirmPW,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: pwIsMatch?? true ? Colors.grey :Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'ยืนยันรหัสผ่าน',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscuredConfirmPW ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                      onPressed: (){
                        _isObscuredConfirmPW = !_isObscuredConfirmPW;
                        setState(() {});
                      },
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              pwIsMatch == null
                  ? Container()
                  : pwIsMatch!
                    ? Container()
                    : Row(
                      children: [
                        Icon(Icons.info_outline_rounded, size: 30,color: Colors.red,),
                        SizedBox(width: 10,),
                        Text('กรุณาตั้งรหัสผ่านให้เหมือนกัน',style: TextStyle(color: Colors.red),)
                      ],
                    ),
              const Center(child: Text('ในการสมัครสมาชิก คุณได้ยอมรับ')),
              const SizedBox(height: 10,),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "ข้อกำหนดและเงื่อนไข ",
                    style: TextStyle(fontWeight: FontWeight.normal, color: Colors.green),
                    children: [
                      TextSpan(text: "และ",style : TextStyle(color: Colors.black),),
                      TextSpan(text: " นโยบายความเป็นส่วนตัว", style: TextStyle(fontWeight: FontWeight.normal, color: Colors.green,),),
                    ]
                  ),
                ),
              ),
            ],
          ),
        )
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child:Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:  ElevatedButton(
              onPressed: isButtonEnabled
                  ? () {
                      if (OTPTextController.text == '752155' && pwIsMatch!) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Complete()),);
                      }
                      else {
                        _dialogBuilder(context, 'รหัส OTP ไม่ถูกต้อง', 'รหัส OTP ไม่ถูกต้องระบุใหม่อีกครั้ง', 'ตกลง');
                      }
                  }
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
              child: Container(height: 50, child: Center(child: Text('สมัครสมาชิก', style: TextStyle(fontSize: 18, color: Colors.white,),))),
            ),
          )
        ),
      ),
    );
  }
  Future<void> _dialogBuilder(BuildContext context,String title,String content,String textButton) {
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
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  primary: Colors.grey,
                ),
                child: const Text('ยกเลิก'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Expanded(
              child: TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
                primary: Colors.green,
              ),
              child: Text('$textButton'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            )
          ],
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_fultter/resources/auth_methods.dart';
import 'package:instagram_fultter/responsive/mobile_screen_layout.dart';
import 'package:instagram_fultter/screen/signup_screen.dart';
import 'package:instagram_fultter/utils/colors.dart';
import 'package:instagram_fultter/utils/utils.dart';
import 'package:instagram_fultter/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _isLoading = false;

  @override

  //로그인화면이 나가지면서 controller에 담겨있던것들을 폐기시킨다.
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading != true;
    });
   String res = await AuthMethods().loginUser(email: _emailController.text, password: _passwordController.text);
    if(res != "success"){
      showSnackBar(res, context);
      setState(() {
        _isLoading != false;
      });
    } else {
      setState(() {
        _isLoading != false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          //단말의 width를 모두 채워버린다.
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              //SVG이미지를 가져올 때 사용한다.
              SvgPicture.asset(
                "assets/ic_instagram.svg",
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(
                height: 64,
              ),
              TextFieldInput(
                  textEditingController: _emailController,
                  hintText: 'Enter Your Email',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: 'Enter Your Password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: loginUser,
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text('Log in'),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Don't have an acount?"),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupScreen(),
                          // fullscreenDialog: true
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        _isLoading ?
        Center(child: CircularProgressIndicator( color: primaryColor,),)
            : Container(),
      ]),
      )
    );
  }
}

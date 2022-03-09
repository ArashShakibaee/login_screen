import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login_screen/API/error_response_model.dart';
import 'package:login_screen/API/login_model.dart';
import 'package:login_screen/API/login_response.dart';
import 'package:login_screen/constants.dart';
import 'package:login_screen/custom_text_field.dart';

class InputContainer extends StatefulWidget {
  const InputContainer({Key? key}) : super(key: key);

  @override
  _InputContainerState createState() => _InputContainerState();
}

class _InputContainerState extends State<InputContainer> {
  bool isChecked = false;
  // for TextField
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

// create validator for textField
  final usernameValidator =
      MultiValidator([RequiredValidator(errorText: 'این فیلد ضرروری است')]);

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'این فیلد ضرروری است'),
    MinLengthValidator(8, errorText: 'رمز عبور باید حداقل 8 کارکتر داشته باشد'),
    PatternValidator(r"^(?=.*?[a-z]).{6,}$",
        errorText: ' حروف انگلیسی a-z ضروری است'),
    PatternValidator(r"^(?=.*?[0-9]).{6,}$",
        errorText: 'رمز عبور باید شامل اعداد باشد'),
  ]);

 // call Api
  void _getLoginStatus() async {
    try {
      var verResponse = await LoginResponse.getLoginStatus(LoginModel(
          userName: usernameController.text,
          userPassword: passwordController.text));

      if (verResponse != null) {
        usernameController.text = verResponse.userName!;
        passwordController.text = verResponse.userPassword!;
        setState(() {});
      }
    } on ErrorResponse catch (e) {
      if (e.errorCode == 401) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(':نام کاربری', style: kTitleTextStyle),
          CustomTextField(
              hintText: 'نام کاربری خود را وارد کنید',
              validator: usernameValidator,
              controller: usernameController,
              obscureText: false),
          const SizedBox(height: 30),
          const Text(':رمز عبور', style: kTitleTextStyle),
          CustomTextField(
              hintText: 'رمز عبور را وارد کنید',
              validator: passwordValidator,
              controller: passwordController,
              obscureText: true),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'من را به خاطر بسپار',
                  style: kTitleTextStyle,
                ),
                const SizedBox(
                  width: 10,
                ),
                Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
              width: size.width,
              height: size.height * 0.06,
              child: ElevatedButton(
                onPressed: () {
                  final form = _formKey.currentState!;
                  if (form.validate()) {
                    _getLoginStatus();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'کاربر با موفقیت احزار هویت خود را انجام داد')));
                  }
                },
                child: const Text(
                  'تایید',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.blue.shade600),
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  bool success = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: success ? Colors.green : Colors.red,
          title: Text(
            "Password Validation",
            style: GoogleFonts.mPlus1(fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(10),
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: success
                  ? Lottie.network(
                      "https://lottie.host/b72d482a-8285-41a6-aed9-19ff59a21d4f/2un8X2czPh.json",
                    )
                  : Lottie.asset(
                      "assets/animation_lnt9yuim.json",
                    ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 207, 207, 207),
                            width: 2),
                        borderRadius: BorderRadius.circular(12)),
                    floatingLabelStyle: GoogleFonts.mPlus1(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: success ? Colors.green : Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Password",
                    hintStyle: GoogleFonts.mPlus1(color: Colors.black),
                    border: const OutlineInputBorder(borderSide: BorderSide()),
                  ),
                ),
                const SizedBox(height: 12),
                FlutterPwValidator(
                  defaultColor: Colors.grey.shade300,
                  controller: controller,
                  successColor: Colors.green.shade700,
                  minLength: 8,
                  uppercaseCharCount: 2,
                  numericCharCount: 3,
                  specialCharCount: 1,
                  normalCharCount: 3,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  onSuccess: () {
                    setState(() {
                      success = true;
                    });
                  },
                  onFail: () {
                    setState(() {
                      success = false;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

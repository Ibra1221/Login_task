import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const RegisterPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Color(0xFF1E1E1E),
        appBar: AppBar(centerTitle: true, title: Text('Register')),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              height: 940,
              width: 417,
              child: Column(
                children: [
                  SizedBox(
                    width: 417,
                    height: 20,
                    child: Align(
                      alignment: AlignmentGeometry.xy(-1, -1),
                      child: Text(
                        "SignUp",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 917,
                    width: 417,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 417,
                          child:  Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                          onPressed: () => {Navigator.pop(context)},
                          icon: Icon(Mdi.arrowLeft, color: Color(0xFF0077B6)),
                        ),
                          )
                        ),
                        SizedBox.square(
                          dimension: 225,
                          child: Image.asset(
                            "assets/images/signup 2.png",
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 156,
                          height: 68,
                          child: Align(
                            alignment: Alignment(-10, -4),
                            child: Text(
                              "Register",
                              style: TextStyle(
                                color: Color(0xFF33363F),
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w700,
                                fontSize: 32,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 28),
                          child: SizedBox(
                            width: 311,
                            height: 274,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 311,
                                  height: 41,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFBABABA),
                                          width: 0.5,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFBABABA),
                                          width: 0.5,
                                        ),
                                      ),
                                      labelText: "Email",
                                      labelStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF757575),
                                        fontFamily: "Roboto",
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 311,
                                  height: 41,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFBABABA),
                                          width: 0.5,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFBABABA),
                                          width: 0.5,
                                        ),
                                      ),
                                      labelText: "Password",
                                      labelStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF757575),
                                        fontFamily: "Roboto",
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 311,
                                  height: 41,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFBABABA),
                                          width: 0.5,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFBABABA),
                                          width: 0.5,
                                        ),
                                      ),
                                      labelText: "Confirm Password",
                                      labelStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF757575),
                                        fontFamily: "Roboto",
                                      ),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                      Color(0xFF0077B6),
                                    ),
                                  ),
                                  onPressed: () => {},
                                  child: Center(
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Padding(
                                  padding: EdgeInsets.only(top: 87),
                                  child: SizedBox(
                                    width: 222,
                                    height: 25,
                                    child: InkWell(
                                      onHover: (hovering) {
                                        setState(() {
                                          isHovering = hovering;
                                        });
                                      },
                                      onTap: () => {
                                        Navigator.pop(context)
                                      },
                                      child: RichText(
                                        text: TextSpan(

                                          text: "Already have an account? ",
                                          style: TextStyle(
                                            color: Color(0xFF757575),
                                            fontSize: 14,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w400,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: ' Login',
                                              style: TextStyle(
                                                color: Color(0xFF4285F4),
                                                fontSize: 14,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w400,
                                                decoration: 
                                                isHovering ? 
                                                TextDecoration.underline
                                                : TextDecoration.overline,
                                                decorationColor: isHovering?
                                                 Color(0xFF4A9DF8) :
                                                 Colors.red
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

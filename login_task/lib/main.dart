import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:calculator_task/main.dart';
import 'register.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Color(0xFF1E1E1E),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalculatorPage(title: "Calculator"),
                  ),
                ),
              },
              icon: Icon(Mdi.calculator),
            ),
          ],
          centerTitle: true,
          title: Text('Titled Container'),
        ),
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
                        "Login",
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
                        SizedBox.square(
                          dimension: 225,
                          child: Image.asset(
                            "assets/images/Mobile login-rafiki.png",
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Container(
                          margin: EdgeInsets.all(10),
                          width: 109,
                          height: 68,
                          child: Align(
                            alignment: Alignment(-10, -4),
                            child: Text(
                              "Login",
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
                            height: 244,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 311,
                                  height: 53,
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
                                  height: 50,
                                  child: TextFormField(
                                    obscureText: true,
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
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 10,
                                    left: 188,
                                  ),
                                  child: SizedBox(
                                    width: 123,
                                    height: 35,
                                    child: Center(
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFF0077B6),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 311,
                          height: 48,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                Color(0xFF0077B6),
                              ),
                            ),
                            onPressed: () => {},
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                                  padding: EdgeInsets.only(top: 87),
                                  child: SizedBox(
                                    width: 222,
                                    height: 25,
                                    child: Center(
                                      child: InkWell(
                                      onHover: (hovering) {
                                        setState(() {
                                          isHovering = hovering;
                                        });
                                      },
                                      onTap: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => RegisterPage(
                                              title: "SignUp"
                                              )
                                          ) 
                                        )
                                      },
                                      child: RichText(
                                        text: TextSpan(

                                          text: "New here? ",
                                          style: TextStyle(
                                            color: Color(0xFF757575),
                                            fontSize: 14,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w400,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: ' Register',
                                              style: TextStyle(
                                                color: Color(0xFF4285F4),
                                                fontSize: 14,
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w400,
                                                decoration: 
                                                (isHovering) ? 
                                                TextDecoration.underline
                                                : null,
                                                decorationColor: (isHovering)?
                                                 Color(0xFF4A9DF8) :
                                                 null
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    )
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

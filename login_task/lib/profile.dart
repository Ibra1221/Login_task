import 'package:flutter/material.dart';

void main() {
  runApp(const ProfilePage());
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)!.settings.arguments as String ;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFDCDE7D),
        body: Center(
          child: SafeArea(
          minimum: EdgeInsets.all(8),
          child: Container(
            width: 230,
            height: 450,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Color(0xFFf2f3d0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  child: Image.asset('assets/images/bk.png'),
                ),
                Padding(
                  padding: EdgeInsets.all(16)
                ),
                Container(
                  width: 124,
                  height: 124,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xFF218DAA), width: 2)
                  ),
                  child: Image.asset(
                    "assets/images/random_profile.png",
                    height: 124,
                    width: 124,
                  )
                ),
                Padding(
                    padding: EdgeInsets.all(8)
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Cinzel',
                  ),
                ),
                Text(
                  '@obohemmanuella',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 9,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Lato',
                  ),
                ),
                 Padding(
                    padding: EdgeInsets.all(6)
                ),
                Container(
                  height: 1,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF218DAA))
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(6)
                ),
                Text(
                  '- Product Design Track',
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Lato',
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(6)
                ),
                SizedBox(
                  height: 55,
                  width: 164,
                  child: Text(
                  '''I have chosen the product design full-time track as I hope 
to become an entry level designer within the next 6 months.
I believe this program will help me achieve my goals.''',
                   textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Lato',
                  ),
                ),
                ),
                Padding(
                    padding: EdgeInsets.all(6)
                ),
                Container(
                  height: 1,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF218DAA))
                  ),
                ),
                
                SizedBox(
                  height: 44,
                  width: 124,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                    "assets/images/Instagram.png",
                    height: 17,
                    width: 17,
                  ),
                  Padding(
                    padding: EdgeInsets.all(4)
                ),
                  Image.asset(
                    "assets/images/Twitter Squared.png",
                    height: 17,
                    width: 17,
                  ),
                  Padding(
                    padding: EdgeInsets.all(4)
                ),
                  Image.asset(
                    "assets/images/LinkedIn.png",
                    height: 17,
                    width: 17,
                  ),
                  Padding(
                    padding: EdgeInsets.all(4)
                ),
                Image.asset(
                    "assets/images/Behance.png",
                    height: 17,
                    width: 17,
                  ),
                  ],
                ),
                ),
                const Spacer(flex: 2),
                 ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  child:
                     Image.asset('assets/images/bk.png'),
                    
                ),
              
              ],
            ),
          ),
        ),
        )
      ),
    );
  }
}



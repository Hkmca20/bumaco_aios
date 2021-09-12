import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Image(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 3,
                    image: NetworkImage(
                        'https://www.sdrcares.com/images/prod7.jpeg')),
                Positioned(
                    bottom: -60,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50'),
                    ))
              ],
            ),
            SizedBox(
              height: 50,
            ),
            ListTile(
              title: Center(child: Text('Gupta')),
              subtitle: Center(child: Text('Delhi - 112233')),
            ),
            ElevatedButton.icon(
              onPressed: () => {},
              icon: Icon(
                Icons.mail,
                color: Colors.white,
                size: 24,
              ),
              label: Text(
                'ProfileView',
                strutStyle: StrutStyle(
                  fontFamily: '',
                  forceStrutHeight: true,
                ),
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
              ),
            ),
            ListTile(
              title: Text('hiiiiiiiiii'),
              subtitle: Text(
                  'meeeeeeeeeeee helooooooooooooowwwwwwwww howwwwwwwwwwwwwwwwwwwwwwwww areeeeeeeeeeeeeee youuuuuuuuuuuuuu'),
            ),
          ],
        ),
      ),
    );
  }
}

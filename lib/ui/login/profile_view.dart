import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              height: 60,
            ),
            ListTile(
              title: Center(
                  child: Text(
                'Gupta',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
              subtitle: Center(
                  child: Text('Delhi - 112233',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold))),
            ),
            ElevatedButton.icon(
              onPressed: () => {},
              icon: Icon(
                Icons.mail,
                color: Colors.white,
                size: 24,
              ),
              label: Text('mailid.y112233@gmail.com'),
            ),
            ListTile(
              title: Text('About me', style: TextStyle(fontSize: 30)),
              subtitle: Text(
                  'meeeeeeeeeeee helooooooooooooowwwwwwwww howwwwwwwwwwwwwwwwwwwwwwwww areeeeeeeeeeeeeee youuuuuuuuuuuuuu',
                  style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

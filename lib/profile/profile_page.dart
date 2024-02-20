import 'package:bitescan/page/sign_in.dart';
import 'package:bitescan/profile/achievement_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  String name;
  ProfilePage({required this.name, super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var email = FirebaseAuth.instance.currentUser!.email;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              minRadius: 60,
              child: Text(
                widget.name.substring(0, 1),
                style: const TextStyle(fontSize: 40, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(email.toString()),
            const SizedBox(
              height: 50,
            ),
            const Divider(
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.star_border_rounded,
                  size: 50,
                ),
                const Text(
                  'My Achievements',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 73, 188, 255),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const AchievementPage()));
                      },
                      icon: const Icon(Icons.arrow_forward_ios_rounded)),
                )
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.logout_rounded,
                  size: 50,
                ),
                const Text(
                  'Log out',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 73, 188, 255),
                  child: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return AlertDialog(
                                title:
                                    const Text('Are you sure want to log out?'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('No')),
                                  TextButton(
                                      onPressed: () async {
                                        try {
                                          Navigator.pop(context);
                                          await FirebaseAuth.instance.signOut();
                                          await GoogleSignIn().signOut();
                                          if (!context.mounted) return;
                                          Navigator.pop(context);
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignInPage(),
                                            ),
                                          );
                                        } catch (e) {
                                          if (!context.mounted) return;
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(e.toString()),
                                            ),
                                          );

                                          Navigator.pop(context);
                                        }
                                      },
                                      child: const Text('Yes'))
                                ],
                              );
                            }));
                      },
                      icon: const Icon(Icons.arrow_forward_ios_rounded)),
                )
              ],
            ),
            const Divider(
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:bitescan/page/home_page.dart';
import 'package:bitescan/page/question_page.dart';
import 'package:bitescan/page/sign_in.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool showDetail = true;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void createAccount(email, password, context) async {
    setState(() {
      showDetail = false;
    });
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      var uid = FirebaseAuth.instance.currentUser!.uid;
      DatabaseReference db = FirebaseDatabase.instance.ref('users/$uid');
      await db.update({
        'username': _username.text,
        'uid': uid,
        'completeQuestion': false,
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => const QuestionPage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setState(() {
          showDetail = true;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Password to weak')));
      } else if (e.code == 'email-already-in-use') {
        setState(() {
          showDetail = true;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Email Already use')));
      } else {
        setState(() {
          showDetail = true;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Email Not Valid')));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 103, 218, 253),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 103, 218, 253),
        child: Visibility(
          visible: showDetail,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Username'),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: _username,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Email'),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Password'),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: _password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white)),
                        onPressed: () {
                          if (_username.text.isEmpty ||
                              _password.text.isEmpty ||
                              _email.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Fill all requirements')));
                          } else {
                            createAccount(_email.text, _password.text, context);
                          }
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.black),
                        ))),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const SignInPage()));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                    )),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'OR',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                    )),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    onPressed: () async {
                      await signInWithGoogle();
                      var uid = FirebaseAuth.instance.currentUser!.uid;
                      DatabaseReference db =
                          FirebaseDatabase.instance.ref('users/$uid');
                      db.onValue.listen((event) {
                        var data = event.snapshot.value;
                        if (data != null && data is Map) {
                          var question = data['completeQuestion'] ?? false;
                          if (question) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()),
                            );
                          } else {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const QuestionPage()),
                            );
                          }
                        } else {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const QuestionPage()),
                          );
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('images/Google.png'),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Sign Up With Google',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

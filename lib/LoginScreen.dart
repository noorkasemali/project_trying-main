import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AuthRepository.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
//throw UnimplementedError();

}
class _LoginState extends State<Login> {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/appBar2.png', fit:BoxFit.cover),
        ),
        body: Center(
            child: SizedBox(
                width: 350,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 20),
                      const Text(
                          'Welcome, please log in below'),
                      const SizedBox(height: 20),
                      TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                          )),
                      const SizedBox(height: 20),
                      TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                          )),
                      const SizedBox(height: 10),
                      user.status == Status.Authenticating
                          ? Center(child: CircularProgressIndicator())
                          : TextButton(
                          onPressed: () async {
                            if (await user.signIn(
                                emailController!.text, passwordController!.text)) {
                              Navigator.pushNamed(context, '/home');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'There was an error logging into the app.')));
                            }
                          },
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              fixedSize: const Size(350, 20),
                              shape: const StadiumBorder(),
                              backgroundColor: const Color(0xFF690B0A)),
                          child: const Text('Login')),
                  const SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don\'t have an account?",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[500],
                            ),
                          ),
                        ] ),
                      TextButton(
                          onPressed: () async {
                            if (await user.signUp(
                                emailController!.text, passwordController!.text) != null) {
                              Navigator.pushNamed(context, '/home');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'There was an error signing up into the app.')));
                            }
                          },
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              fixedSize: const Size(350, 20),
                              shape: const StadiumBorder(),
                              backgroundColor: const Color(0xFF690B0A)),
                          child: const Text('Sign up with Email')),
                      const SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "or",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[500],
                              ),
                            ),
                          ] ),
                      //Google icon
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                              AssetImage('assets/google.png'),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text("Connect with Google")
                      //end of Google icon


                    ]))));
  }
}


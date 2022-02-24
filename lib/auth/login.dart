import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<AuthenticationProvider?>(
        create: (_) => AuthenticationProvider(FirebaseAuth.instance),
      ),
      StreamProvider(
        create: (context) => context.read<AuthenticationProvider?>()!.authState,
        initialData: null,
      )
    ], child: const Authenticate());
  }
}

class AuthenticationProvider {
  final FirebaseAuth firebaseAuth;
  //FirebaseAuth instance
  AuthenticationProvider(this.firebaseAuth);
  //Constuctor to initalize the FirebaseAuth instance

  //Using Stream to listen to Authentication State
  Stream<User?> get authState => firebaseAuth.idTokenChanges();
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.deepOrange,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                const Text("Tashmë të verifikuar! :)"),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: SvgPicture.asset(
                    "assets/verified.svg",
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return const LoginScreen1();
    }
  }
}

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({Key? key}) : super(key: key);

  @override
  _LoginScreen1State createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Vendosni emailin tuaj!");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Vendosni nje emailc te vlefshem!");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          constraints: const BoxConstraints(maxWidth: 500),
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.deepOrange,
              width: 2,
            ),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Fjalekalimi eshte i detyruar per identifikim!");
          }
          if (!regex.hasMatch(value)) {
            return ("Vendosni nje fjalekalim te vlefshem(Min. 6 karaktere)");
          }
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          constraints: const BoxConstraints(maxWidth: 500),
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Fjalekalimi",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.deepOrange,
              width: 2,
            ),
          ),
        ));

    final loginButton = Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(30),
      color: Colors.deepOrange,
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          elevation: 0,
          minWidth: 500,
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: const Text(
            "Identifikohu",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.deepOrange,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.deepOrange),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop(
                // MaterialPageRoute<void>(
                //   builder: (BuildContext context) => MainScreen(),
                // ),
                );
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.height * 0.2,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/logo.png"),
                            fit: BoxFit.contain)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: SvgPicture.asset("assets/login.svg"),
                  ),
                  emailField,
                  const SizedBox(height: 25),
                  passwordField,
                  const SizedBox(height: 25),
                  loginButton,
                  const SizedBox(height: 15),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     const Text("Nuk ke nje adrese? "),
                  //     GestureDetector(
                  //       onTap: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => const RegistrationScreen(),
                  //           ),
                  //         );
                  //       },
                  //       child: const Text(
                  //         "Rregjistrohu",
                  //         style: TextStyle(
                  //             color: Colors.redAccent,
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 15),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(
                      msg: "Identifikimi me sukses! :)",
                      backgroundColor: Colors.deepOrange,
                      textColor: Colors.white),
                  Navigator.of(context).pop(),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Adresa juaj e emailit duket të jetë e keqformuar.";

            break;
          case "wrong-password":
            errorMessage = "Fjalëkalimi juaj është i gabuar.";
            break;
          case "user-not-found":
            errorMessage = "Përdoruesi me këtë email nuk ekziston.";
            break;
          case "user-disabled":
            errorMessage = "Përdoruesi me këtë email është çaktivizuar.";
            break;
          case "too-many-requests":
            errorMessage = "Shumë kërkesa ne server.";
            break;
          case "operation-not-allowed":
            errorMessage =
                "Identifikimi me email dhe fjalëkalim nuk është i aktivizuar.";
            break;
          default:
            errorMessage = "Ndodhi një gabim i papërcaktuar.";
        }
        Fluttertoast.showToast(
            msg: errorMessage!,
            backgroundColor: Colors.deepOrange,
            textColor: Colors.white);
      }
    }
  }
}

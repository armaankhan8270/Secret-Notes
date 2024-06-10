import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  final String headerImage;
  final String title;

  const Login({required this.headerImage, required this.title, Key? key})
      : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(1),
          color: Colors.grey.shade200,
          child: Column(
            children: [
              Image.network(widget.headerImage),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.title.toUpperCase(),
                  style: GoogleFonts.merriweather(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              SigininField("username", widget.title.toLowerCase() == "signin",
                  Icons.person),
              SigininField("Email", true, Icons.email_rounded),
              SigininField(" password", true, Icons.key),
              SigininField("confirm password",
                  widget.title.toLowerCase() == "signin", Icons.key),
              Visibility(
                visible: widget.title.toLowerCase() != "login",
                child: const SizedBox(
                  height: 20,
                ),
              ),
              Visibility(
                visible: widget.title.toLowerCase() == "login",
                child: Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Login(
                                  headerImage:
                                      "https://cdn.vectorstock.com/i/preview-1x/34/87/password-with-lock-in-web-form-3d-icon-vector-43133487.webp",
                                  title: "forget password",
                                )),
                      );
                    },
                    child: const Text("ForgetPassword"),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10), // Add margin for spacing
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Material(
                  color: Colors
                      .transparent, // Make the Material widget transparent for the ripple effect
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(
                            headerImage:
                                "https://cdn3d.iconscout.com/3d/premium/thumb/man-holding-sign-up-form-2937684-2426382.png?f=webp",
                            title: "signin",
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      alignment: Alignment.center,
                      child: Text(
                        widget.title.toUpperCase(),
                        style: GoogleFonts.merriweather(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  if (widget.title == "Login") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Login(
                                headerImage:
                                    "https://cdn3d.iconscout.com/3d/premium/thumb/man-holding-sign-up-form-2937684-2426382.png?f=webp",
                                title: "signin",
                              )),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(
                          headerImage:
                              "https://img.freepik.com/premium-vector/login-form-page-with-lock-password-safety-verification-user-authorization-web-security-concept-3d-vector-icon-cartoon-minimal-style_365941-820.jpg?size=626&ext=jpg&ga=GA1.1.1609798635.1690365622&semt=ais",
                          title: "Login",
                        ),
                      ),
                    );
                  }
                },
                child: Visibility(
                  visible: widget.title.toLowerCase() != "forget password",
                  child: Text(
                    widget.title == "Login" ? "newuser" : "already a member",
                    style: GoogleFonts.merriweather(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Visibility(
                visible: widget.title.toLowerCase() != "forget password",
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT-GfKUvYrPuwcVd1scZZaqzvaKhLcuqIZTDZ2dOXrWg&s",
                        height: 50,
                        width: 70,
                      ),
                      Image.network(
                        "https://e7.pngegg.com/pngimages/787/258/png-clipart-apple-logo-apple-logo-heart-logo-thumbnail.png",
                        height: 50,
                        width: 70,
                      ),
                      Image.network(
                        "https://e7.pngegg.com/pngimages/511/605/png-clipart-in-logo-linkedin-diduco-ab-icon-linkedin-blue-angle-thumbnail.png",
                        height: 50,
                        width: 70,
                      ),
                      Image.network(
                        "https://e7.pngegg.com/pngimages/933/615/png-clipart-social-media-facebook-computer-icons-logo-facebook-blue-text-thumbnail.png",
                        height: 50,
                        width: 70,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Visibility SigininField(String hintText, bool visibility, IconData hintIcon) {
    return Visibility(
      visible: visibility,
      child: Container(
        margin: const EdgeInsets.all(15),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(hintIcon),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

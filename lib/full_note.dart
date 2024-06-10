import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FullNoteScreen extends StatefulWidget {
  final String title;
  final String content;
  const FullNoteScreen({Key? key, required this.content, required this.title})
      : super(key: key);

  @override
  State<FullNoteScreen> createState() => _FullNoteScreenState();
}

class _FullNoteScreenState extends State<FullNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  widget.title,
                  style: GoogleFonts.croissantOne(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey, // Set the color of the divider line
                height: 20, // Set the height of the divider line
                thickness: 2, // Set the thickness (width) of the divider line
                indent: 20, // Set the left indentation of the divider
                endIndent: 20, // Set the right indentation of the divider
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   image: NetworkImage(
                  //       'https://cdn.vectorstock.com/i/1000x1000/78/09/realistic-3d-detailed-notebook-lined-spiral-vector-22767809.webp'),
                  //   // fit: BoxFit.cover, // You can change the fit as needed
                  // ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(20),
                child: Text(
                  //                 '''Flutter's development server, also known as "flutter run," can sometimes take a bit of time to start, especially on larger projects or when you're running it for the first time. There are a few strategies you can use to potentially speed up the start time of your Flutter development server:

                  // 1. Enable Hot Reload: Flutter's hot reload feature allows you to make changes to your code and see the results instantly without restarting the entire app. This can significantly speed up your development process, as you don't need to wait for the server to restart every time you make a change. To use hot reload, press "R" in the terminal where your Flutter app is running.

                  // 2. Use a Physical Device: Running your Flutter app on a physical device tends to be faster than using an emulator or simulator. Emulators and simulators have additional overhead, which can slow down the startup time.

                  // 3. Use an SSD: If you're running your development environment on a traditional HDD (Hard Disk Drive), consider upgrading to a Solid State Drive (SSD). SSDs are much faster than HDDs and can significantly reduce Flutter's startup time.

                  // 4. Increase System Resources: Allocate more RAM and CPU cores to your virtual machine or development environment. This can help the Flutter development server start faster. You can adjust these settings in your virtualization software (e.g., VirtualBox, VMware, etc.).

                  // 5. Use a State Management Library: If your app's complexity is causing a slow startup, consider using a state management library like Provider or Riverpod to manage your app's state more efficiently. This can help reduce the time it takes to initialize your app.

                  // 6. Profile and Optimize Code: Regularly profile your Flutter app using tools like Flutter DevTools or Dart DevTools. Identify bottlenecks in your code and optimize it for better performance. This can lead to faster startup times.

                  // 7. Update Flutter and Dependencies: Make sure you are using the latest stable version of Flutter and update your project's dependencies regularly. Flutter updates often include performance improvements and bug fixes that can speed up your app's startup time.

                  // 8. Use Ahead-of-Time (AOT) Compilation: Flutter supports both JIT (Just-In-Time) and AOT (Ahead-of-Time) compilation modes. AOT compilation can reduce startup time significantly, especially on release builds. You can build your Flutter app in AOT mode using the `--release` flag:

                  //                 ''',
                  widget.content,
                  style: GoogleFonts.merriweather(
                    fontSize: 20,
                    height: 1.6,
                    letterSpacing: -0.06,
                    color: const Color(0xFF242424),
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/image1.png",
      "title": "Easy Time Management",
      "description": "Manage daily tasks efficiently with prioritization."
    },
    {
      "image": "assets/image2.png",
      "title": "Increase Work Effectiveness",
      "description": "Improve job statistics by managing tasks smartly."
    },
    {
      "image": "assets/image3.png",
      "title": "Reminder Notification",
      "description": "Never forget your tasks with automatic reminders."
    },
  ];

  void nextScreen() {
    if (currentIndex < onboardingData.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      // Đến màn hình chính (hoặc trang đăng nhập)
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  void previousScreen() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  void skipScreen() {
    // Nhảy đến màn hình chính
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: skipScreen,
              child: Text("Skip", style: TextStyle(fontSize: 16, color: Colors.blue)),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(onboardingData[currentIndex]["image"]!),
                SizedBox(height: 20),
                Text(
                  onboardingData[currentIndex]["title"]!,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    onboardingData[currentIndex]["description"]!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: currentIndex > 0 ? Colors.blue : Colors.grey),
                onPressed: currentIndex > 0 ? previousScreen : null,
              ),
              ElevatedButton(
                onPressed: nextScreen,
                child: Text(currentIndex == onboardingData.length - 1 ? "Get Started" : "Next"),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

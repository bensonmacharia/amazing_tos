import 'package:flutter/material.dart';

class CookiePopup extends StatelessWidget {
  const CookiePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            width: 380,
            height: 230,
            color: Colors.black,
          ),
        ),
        Container(
          width: 380,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "We Value Your Privacy",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "We use cookies to enhance your browsing experience. "
                "By clicking \"Accept All\", you consent to our use of cookies.",
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 10),
              Wrap(
                children: const [
                  Text("Read our ", style: TextStyle(fontSize: 12)),
                  Text("Cookie Policy, ",
                      style: TextStyle(
                          decoration: TextDecoration.underline)),
                  Text("Privacy Policy, ",
                      style: TextStyle(
                          decoration: TextDecoration.underline)),
                  Text("and Terms of Service.",
                      style: TextStyle(
                          decoration: TextDecoration.underline)),
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Accept All"),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("Custom Settings"),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.shield_outlined),
                  label: const Text("Reject All"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFBFE3F0),
                    foregroundColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
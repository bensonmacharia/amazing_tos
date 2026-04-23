import 'package:flutter/material.dart';

class PrivacyPanel extends StatelessWidget {
  const PrivacyPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 455,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: const Color(0xFF0B3E9A),
        border: Border.all(
          color: const Color(0xFF0B3E9A),
          width: 3,
        ),
      ),
      child: Column(
        children: [
          /// ================= TOP HEADER =================
          Container(
            height: 68,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            color: const Color(0xFF2F56A6),
            child: Row(
              children: const [
                Icon(
                  Icons.shield_outlined,
                  color: Colors.white,
                  size: 22,
                ),
                SizedBox(width: 10),
                Text(
                  "Privacy Monitor",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  "Close",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          /// INFO TEXT
          Container(
            width: double.infinity,
            color: const Color(0xFFE9F5FF),
            padding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            child: const Text(
              "Before you agree, here's what you should know",
              style: TextStyle(
                color: Color(0xFF456AA7),
                fontSize: 13,
              ),
            ),
          ),

          const SizedBox(height: 14),

          /// ================= SECTION ITEMS =================
          _item("Your Data"),
          _item("Account Termination"),
          _item("Fees and Payments", active: true),
          _item("Content You Create"),
          _item("Disputes and Arbitration"),
          _item("Changes to These Terms"),

          const SizedBox(height: 14),

          /// DIVIDER
          Container(
            height: 1,
            color: const Color(0xFF82CFFF),
          ),

          /// ASK AI TITLE
          const Padding(
            padding: EdgeInsets.fromLTRB(18, 14, 18, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Ask AI Questions",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),

          /// BIG CHAT AREA
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(
              height: 190,
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFEAF7FF),
                border: Border.all(
                  color: const Color(0xFF82CFFF),
                ),
              ),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Ask me anything about your privacy on this website...",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          /// INPUT + SEND
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 42,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xFF82CFFF),
                      ),
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Type your question...",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: const Color(0xFF8FD4FF),
                    border: Border.all(
                      color: const Color(0xFF82CFFF),
                    ),
                  ),
                  child: const Icon(
                    Icons.send,
                    size: 18,
                    color: Color(0xFF1A3C8E),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _item(String text, {bool active = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      child: Container(
        height: 46,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: active
                ? const Color(0xFF2446A5)
                : const Color(0xFF82CFFF),
            width: active ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.info_outline,
              size: 18,
              color: Color(0xFF78CFFF),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ),
            const Icon(
              Icons.add,
              size: 18,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
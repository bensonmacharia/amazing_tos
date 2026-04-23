import 'package:flutter/material.dart';

class AiChatBox extends StatefulWidget {
  const AiChatBox({super.key});

  @override
  State<AiChatBox> createState() => _AiChatBoxState();
}

class _AiChatBoxState extends State<AiChatBox> {
  final TextEditingController controller = TextEditingController();

  String userMessage = "";
  String aiMessage = "";

  void sendMessage() {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      userMessage = controller.text.trim();
      aiMessage = "";
    });

    controller.clear();

    Future.delayed(const Duration(milliseconds: 700), () {
      if (!mounted) return;

      setState(() {
        aiMessage =
            "Thank you for your question. Our AI assistant would provide detailed information about privacy practices here.";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// ================= CHAT DISPLAY AREA =================
        Container(
          height: 190,
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFEAF7FF),
            border: Border.all(
              color: const Color(0xFF82CFFF),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// PLACEHOLDER BEFORE ANY MESSAGE
                if (userMessage.isEmpty &&
                    aiMessage.isEmpty)
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Ask me anything about your privacy on this website ...",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),

                /// USER MESSAGE
                if (userMessage.isNotEmpty)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      margin:
                          const EdgeInsets.only(
                              bottom: 10),
                      color:
                          const Color(0xFF2F56A6),
                      child: Text(
                        userMessage,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                /// AI RESPONSE
                if (aiMessage.isNotEmpty)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: double.infinity,
                      padding:
                          const EdgeInsets.all(
                              12),
                      color:
                          const Color(0xFF8FD4FF),
                      child: Text(
                        aiMessage,
                        style: const TextStyle(
                          color: Color(
                              0xFF1A3C8E),
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 10),

        /// ================= INPUT ROW =================
        Row(
          children: [
            Expanded(
              child: Container(
                height: 42,
                padding:
                    const EdgeInsets.symmetric(
                        horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(
                        0xFF82CFFF),
                  ),
                ),
                child: TextField(
                  controller: controller,
                  onSubmitted: (_) =>
                      sendMessage(),
                  decoration:
                      const InputDecoration(
                    hintText:
                        "Type your question...",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    border:
                        InputBorder.none,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 8),

            InkWell(
              onTap: sendMessage,
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color:
                      const Color(0xFF8FD4FF),
                  border: Border.all(
                    color: const Color(
                        0xFF82CFFF),
                  ),
                ),
                child: const Icon(
                  Icons.send,
                  size: 18,
                  color:
                      Color(0xFF1A3C8E),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
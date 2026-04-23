import 'package:flutter/material.dart';
import 'ai_chat_box.dart';

class PrivacyPanel extends StatefulWidget {
  const PrivacyPanel({super.key});

  @override
  State<PrivacyPanel> createState() => _PrivacyPanelState();
}

class _PrivacyPanelState extends State<PrivacyPanel> {
  int? openIndex;
  bool isOpen = true;

  final List<Map<String, String>> items = [
    {
      "title": "Your Data",
      "body":
          "This website collects your email, browsing activity, and purchase history. You can opt out of marketing emails but cannot opt out of transaction confirmations. Your data may be shared with payment processors and analytics partners."
    },
    {
      "title": "Account Termination",
      "body":
          "Accounts may be suspended or terminated if terms are violated."
    },
    {
      "title": "Fees and Payments",
      "body":
          "Some services may require subscriptions or one-time fees."
    },
    {
      "title": "Content You Create",
      "body":
          "You may own your content while granting certain usage rights."
    },
    {
      "title": "Disputes and Arbitration",
      "body":
          "Disputes may be resolved through arbitration rather than court."
    },
    {
      "title": "Changes to These Terms",
      "body":
          "Terms may change over time and continued use may imply acceptance."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
      width: isOpen ? 455 : 58,
      height: MediaQuery.of(context).size.height,
      color: const Color(0xFF0B3E9A),
      child: isOpen ? _buildOpenPanel() : _buildClosedPanel(),
    );
  }

  /// ================= OPEN PANEL =================
  Widget _buildOpenPanel() {
    return Column(
      children: [
        /// TOP BAR
        Container(
          height: 68,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          color: const Color(0xFF2F56A6),
          child: Row(
            children: [
              const Icon(
                Icons.shield_outlined,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              const Text(
                "Privacy Monitor",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),

              InkWell(
                onTap: () {
                  setState(() {
                    isOpen = false;
                  });
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
        ),

        /// INFO BAR
        Container(
          width: double.infinity,
          color: const Color(0xFFE9F5FF),
          padding: const EdgeInsets.all(14),
          child: const Text(
            "Before you agree, here's what you should know",
            style: TextStyle(
              color: Color(0xFF456AA7),
              fontSize: 13,
            ),
          ),
        ),

        const SizedBox(height: 10),

        /// ACCORDIONS + CHAT AREA
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                /// ACCORDIONS
                ...List.generate(
                  items.length,
                  (index) => _accordion(
                    index,
                    items[index]["title"]!,
                    items[index]["body"]!,
                  ),
                ),

                const SizedBox(height: 14),

                /// CHAT TITLE
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18),
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

                const SizedBox(height: 10),

                /// AI CHAT BOX
                const Padding(
                  padding: EdgeInsets.fromLTRB(
                      18, 0, 18, 18),
                  child: AiChatBox(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// ================= CLOSED PANEL =================
  Widget _buildClosedPanel() {
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            isOpen = true;
          });
        },
        child: const Icon(
          Icons.shield_outlined,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }

  /// ================= ACCORDION =================
  Widget _accordion(
    int index,
    String title,
    String body,
  ) {
    bool expanded = openIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 6,
      ),
      child: Column(
        children: [
          /// HEADER
          InkWell(
            onTap: () {
              setState(() {
                openIndex =
                    expanded ? null : index;
              });
            },
            child: Container(
              height: 46,
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color:
                      const Color(0xFF82CFFF),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color:
                        Color(0xFF82CFFF),
                    size: 18,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style:
                          const TextStyle(
                        fontSize: 15,
                        fontWeight:
                            FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    expanded
                        ? Icons.remove
                        : Icons.add,
                    color: Colors.grey,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),

          /// BODY
          AnimatedCrossFade(
            duration:
                const Duration(milliseconds: 250),
            crossFadeState: expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: Container(),

            secondChild: Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color:
                      const Color(0xFF82CFFF),
                ),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    "PLAIN LANGUAGE",
                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    body,
                    style:
                        const TextStyle(
                      fontSize: 14,
                      height: 1.45,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.all(
                            12),
                    color: const Color(
                        0xFFEAF7FF),
                    child: const Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [
                        Text(
                          "Things you should know:",
                          style:
                              TextStyle(
                            fontWeight:
                                FontWeight
                                    .bold,
                            color: Color(
                                0xFF2F56A6),
                          ),
                        ),
                        SizedBox(
                            height: 8),
                        Text(
                            "• Can I delete my data?"),
                        SizedBox(
                            height: 6),
                        Text(
                            "• Who do you share my data with?"),
                        SizedBox(
                            height: 6),
                        Text(
                            "• How long do you keep my information?"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    "ORIGINAL LEGAL TEXT",
                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "By using our service, you agree to our collection of personal information including but not limited to email addresses, IP addresses, device identifiers, and usage data. We may share this information with third-party service providers for analytics, payment processing, and marketing purposes.",
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'ai_chat_box.dart';

class PrivacyPanel extends StatefulWidget {
  const PrivacyPanel({super.key});

  @override
  State<PrivacyPanel> createState() => _PrivacyPanelState();
}

class _PrivacyPanelState extends State<PrivacyPanel>
    with SingleTickerProviderStateMixin {
  int? openIndex;
  bool isOpen = true;

  late AnimationController pulseController;
  late Animation<double> pulseAnimation;

  static const panelBlue = Color(0xFF0E3F9A);
  static const topBlue = Color(0xFF2F56A6);
  static const borderBlue = Color(0xFF86D4FF);
  static const paleBlue = Color(0xFFEAF7FF);
  static const bodyGray = Color(0xFFF3F3F3);
  static const activeBlue = Color(0xFF2149A7);

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
  void initState() {
    super.initState();

    pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );

    pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.12,
    ).animate(
      CurvedAnimation(
        parent: pulseController,
        curve: Curves.easeInOut,
      ),
    );

    pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (child, animation) {
          return SizeTransition(
            sizeFactor: animation,
            axis: Axis.horizontal,
            axisAlignment: 1.0,
            child: child,
          );
        },
        child: isOpen
            ? SizedBox(
                key: const ValueKey("open"),
                width: 455,
                child: _buildOpenPanel(),
              )
            : SizedBox(
                key: const ValueKey("closed"),
                width: 58,
                child: _buildClosedPanel(),
              ),
      ),
    );
  }

  /// ================= OPEN PANEL =================
  Widget _buildOpenPanel() {
    return Container(
      key: const ValueKey("panel_open"),
      color: bodyGray,
      child: Column(
        children: [
          /// TOP BAR
          Container(
            height: 68,
            padding:
                const EdgeInsets.symmetric(horizontal: 18),
            color: topBlue,
            child: Row(
              children: [
                const Icon(
                  Icons.shield_outlined,
                  color: Colors.white,
                  size: 22,
                ),
                const SizedBox(width: 10),
                const Text(
                  "Privacy Monitor",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
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
                    size: 22,
                  ),
                ),
              ],
            ),
          ),

          /// INFO STRIP
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 14,
            ),
            color: const Color(0xFFE6F4FF),
            child: const Text(
              "Before you agree, here's what you should know",
              style: TextStyle(
                color: Color(0xFF4D6EA7),
                fontSize: 13,
              ),
            ),
          ),

          const SizedBox(height: 12),

          /// CONTENT
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                    items.length,
                    (i) => _accordion(
                      i,
                      items[i]["title"]!,
                      items[i]["body"]!,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 18),
                    child: Align(
                      alignment:
                          Alignment.centerLeft,
                      child: Text(
                        "Ask AI Questions",
                        style: TextStyle(
                          color: topBlue,
                          fontSize: 16,
                          fontWeight:
                              FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

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
      ),
    );
  }

  /// ================= CLOSED PANEL =================
  Widget _buildClosedPanel() {
    return Container(
      key: const ValueKey("panel_closed"),
      color: const Color(0xFFF8F8F8),
      child: Center(
        child: ScaleTransition(
          scale: pulseAnimation,
          child: InkWell(
            onTap: () {
              setState(() {
                isOpen = true;
              });
            },
            borderRadius:
                BorderRadius.circular(30),
            child: Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color:
                    const Color(0xFF3D7BFF),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.18),
                    blurRadius: 8,
                    offset:
                        const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.shield_outlined,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
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
      padding:
          const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 6,
      ),
      child: Column(
        children: [
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
                  color: expanded
                      ? activeBlue
                      : borderBlue,
                  width:
                      expanded ? 2 : 1,
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    size: 18,
                    color:
                        borderBlue,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style:
                          const TextStyle(
                        fontSize: 15,
                        fontWeight:
                            FontWeight
                                .w500,
                      ),
                    ),
                  ),
                  Icon(
                    expanded
                        ? Icons.remove
                        : Icons.add,
                    color:
                        Colors.grey,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),

          AnimatedCrossFade(
            duration:
                const Duration(
                    milliseconds:
                        250),
            crossFadeState:
                expanded
                    ? CrossFadeState
                        .showSecond
                    : CrossFadeState
                        .showFirst,
            firstChild:
                Container(),

            secondChild:
                Container(
              width:
                  double.infinity,
              padding:
                  const EdgeInsets
                      .all(12),
              decoration:
                  BoxDecoration(
                color:
                    Colors.white,
                border:
                    Border.all(
                  color:
                      borderBlue,
                ),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,
                children: [
                  const Text(
                    "PLAIN LANGUAGE",
                    style:
                        TextStyle(
                      fontSize:
                          13,
                      fontWeight:
                          FontWeight
                              .w700,
                      color:
                          Colors
                              .grey,
                    ),
                  ),

                  const SizedBox(
                      height: 8),

                  Text(
                    body,
                    style:
                        const TextStyle(
                      fontSize:
                          14,
                      height:
                          1.45,
                      color: Colors
                          .black87,
                    ),
                  ),

                  const SizedBox(
                      height: 14),

                  Container(
                    width: double
                        .infinity,
                    padding:
                        const EdgeInsets
                            .all(12),
                    decoration:
                        BoxDecoration(
                      color:
                          paleBlue,
                      border:
                          Border.all(
                        color:
                            borderBlue,
                      ),
                    ),
                    child:
                        const Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [
                        Text(
                          "Things you should know:",
                          style:
                              TextStyle(
                            fontWeight:
                                FontWeight.bold,
                            color:
                                topBlue,
                          ),
                        ),
                        SizedBox(
                            height:
                                8),
                        Text(
                            "• Can I delete my data?"),
                        SizedBox(
                            height:
                                6),
                        Text(
                            "• Who do you share my data with?"),
                        SizedBox(
                            height:
                                6),
                        Text(
                            "• How long do you keep my information?"),
                      ],
                    ),
                  ),

                  const SizedBox(
                      height: 14),

                  const Text(
                    "ORIGINAL LEGAL TEXT",
                    style:
                        TextStyle(
                      fontSize:
                          13,
                      fontWeight:
                          FontWeight
                              .w700,
                      color:
                          Colors
                              .grey,
                    ),
                  ),

                  const SizedBox(
                      height: 8),

                  const Text(
                    "By using our service, you agree to our collection of personal information including but not limited to email addresses, IP addresses, device identifiers, and usage data. We may share this information with third-party service providers for analytics, payment processing, and marketing purposes.",
                    style:
                        TextStyle(
                      fontSize:
                          14,
                      height:
                          1.45,
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
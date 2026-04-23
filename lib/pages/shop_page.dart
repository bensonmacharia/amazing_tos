import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/product_grid.dart';
import '../widgets/cookie_popup.dart';
import '../widgets/privacy_panel.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  bool showCookie = false;
  bool showPanel = false;

  @override
  void initState() {
    super.initState();

    /// Cookie appears first
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      setState(() {
        showCookie = true;
      });
    });

    /// Privacy panel appears 2 seconds later
    Future.delayed(const Duration(milliseconds: 2300), () {
      if (!mounted) return;
      setState(() {
        showPanel = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [
          /// MAIN PAGE
          Column(
            children: const [
              Header(),
              Expanded(
                child: ProductGrid(),
              ),
            ],
          ),

          /// COOKIE POPUP
          Positioned(
            bottom: 20,
            left: 20,
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOutCubic,
              offset:
                  showCookie ? Offset.zero : const Offset(0, 0.40),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: showCookie ? 1 : 0,
                child: const CookiePopup(),
              ),
            ),
          ),

          /// RIGHT PRIVACY PANEL
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOutCubic,
            top: 0,
            bottom: 0,

            /// IMPORTANT FIX:
            right: showPanel ? 0 : -460,

            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 600),
              opacity: showPanel ? 1 : 0,
              child: const PrivacyPanel(),
            ),
          ),
        ],
      ),
    );
  }
}
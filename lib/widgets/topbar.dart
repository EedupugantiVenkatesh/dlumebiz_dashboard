import 'package:flutter/material.dart';
import '../constants/app_strings.dart';

class Topbar extends StatelessWidget {
  final double leftPadding;
  const Topbar({Key? key, this.leftPadding = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final brandFontSize = isMobile ? 18.0 : 26.0;
    final trialFontSize = isMobile ? 10.0 : 14.0;
    final iconSize = isMobile ? 22.0 : 28.0;
    final plusButtonSize = isMobile ? 18.0 : 24.0;
    final avatarRadius = isMobile ? 14.0 : 18.0;
    return Container(
      height: isMobile ? 48 : 64,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
      decoration: const BoxDecoration(
        color: Color(0xFF1A2340), // Dark blue background
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: isMobile ? 40 : leftPadding), // Increased padding for mobile
          // DlumeBiz text on the left
          Text(
            AppStrings.appName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: brandFontSize,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          // Trial text as plain blue text
          Text(
            AppStrings.trialExpiryText,
            style: TextStyle(fontSize: trialFontSize, color: Colors.white),
          ),
          SizedBox(width: isMobile ? 4 : 8),
          // Verified icon as blue circle with white check
          Container(
            width: iconSize + 6,
            height: iconSize + 6,
            // decoration: const BoxDecoration(
            //   color: Colors.blue,
            //   shape: BoxShape.circle,
            // ),
            child: Icon(Icons.verified, color: Colors.blue, size: iconSize - 4),
          ),
          SizedBox(width: isMobile ? 4 : 8),
          // Add user: blue square with white plus
          Container(
            width: plusButtonSize,
            height: plusButtonSize,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Icon(Icons.add, color: Colors.white, size: isMobile ? 16 : 22),
            ),
          ),
          SizedBox(width: isMobile ? 8 : 16),
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: avatarRadius,
            child: Text(AppStrings.userInitial, style: TextStyle(color: Colors.white, fontSize: isMobile ? 14 : 18)),
          ),
        ],
      ),
    );
  }
} 
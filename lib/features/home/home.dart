import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widgets/constants/text_font_style.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _absorbing = true;
  bool _animated = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Widget Practice',
          style: TextFontStyle.headline20OpenSansBold,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              absorpointerWidget(),
              const Gap(20),
              animatedAlignWidget(),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }

  Column animatedAlignWidget() {
    return Column(
      children: [
        Text('Animated Align', style: TextFontStyle.headline20OpenSansBold),
        const Gap(10),
        GestureDetector(
          onTap: () {
            setState(() {
              _animated = !_animated;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            width: double.infinity,
            height: 300.h,
            color: Colors.white,
            child: AnimatedAlign(
              alignment:
                  _animated ? Alignment.bottomCenter : Alignment.topCenter,
              duration: const Duration(seconds: 2),
              curve: Curves.bounceInOut,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FlutterLogo(size: 40.h),
                  const Text('Animated Align')
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Column absorpointerWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 1st Widget AbsorbPointer
        Text('AbsobPointer Widget',
            style: TextFontStyle.headline20OpenSansBold),
        AbsorbPointer(
          absorbing: _absorbing,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  // This button will not be clickable when _absorbing is true
                  log('Button 1 clicked');
                },
                child: const Text('Button 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  // This button will not be clickable when _absorbing is true
                  log('Button 2 clicked');
                },
                child: const Text('Button 2'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _absorbing = !_absorbing;
            });
          },
          child: Text(_absorbing ? 'Enable Buttons' : 'Disable Buttons'),
        ),
      ],
    );
  }
}

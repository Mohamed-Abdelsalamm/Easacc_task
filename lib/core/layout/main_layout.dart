import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easacc_flutter_task/core/routing/app_routes.dart';
import 'package:easacc_flutter_task/core/styles/app_colors.dart';
import 'package:easacc_flutter_task/generated/assets.dart';
import 'package:easacc_flutter_task/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  final Widget child;
  final int currentIndex;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  void didUpdateWidget(MainLayout oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentIndex != oldWidget.currentIndex) {
      setState(() {
        _currentIndex = widget.currentIndex;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        context.go(AppRoutes.kHomeView);
        break;
      case 1:
        context.go(AppRoutes.kHomeView);
        break;
      case 2:
        context.go(AppRoutes.kHomeView);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          clipBehavior: Clip.none,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(
              top: BorderSide(color: AppColors.neutral50, width: 1),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: AppColors.primary500,
            unselectedItemColor: AppColors.neutral600,
            elevation: 0,
            backgroundColor: Colors.transparent,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.assetsImagesSvgsHome03,
                  width: 24.r,
                ),
                activeIcon: SvgPicture.asset(
                  Assets.assetsImagesSvgsHome03Active,
                  width: 24.r,
                ),
                label: S.current.home,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.assetsImagesSvgsTicket02,
                  width: 24.r,
                ),
                activeIcon: SvgPicture.asset(
                  Assets.assetsImagesSvgsTicket02Active,
                  width: 24.r,
                ),
                label: S.current.home,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.assetsImagesSvgsNews,
                  width: 24.r,
                ),
                activeIcon: SvgPicture.asset(
                  Assets.assetsImagesSvgsNewsActive,
                  width: 24.r,
                ),
                label: S.current.home,
              ),
              // BottomNavigationBarItem(
              //   icon: SvgPicture.asset(
              //     Assets.assetsImagesSvgsChatting01,
              //     width: 24.r,
              //   ),
              //   activeIcon: SvgPicture.asset(
              //     Assets.assetsImagesSvgsChatting01Active,
              //     width: 24.r,
              //   ),
              //   label: S.current.chats,
              // ),
              // BottomNavigationBarItem(
              //   icon: SvgPicture.asset(
              //     Assets.assetsImagesSvgsUserCircle,
              //     width: 24.r,
              //   ),
              //   activeIcon: SvgPicture.asset(
              //     Assets.assetsImagesSvgsUserCircleActive,
              //     width: 24.r,
              //   ),
              //   label: S.current.account,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

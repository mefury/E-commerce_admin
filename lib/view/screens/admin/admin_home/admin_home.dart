import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/view/screens/admin/banner.dart';
import 'package:task_manager/view/screens/admin/category.dart';
import 'package:task_manager/view/screens/admin/dashboard.dart';
import 'package:task_manager/view/screens/admin/products.dart';
import 'package:task_manager/view/screens/admin/profile.dart';
import 'package:task_manager/view/screens/admin/userlist.dart';
import 'package:task_manager/view/widget/network_image.dart';

class AdminHome extends StatefulWidget {
  AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final SideMenuController sideMenu = SideMenuController();

  final PageController pageController = PageController();

  @override
  void initState() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      //   centerTitle: true,
      // ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: sideMenu,
            style: SideMenuStyle(
              // showTooltip: false,
              displayMode: SideMenuDisplayMode.auto,
              showHamburger: true,
              hoverColor: Colors.blue[100],
              selectedHoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              // backgroundColor: Colors.grey[200]
            ),
            title: const Column(
              children: [
                // ConstrainedBox(
                //   constraints: const BoxConstraints(
                //     maxHeight: 150,
                //     maxWidth: 150,
                //   ),
                //   child: Image.asset(
                //     'assets/images/easy_sidemenu.png',
                //   ),
                // ),
                CustomNetworkImage(
                    imageUrl:
                        "https://images.unsplash.com/photo-1620288627223-53302f4e8c74?q=80&w=1528&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    height: 150,
                    width: 150),
                Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.lightBlue[50],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  child: Text(
                    'mohada',
                    style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                  ),
                ),
              ),
            ),
            items: [
              SideMenuItem(
                title: 'Dashboard',
                onTap: (index, _) {
                  print("Index=============$index");
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.home),
                tooltipContent: "This is a tooltip for Dashboard item",
              ),
              SideMenuItem(
                title: 'Banner',
                onTap: (index, _) {
                  print("Index=============$index");
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.branding_watermark),
              ),

              SideMenuItem(
                title: 'Category',
                onTap: (index, _) {
                  print("Index=============$index");
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.category),
              ),
              SideMenuItem(
                title: 'Product',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.inventory),
              ),
              // SideMenuItem(
              //   builder: (context, displayMode) {
              //     return const Divider(
              //       endIndent: 8,
              //       indent: 8,
              //     );
              //   },
              // ),
              SideMenuItem(
                title: 'User List',
                onTap: (index, _) {
                  sideMenu.changePage(index);
                },
                icon: const Icon(Icons.people),
              ),

              const SideMenuItem(
                title: 'Profile',
                icon: Icon(Icons.person_pin),
              ),
            ],
          ),
          const VerticalDivider(
            width: 0,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                DashboardScreen(),
                BannerScreen(),
                CategoryScreen(),
                ProductScreen(),
                UserlistScreen(),
                ProfileScreen()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

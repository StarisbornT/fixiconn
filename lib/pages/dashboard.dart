import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mini_app_screen.dart';

class DashboardScreen extends StatefulWidget {
  static String id = 'dashboard_screen';
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 2; // Default to the middle tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/girl_back.png', // Replace with your actual image asset
              fit: BoxFit.cover,
            ),
          ),
          // AppBar-like row at the top
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu, color: Colors.white),
                Row(
                  children: [
                    _buildTab("LIVE", false),
                    _buildTab("Following", false),
                    _buildTab("For You", true), // Highlight the active tab
                  ],
                ),
                Icon(Icons.search, color: Colors.white),
              ],
            ),
          ),
          // Content in the middle
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/shop.png'),
                          SizedBox(width: 5,),
                          Text(
                            'Shop • 4',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Username',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  )

                ),
                SizedBox(height: 4),
                Text(
                  'This happens to be a great match!...see more',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(CupertinoIcons.double_music_note, color: Colors.white, size: 16,),
                          SizedBox(width: 5,),
                          Text(
                            'Falz • How Many (fe...',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/magicpen.png'),
                          SizedBox(width: 5,),
                          Text(
                            'Effect Name',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // Side buttons
          Positioned(
            right: 20,
            bottom: 10,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/user.png'), // Replace with your avatar image
                ),
                SizedBox(height: 15),
                _buildSideButton(Icons.favorite_border, "1.2k"),
                SizedBox(height: 15),
                _buildSideButton(CupertinoIcons.chat_bubble_text, "17"),
                SizedBox(height: 15),
                _buildSideButton(Icons.bookmark_border, "12"),
                SizedBox(height: 15),
                _buildSideButton(Icons.share, "24"),
                SizedBox(height: 15),
                Image.asset('assets/music.png')
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MiniAppScreen()),
                );
              }
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.layers_outlined),
                label: 'Mini Apps',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_text),
                label: 'Messages',
              ),
              // Placeholder for the center icon
              BottomNavigationBarItem(
                icon: SizedBox.shrink(),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                label: 'Profile',
              ),
            ],
          ),

          // Floating Plus Icon
          Positioned(
            top: 3, // Adjust the height above the BottomNavigationBar
            left: MediaQuery.of(context).size.width / 2 - 30, // Center align the button
            child: GestureDetector(
              onTap: () {
                // Define action for the Plus button here
                print('Plus icon tapped');
              },
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF5ADBED), Color(0xFF29AED8) ], // Adjust colors as per design.
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      width: 2.0, // Border thickness
                      color: Colors.transparent, // Transparent color to let the gradient show
                    ),
                    gradient: null, // No gradient for the border directly
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 35,
                  ),
                ),

              ),
            ),
          ),
        ],
      ),

    );
  }

  Widget _buildTab(String label, bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.white,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildSideButton(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}

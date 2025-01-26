import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MiniAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F172A), // Background color
      body: Stack(
        children: [
          // Background Banner
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 350, // Fixed height for the banner
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/banner.png'), // Replace with your header image asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Foreground Content
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Spacer to place content below the banner
                  const SizedBox(
                      height: 350), // Matches the height of the banner

                  // Trending Section
                  _buildSectionTitle('Trending', 'Trending games from 30 days'),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10, // Replace with dynamic count
                      itemBuilder: (context, index) {
                        return _buildGameCard('Game ${index + 1}');
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Categories Section
                  _buildSectionTitle('Categories'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: List.generate(5, (index) {
                        return ListTile(
                          leading: Image.asset(
                            'assets/back.png', // Replace with your game icon asset
                            width: 50,
                            height: 50,
                          ),
                          title: Text(
                            'Game ${index + 1}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: const Text(
                            'Hello game',
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Recently Opened Section
                  _buildSectionTitle('Recently Opened',
                      'Here are some of your recently played games'),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5, // Replace with dynamic count
                      itemBuilder: (context, index) {
                        return _buildGameCard('Game ${index + 1}');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Header Overlay (Optional)
          Positioned(
            top: 16,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_circle_left_outlined,
                        color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'MiniApps',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Color(0xFFF0F4F8),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search,
                            color: Colors.white, size: 24),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.food_bank,
                            color: Colors.white, size: 24),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: CircleAvatar(
                          backgroundImage: AssetImage('assets/user.png'),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, [String? subtitle]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:  GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            )
          ),
          if (subtitle != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                subtitle,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Color(0xFF93A2B7),
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                  ),
                )
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildGameCard(String gameName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage(
                    'assets/back.png'), // Replace with your game card asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          // const SizedBox(height: 1),
          Text(
            gameName,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/screens/newsdetail.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedFilter = 'Healthy'; // Default selected filter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Dogecoin to the Moon...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.transparent, // Transparent fill color
                ),
                style: TextStyle(color: Colors.white70),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.notifications),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest News',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewsDetailScreen()),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'See All',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            NewsCard(
              title: 'Crypto investors should be prepared to lose all their money, BOE governor says',
              author: 'Ryan Browne',
              date: '',
              imageUrl: 'assets/first.png',
              isFirst: true,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    FilterButton(
                      label: 'Healthy',
                      isSelected: _selectedFilter == 'Healthy',
                      onPressed: () {
                        setState(() {
                          _selectedFilter = 'Healthy';
                        });
                      },
                    ),
                    FilterButton(
                      label: 'Technology',
                      isSelected: _selectedFilter == 'Technology',
                      onPressed: () {
                        setState(() {
                          _selectedFilter = 'Technology';
                        });
                      },
                    ),
                    FilterButton(
                      label: 'Finance',
                      isSelected: _selectedFilter == 'Finance',
                      onPressed: () {
                        setState(() {
                          _selectedFilter = 'Finance';
                        });
                      },
                    ),
                    FilterButton(
                      label: 'Arts',
                      isSelected: _selectedFilter == 'Arts',
                      onPressed: () {
                        setState(() {
                          _selectedFilter = 'Arts';
                        });
                      },
                    ),
                    FilterButton(
                      label: 'Sports',
                      isSelected: _selectedFilter == 'Sports',
                      onPressed: () {
                        setState(() {
                          _selectedFilter = 'Sports';
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                NewsCard(
                  title: '5 things to know about the ‘conundrum’ of lupus',
                  author: 'Matt Villano',
                  date: 'Sunday, 9 May 2021',
                  imageUrl: 'assets/second.png',
                ),
                NewsCard(
                  title: '4 ways families can ease anxiety during the pandemic',
                  author: 'Zain Jaffer',
                  date: 'Monday, 10 May 2021',
                  imageUrl: 'assets/third.png',
                ),
                NewsCard(
                  title: 'Wedding during the pandemic',
                  author: 'Nada Amr',
                  date: '4-2-2004',
                  imageUrl: 'assets/forth.png',
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String author;
  final String date;
  final String imageUrl;
  final bool isFirst;

  NewsCard({
    required this.title,
    required this.author,
    required this.date,
    required this.imageUrl,
    this.isFirst = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: isFirst ? 250 : 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: isFirst ? 250 : 150,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  'by $author',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                if (date.isNotEmpty) ...[
                  SizedBox(height: 4.0),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  FilterButton({
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black, backgroundColor: isSelected ? Colors.red : Colors.grey[300], // Text color
        ),
        child: Text(label),
      ),
    );
  }
}

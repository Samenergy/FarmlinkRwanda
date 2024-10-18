import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Step 1: Define the main app widget, which will be the root of the app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Step 2: Set up the MaterialApp with NotificationsPage as the home screen
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide the debug banner
      home: NotificationsPage(), // The main content of the app
    );
  }
}

// Step 3: Create the NotificationsPage widget that will show the notifications
class NotificationsPage extends StatelessWidget {
  // Step 4: Define a list of notifications
  final List<Map<String, String>> notifications = [
    {
      'title': 'Richard Asimwe just bought 25kg of Rice',
      'leftImage': 'assets/user.jpeg',
      'rightImage': 'assets/rice.jpeg',
      'time': 'New',
    },
    {
      'title':
          'Your shipment of 200 kg of tomatoes has been confirmed for purchase by FreshMarket Grocers. Prepare for pickup!',
      'leftImage': 'assets/user2.jpeg',
      'rightImage': 'assets/tomatoes.jpeg',
      'time': 'New',
    },
    {
      'title':
          'Congratulations! Your sale of 500 kg of rice to Urban Grocers has been successfully completed.',
      'leftImage': 'assets/user3.jpeg',
      'rightImage': 'assets/rice.jpeg',
      'time': 'Last 7 days',
    },
    {
      'title':
          'Unfortunately, your order of 30 kg of carrots was cancelled by the buyer due to unforeseen circumstances.',
      'leftImage': 'assets/user4.jpeg',
      'rightImage': 'assets/carrots.jpeg',
      'time': 'Last 7 days',
    },
    {
      'title':
          'You\'ve received a payment of \$500 for your recent delivery of beans.',
      'leftImage': 'assets/user5.jpeg',
      'rightImage': 'assets/beans.jpeg',
      'time': 'Last 30 days',
    },
    {
      'title': 'FreshMarket Grocers just gave a 5 Star rating. Good Job!',
      'leftImage': 'assets/user6.jpeg',
      'rightImage': 'assets/stars.jpeg',
      'time': 'Last 30 days',
    },
    // New notifications added below
    {
      'title': 'Your 10kg of Apples has been received by Urban Grocers.',
      'leftImage': 'assets/user7.jpeg',
      'rightImage': 'assets/apples.jpeg',
      'time': 'Last 7 days',
    },
    {
      'title': 'The 20kg of Oranges you ordered has been delivered!',
      'leftImage': 'assets/user8.jpeg',
      'rightImage': 'assets/oranges.jpeg',
      'time': 'Last 30 days',
    },
    {
      'title': 'FreshMarket Grocers has requested 100kg of Bananas.',
      'leftImage': 'assets/user9.jpeg',
      'rightImage': 'assets/bananas.jpeg',
      'time': 'New',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Step 5: Group notifications by their 'time' (e.g., New, Last 7 days)
    Map<String, List<Map<String, String>>> groupedNotifications = {};
    for (var notification in notifications) {
      if (groupedNotifications[notification['time']!] == null) {
        groupedNotifications[notification['time']!] = [];
      }
      groupedNotifications[notification['time']!]?.add(notification);
    }

    // Step 6: Build the Scaffold widget to structure the page
    return Scaffold(
      body: Column(
        children: [
          // Step 7: Create the title section ("Notifications")
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Notifications', // Title
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // Step 8: Use Expanded to fill the remaining space with a scrollable list
          Expanded(
            child: ListView(
              // Step 9: Map over the grouped notifications to display each group (New, Last 7 days, etc.)
              children: groupedNotifications.keys.map((timeKey) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Step 10: Display the group header (timeKey like "New", "Last 7 days", etc.)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          timeKey, // Group title (time)
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black, // Set the text color to black
                          ),
                        ),
                      ),
                      SizedBox(
                          height:
                              5), // Small spacing between title and notifications
                      // Step 11: Map over the notifications in each group
                      Column(
                        children:
                            groupedNotifications[timeKey]!.map((notification) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Step 12: Display the left circular image (using AssetImage)
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage(notification['leftImage']!),
                                ),
                                SizedBox(
                                    width:
                                        10), // Spacing between image and text
                                // Step 13: Display the notification title text
                                Expanded(
                                  child: Text(
                                    notification[
                                        'title']!, // Notification title
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        10), // Spacing between text and right image
                                // Step 14: Display the right circular image (using AssetImage)
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage(notification['rightImage']!),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      // Step 15: Add the Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType
            .fixed, // Allows 4+ items in the navigation bar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFFBDB8B8)), // Home icon
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(Icons.shopping_bag, color: Color(0xFFBDB8B8)), // Shop icon
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications,
                color: Color(0xFFBDB8B8)), // Notifications icon
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xFFBDB8B8)), // Profile icon
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.green, // Selected icon color
        unselectedItemColor:
            const Color.fromARGB(255, 33, 35, 33), // Unselected icon color
        showUnselectedLabels: true, // Show labels for unselected items
      ),
    );
  }
}

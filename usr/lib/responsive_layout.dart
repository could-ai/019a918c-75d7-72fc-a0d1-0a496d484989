import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Layout Demo'),
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // If the screen width is less than 600 pixels, display a Column (mobile view)
          if (constraints.maxWidth < 600) {
            return ListView(
              children: <Widget>[
                _buildInfoCard(Colors.red, 'Section 1', 'This is the first section, displayed vertically on smaller screens.'),
                _buildInfoCard(Colors.green, 'Section 2', 'This is the second section, stacked below the first one.'),
                _buildInfoCard(Colors.blue, 'Section 3', 'This is the third section, providing more content in the list.'),
              ],
            );
          } else {
            // If the screen width is 600 pixels or more, display a Row (desktop view)
            return const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: InfoPanel(
                    color: Colors.red,
                    title: 'Panel 1',
                    description: 'This is the first panel, displayed horizontally on wider screens for a desktop-like experience.',
                  ),
                ),
                Expanded(
                  child: InfoPanel(
                    color: Colors.green,
                    title: 'Panel 2',
                    description: 'This is the second panel, appearing next to the first one to utilize the available horizontal space.',
                  ),
                ),
                Expanded(
                  child: InfoPanel(
                    color: Colors.blue,
                    title: 'Panel 3',
                    description: 'This is the third panel, completing the row layout for larger screens.',
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  // Helper method to build cards for the mobile layout
  Widget _buildInfoCard(Color color, String title, String description) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: color.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// A widget for the desktop layout panels
class InfoPanel extends StatelessWidget {
  final Color color;
  final String title;
  final String description;

  const InfoPanel({
    super.key,
    required this.color,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            description,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

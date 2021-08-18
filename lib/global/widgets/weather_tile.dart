import 'package:flutter/material.dart';

class WeatherTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String subtitle;

  const WeatherTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.purple,
          ),
        ],
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Color(0xff9e9e9e)),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.transparent,
      width: size.width,
      height: size.height * 0.35,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
              mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
              ">_DEVJJ",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0, fontFamily: 'Roboto',),
              textAlign: TextAlign.left,
            ),
          ],
        ), 
          _buildCardColumn(
            "Localização ",
            "Pará, Brazil",
            icon: Icons.location_on,
            width: 250,
            height: 150,
          ),
          _buildCardColumn(
            "E-mail ",
            "oliveirajoaopdr@gmail.com",
            icon: Icons.mail,
            width: 250,
            height: 150,
          ),
          _buildCardColumn(
            "Celular/Whatsapp",
            "+55 (91)992298140",
            icon: Icons.contact_phone,
            width: 250,
            height: 150,
          ),
        ],
      ),
    );
  }

  Widget _buildCardColumn(
    String title,
    String content, {
    required IconData icon,
    required double width,
    required double height,
  }) {
    return Card(
      elevation: 5,
      color: const Color.fromARGB(50, 255, 255, 255),
      child: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
                  const SizedBox(height: 25),
                  Text(
                    content,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenery/screens/widgets/custom_appbar_widget.dart';
import 'package:greenery/screens/widgets/custom_elevated_button.dart';
import 'package:greenery/screens/widgets/custom_text.dart';

class SelerProfileScreen extends StatelessWidget {
  const SelerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(title: "Seller Profile"),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: Transform(
                          transform: Matrix4.skewY(-0.2),
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.green[200],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50,
                        left: MediaQuery.of(context).size.width / 2 - 50,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/image.png'),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  Text(
                    'Maria Sharapova',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Name :',
                                style: TextStyle(color: Colors.grey[700])),
                            Text('Maria Sharapova',
                                style: TextStyle(color: Colors.black)),
                            Icon(Icons.person),
                          ],
                        ),
                        Divider(
                          thickness: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Location :',
                                style: TextStyle(color: Colors.grey[700])),
                            Text('Sreekrishnapuram',
                                style: TextStyle(color: Colors.black)),
                            Icon(Icons.location_on),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomElevatedButton(
                  onPressed: () {},
                  label: "Message",
                  width: MediaQuery.of(context).size.width / 2.3,
                ),
                SizedBox(width: 2),
                CustomElevatedButton(
                  onPressed: () {},
                  label: "Pay",
                  width: MediaQuery.of(context).size.width / 2.3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

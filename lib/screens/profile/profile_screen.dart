import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenery/screens/widgets/custom_appbar_widget.dart';
import 'package:greenery/screens/widgets/custom_elevated_button.dart';
import 'package:greenery/screens/widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBarWidget(title: "Profile"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Add padding or margin to ensure the element starts below the AppBar
            const SizedBox(
                height: kToolbarHeight + 30), // Height of AppBar + some padding
            Stack(
              children: [
                Transform(
                  transform: Matrix4.skewY(-0.2),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://storage.googleapis.com/a1aa/image/tKsx6upfwtyOaKRjoGPepR7JirevLMVbOka4vMLCJvfUIarPB.jpg'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 0),
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
                      Text('Name :', style: TextStyle(color: Colors.grey[700])),
                      Text('Maria Sharapova',
                          style: TextStyle(color: Colors.black)),
                      Icon(Icons.edit),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Email :',
                          style: TextStyle(color: Colors.grey[700])),
                      Text('Emma@gmail.com',
                          style: TextStyle(color: Colors.black)),
                      Icon(Icons.edit),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
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
                      Text('Phone :',
                          style: TextStyle(color: Colors.grey[700])),
                      Text('777777777', style: TextStyle(color: Colors.black)),
                      Icon(Icons.edit),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Location :',
                          style: TextStyle(color: Colors.grey[700])),
                      Text('Sreekrishnapuram',
                          style: TextStyle(color: Colors.black)),
                      Icon(Icons.edit),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[200],
                padding: EdgeInsets.symmetric(horizontal: 200, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 333.w,
                  width: double.infinity,
                  child: Image(
                      image: NetworkImage(
                          "https://s3-alpha-sig.figma.com/img/d6ac/5486/83d176e34ebdef5d1ce493934f8c8ba8?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AjTw4s5LfvusPM4n2xXx4VmM9Ks0220jEkCBlV-4B74qdaBDDGtWl8tDPxfYlTLNmf6BArTgMcO~oV1Z99pSPYF~EWyPFddFvESwP8B-tloTX7DXxCC7j65GYKZ6Z8NOvjEH-gL~2zV48Ujbk4l7Q4QbKkUPPj3vEqVXHL8GGZ1JO4U3FrRUB4xNG5zMYRCKCMnACrmq7JsU~82rpCx6E-jLj3h8-Re15dWPM4v5HvK81A8f8Jm6NDWfWresJjyY0Qs-htHyyqv1E9QUqNVA5eYph4PnqKZf5rHV3-UcrprsM9zrXVlgKp55JDLW3wfkkpRpH2FEnR-BCpBSWw0GEw__")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

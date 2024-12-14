import 'package:flutter/material.dart';

Icon MessageStatusIcon(String status, double size) {
  switch (status) {
    case 'sent':
      return Icon(
        Icons.check,
        size: size,
      );
    case 'received':
      return Icon(
        Icons.done_all,
        size: size,
      );
    case 'seen':
      return Icon(
        Icons.done_all,
        size: size,
        color: Colors.blue,
      );

    default:
      return Icon(
        Icons.access_time,
        size: size,
      );
  }
}

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int likes(PostsRecord post) {
  // Add your function code here!
  // Ok
  return post.likes.length;
}

bool mediaUploaded(String imagePath) {
  // Add your function code here!
  return imagePath != null && imagePath.isNotEmpty;
}

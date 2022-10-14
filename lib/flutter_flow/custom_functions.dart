import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int useful(PostsRecord? post) {
  return post!.useful!.length;
}

bool hasUploadedPhoto(String? mediaPath) {
  return mediaPath != null && mediaPath.isNotEmpty;
}

double ratingSummary(
  double totalRatings,
  double rating,
) {
  // get average rating to one decimal point from list of reviews
  if (totalRatings > 0) {
    return (rating +
            (totalRatings - rating) ~/ math.max((totalRatings ~/ 5), 1)) /
        2;
  } else {
    return rating;
  }
}

String ratingSummaryList(List<ReviewsRecord> rating) {
  if (rating.isEmpty) {
    return '-';
  }
  var ratingsSum = 0.0;
  for (final comment in rating) {
    ratingsSum += comment.rating!;
  }
  return (ratingsSum / rating.length).toStringAsFixed(1);
}

double negativeValue(double value) {
  return value * -1;
}

double percentage(double valuePrice) {
  return valuePrice * 0.1;
}

bool hasUploadedDoc(String? pdfPath) {
  return pdfPath != null && pdfPath.isNotEmpty;
}

int negValueInteger(int value) {
  return value * -1;
}

double multiply100(double valueSum) {
  return valueSum * 100;
}

double sumValues(
  double value,
  double value2,
) {
  return value + value2;
}

int numFollowers(UsersRecord? user) {
  return user!.followers!.length;
}

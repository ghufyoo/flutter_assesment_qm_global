import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final loadingWidget = Platform.isAndroid
    ? const CircularProgressIndicator(
        color: Colors.amber,
      )
    : const CupertinoActivityIndicator(
        color: Colors.amber,
      );
const errorWidget = Row(
  children: [Icon(Icons.warning_rounded), Text("Oops! Something went wrong")],
);
const successWidget = Row(
  children: [Icon(Icons.check_circle_rounded), Text("Success!")],
);

enum LoadingStatus { loading, success, empty, error, eventless }

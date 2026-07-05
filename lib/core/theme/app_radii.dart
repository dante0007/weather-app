import 'package:flutter/material.dart';

/// Corner radii from the design file (16–20).
abstract final class AppRadii {
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;

  static const BorderRadius card = BorderRadius.all(Radius.circular(md));
  static const BorderRadius cardLg = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius pill = BorderRadius.all(Radius.circular(999));
}

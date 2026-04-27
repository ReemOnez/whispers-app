import 'package:flutter/material.dart';

/// Border-radius tokens — Nocturne design system
abstract final class AppRadius {
  static const double smValue   = 8.0;
  static const double defValue  = 16.0;
  static const double mdValue   = 24.0; // Cards
  static const double lgValue   = 32.0; // Large Cards
  static const double xlValue   = 48.0;
  static const double fullValue = 9999.0; // Buttons, inputs

  static const Radius sm   = Radius.circular(smValue);
  static const Radius def  = Radius.circular(defValue);
  static const Radius md   = Radius.circular(mdValue);
  static const Radius lg   = Radius.circular(lgValue);
  static const Radius xl   = Radius.circular(xlValue);
  static const Radius full = Radius.circular(fullValue);

  static const BorderRadius brSm   = BorderRadius.all(sm);
  static const BorderRadius brDef  = BorderRadius.all(def);
  static const BorderRadius brMd   = BorderRadius.all(md);
  static const BorderRadius brLg   = BorderRadius.all(lg);
  static const BorderRadius brXl   = BorderRadius.all(xl);
  static const BorderRadius brFull = BorderRadius.all(full);
}

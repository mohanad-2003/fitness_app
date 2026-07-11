import 'package:flutter/widgets.dart';

/// Shared form validators, previously duplicated near-verbatim across
/// login/signup/forgot-password/set-password controllers.
abstract final class Validators {
  static final _emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    if (!_emailPattern.hasMatch(value)) return 'Please enter a valid email';
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  static String? required(String? value, {String field = 'This field'}) {
    if (value == null || value.trim().isEmpty) return '$field is required';
    return null;
  }

  static String? Function(String?) matches(
    TextEditingController other, {
    String mismatchMessage = 'Passwords do not match',
  }) {
    return (value) {
      if (value == null || value.isEmpty) return 'This field is required';
      if (value != other.text) return mismatchMessage;
      return null;
    };
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Controls the selected tab index for MainNavigation
final navigationIndexProvider = StateProvider<int>((ref) => 0);

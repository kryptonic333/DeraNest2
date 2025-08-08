import 'package:deranest/core/data/local_storage.dart' ;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sizeProvider = StateProvider<ScreenSizes>((ref) {
  return ScreenSizes(
    screenWidth: LocalStorage.screenWidth,
    screenHeight: LocalStorage.screenHeight,
    topSafeArea: LocalStorage.topSafeArea,
  );
});

class ScreenSizes {
  final double screenWidth;
  final double screenHeight;
  final double topSafeArea;

  const ScreenSizes({
    required this.screenWidth,
    required this.screenHeight,
    required this.topSafeArea,
  });
}

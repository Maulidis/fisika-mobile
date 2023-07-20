import 'package:get/get.dart';

import '../views/emulator_view.dart';

class LabVirtualController extends GetxController {
  final List<String> waktuList = [
    'Taman Seluncur Energi',
    'Bentuk dan Perubahan Energi',
    'Efek rumah kaca',
  ];

  final Map<String, String> topikMap1 = {
    'Taman Seluncur Energi': '1. Conservation of Energy',
    'Bentuk dan Perubahan Energi': '1. Potential Energy',
    'Efek rumah kaca': '1. Thermal Energy',
  };

  final Map<String, String> topikMap2 = {
    'Taman Seluncur Energi': '2. Kinetic Energy',
    'Bentuk dan Perubahan Energi': '2. Kinetic Energy',
    'Efek rumah kaca': '2. Kinetic Energy',
  };

  final Map<String, String> topikMap3 = {
    'Taman Seluncur Energi': '3. Thermal Energy',
    'Bentuk dan Perubahan Energi': '3. Thermal Energy',
    'Efek rumah kaca': '3. Thermal Energy',
  };

  final Map<String, String> topikMap4 = {
    'Taman Seluncur Energi': '4.Thermal Energy',
    'Bentuk dan Perubahan Energi': '4. Thermal Energy',
    'Efek rumah kaca': '4. Thermal Energy',
  };

  void showEmulator(String waktu) {
    // Tampilkan emulator dengan waktu yang dipilih
    String? url;
    if (waktu == 'Taman Seluncur Energi') {
      url =
          'https://phet.colorado.edu/sims/html/energy-skate-park/latest/energy-skate-park_all.html';
    } else if (waktu == 'Bentuk dan Perubahan Energi') {
      url =
          'https://phet.colorado.edu/sims/html/energy-forms-and-changes/latest/energy-forms-and-changes_all.html';
    } else if (waktu == 'Efek rumah kaca') {
      url =
          'https://phet.colorado.edu/sims/html/greenhouse-effect/latest/greenhouse-effect_all.html';
    }
    if (url != null) {
      Get.to(EmulatorScreen(url: url));
    }
  }
}

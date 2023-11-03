import 'package:flutter/material.dart';

class Authentication {
  static Future<bool> authenticate() async {
    /*bool isJailbroken = await checkForJailbreak();

    if(!isJailbroken){
      final LocalAuthentication localAuthentication = LocalAuthentication();

      bool isAuthenticated = false;

      try {
        isAuthenticated = await localAuthentication.authenticate(
            localizedReason: 'Please complete the biometrics to proceed.',
            options: const AuthenticationOptions(biometricOnly: false, stickyAuth: true)
        );
      } on PlatformException catch (e) {
        return false;
      }

      return isAuthenticated;
    } else {
      return false;
    }*/

    return true;
  }

  static Future<bool> authenticateWithBiometrics() async {
    /*bool isJailbroken = await checkForJailbreak();
    bool isBiometricSupported = await checkBiometricSupport();

    if(!isJailbroken && isBiometricSupported){
      final LocalAuthentication localAuthentication = LocalAuthentication();

      bool isAuthenticated = false;

      try {
        isAuthenticated = await localAuthentication.authenticate(
            localizedReason: 'Please complete the biometrics to proceed.',
            options: const AuthenticationOptions(biometricOnly: true, stickyAuth: true)
        );
      } on PlatformException catch (e) {
        return false;
      }

      return isAuthenticated;
    } else {
      return false;
    }
  }

  static Future<bool> checkBiometricSupport() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();

    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    if(!isBiometricSupported) {
      return false;
    }

    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;
    if(!canCheckBiometrics) {
      return false;
    }

    List<BiometricType> biometricTypes = await localAuthentication.getAvailableBiometrics();
    if(biometricTypes.isEmpty) {
      return false;
    }*/

    return true;
  }

  static Future<bool> checkForJailbreak() async {
    //return await FlutterJailbreakDetection.jailbroken;
    return false;
  }

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.grey,
      content: Text(
        content,
        style: const TextStyle(color: Colors.white, letterSpacing: 0.5),
      ),
    );
  }
}
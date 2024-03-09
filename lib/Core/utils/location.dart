import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  Future<Position> getLocation() async {
    try {
      if (await _checkLocationPermission()) {
        return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
        );
      } else {
        throw LocationPermissionException("تم رفض الوصول الي الموقع");
      }
    } catch (e) {
      throw LocationServiceException("فشل في الحصول علي الموقع");
    }
  }

  Future<bool> _checkLocationPermission() async {
    var status = await Permission.location.status;
    if (status == PermissionStatus.granted) {
      return true;
    } else if (status == PermissionStatus.denied) {
      var result = await Permission.location.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else {
        var result = await Permission.location.request();
        if (result == PermissionStatus.granted) {
          return true;
        } else {
          var result = await Permission.location.request();
          if (result == PermissionStatus.granted) {
            return true;
          } else {
            var result = await Permission.location.request();
            if (result == PermissionStatus.granted) {
              return true;
            }
            return false;
          }
        }
      }
    }
    return false;
  }
}

class LocationPermissionException implements Exception {
  final String message;
  LocationPermissionException(this.message);
}

class LocationServiceException implements Exception {
  final String message;
  LocationServiceException(this.message);
}

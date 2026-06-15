import 'package:permission_handler/permission_handler.dart' as ph;
import 'app_permission.dart';
import 'app_permission_status.dart';
import 'permission_manager.dart';

class PermissionManagerImpl implements PermissionManager {
  static const Map<AppPermission, ph.Permission> _registry = {
    AppPermission.microphone: ph.Permission.microphone,
    AppPermission.notifications: ph.Permission.notification,
  };

  ph.Permission _mapPermission(AppPermission permission) {
    final phPermission = _registry[permission];
    if (phPermission == null) {
      throw UnimplementedError(
        'Permission $permission is not registered in PermissionManagerImpl static registry.',
      );
    }
    return phPermission;
  }

  AppPermissionStatus _mapStatus(ph.PermissionStatus status) {
    switch (status) {
      case ph.PermissionStatus.granted:
        return AppPermissionStatus.granted;
      case ph.PermissionStatus.denied:
        return AppPermissionStatus.denied;
      case ph.PermissionStatus.permanentlyDenied:
        return AppPermissionStatus.permanentlyDenied;
      case ph.PermissionStatus.restricted:
        return AppPermissionStatus.restricted;
      case ph.PermissionStatus.limited:
        return AppPermissionStatus.limited;
      case ph.PermissionStatus.provisional:
        return AppPermissionStatus.granted; // Provisional notifications count as granted
    }
  }

  @override
  Future<AppPermissionStatus> getPermissionStatus(AppPermission permission) async {
    final status = await _mapPermission(permission).status;
    return _mapStatus(status);
  }

  @override
  Future<AppPermissionStatus> requestPermission(AppPermission permission) async {
    final status = await _mapPermission(permission).request();
    return _mapStatus(status);
  }

  @override
  Future<bool> openSettings() {
    return ph.openAppSettings();
  }
}

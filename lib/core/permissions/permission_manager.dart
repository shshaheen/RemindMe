import 'app_permission.dart';
import 'app_permission_status.dart';

abstract class PermissionManager {
  Future<AppPermissionStatus> getPermissionStatus(AppPermission permission);
  Future<AppPermissionStatus> requestPermission(AppPermission permission);
  Future<bool> openSettings();
}

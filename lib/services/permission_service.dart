import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class PermissionService {
  Future<bool> requestStoragePermission() async {
    if (kIsWeb) return true;
    
    if (Platform.isAndroid) {
      // Đối với Android 13 trở lên (API 33+), cần xin quyền audio thay vì storage
      // Ở đây ta xin cả 2 để đảm bảo tương thích mọi đời máy
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
        Permission.audio,
      ].request();
      
      return statuses[Permission.storage]!.isGranted || 
             statuses[Permission.audio]!.isGranted;
    }
    
    var status = await Permission.storage.status;
    if (status.isGranted) return true;
    status = await Permission.storage.request();
    return status.isGranted;
  }

  Future<bool> requestAudioPermission() async {
    if (kIsWeb) return true;
    if (await Permission.audio.isGranted) return true;
    var status = await Permission.audio.request();
    return status.isGranted;
  }
}

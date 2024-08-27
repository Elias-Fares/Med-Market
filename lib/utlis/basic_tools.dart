

class BasicTools{



//   static Future<bool> getStoragePermission()async{
//     if (Platform.isIOS) {

//      var photo= await  Permission.photos.request().isGranted;

//       var storage= await Permission.storage.status.isGranted;
//       return (photo&&storage);


//     } else {
//       bool storage = true;
//       bool photos = true;

//       DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

//       if (androidInfo.version.sdkInt >= 33) {

//         if(await Permission.photos.status.isGranted){
//           return true;
//         }else if(await Permission.photos.request().isPermanentlyDenied){
//           openAppSettings();
//           return false;
//         }else if (await Permission.photos.request().isDenied){
//           return false;
//         }

//       }
// // Only check for storage > Android 13
//       else {
//         if(await Permission.storage.status.isGranted) {
//           return true;
//         } else if (await Permission.storage.request().isPermanentlyDenied){
//           openAppSettings();
//           return false;
//         }
//         else if (await Permission.storage.request().isDenied){
//           return false;
//         }

//       }

//       return false;}
//   }


}
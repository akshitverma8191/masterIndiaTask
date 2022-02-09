import 'package:masterindiatask/data/gst_data.dart';
import 'package:masterindiatask/model/gst_user.dart';

class Api {
  Future getGstUser(String id) async {
    await Future.delayed(Duration(seconds: 1));
    List keys = gstUserDataMap.keys.toList();
    if (keys.contains(id)) {
      return GstUserModel(id: id, object: gstUserDataMap[id] ?? {});
    }
    return null;
  }
}

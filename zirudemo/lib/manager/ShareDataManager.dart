class ShareDataManager {
  Map map = new Map();

  bool setSharedData(String strKey, String strValue) {
    map[strKey] = strValue;
    return true;
  }

  String getSharedData(String strKey) {
    String result = "";
    if (map.containsKey(strKey)) {
      result = map[strKey];
    }
    return result;
  }

  bool deleteSharedData(String strKey) {
    if (map.containsKey(strKey)) {
      map.remove(strKey);
    }
    return true;
  }
}

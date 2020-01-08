class ShareDataManager{


Map map=new Map();

   setSharedData(String strKey, String strValue) {
        map[strKey]=strValue;
    }


    String getSharedData(String strKey) {
        String result = "";
        if (map.containsKey(strKey)) {
            result = map[strKey];
        }
        return result;
    }

    deleteSharedData(String strKey) {
        if (map.containsKey(strKey)) {
            map.remove(strKey);
        }
    }
  
}
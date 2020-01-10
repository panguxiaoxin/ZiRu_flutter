import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zirudemo/ZRConstants.dart';
import 'package:zirudemo/clientengine/form/ZiRuWebForm.dart';
import 'package:zirudemo/manager/FormListManager.dart';
import 'package:zirudemo/manager/FormViewManager.dart';
import 'package:zirudemo/manager/ShareDataManager.dart';
import 'package:zirudemo/manager/SpManager.dart';
import 'package:package_info/package_info.dart';

class ClientEngine {
  ///单例
  factory ClientEngine() => _getInstance();
  static ClientEngine get instance => _getInstance();
  static ClientEngine _clientEngine;
  ClientEngine._internal() {
    print("clientEngine 初始化 _internal");
  }
  static ClientEngine _getInstance() {
    if (_clientEngine == null) {
      _clientEngine = new ClientEngine._internal();
    }
    return _clientEngine;
  }

  SpManager _spManager; //数据持久化存储
  ShareDataManager _shareDataManager; // 数据内存保存
  ///包名 版本号 APP名称
  PackageInfo _packageInfo;

  IosDeviceInfo _iosDeviceInfo;
  AndroidDeviceInfo _androidDeviceInfo;
  FormViewManager formViewManager = FormViewManager();

  Future<bool> init() async {
    //初始化SP
    _spManager = new SpManager();
    if (!await _spManager.init()) {
      return false;
    }
    //初始化 ShareData
    _shareDataManager = new ShareDataManager();

    // 初始化文件路劲
    if (!await _iniFilePath()) {
      return false;
    }

    _packageInfo = await PackageInfo.fromPlatform();

    if (Platform.isIOS) {
      _iosDeviceInfo = await DeviceInfoPlugin().iosInfo;
    } else if (Platform.isAndroid) {
      _androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
    }

    print("clientengine初始化完成");
    return true;
  }

  Future<bool> _iniFilePath() async {
    if (Platform.isIOS) {
      Directory exD = await getLibraryDirectory();
      ZRConstants.BasePath = exD.path;
      ZRConstants.zipPath = ZRConstants.BasePath + "/ziru/zip/";
    } else {
      if (ZRConstants.isDebug) {
        Directory exD = await getExternalStorageDirectory();
        ZRConstants.BasePath = exD.path;
      } else {
        Directory appDocDir = await getApplicationDocumentsDirectory();
        ZRConstants.BasePath = appDocDir.path;
      }
      ZRConstants.zipPath = ZRConstants.BasePath + "/ziru/zip/";
    }

    return true;
  }
//////////////////////////////////////////////////////////////////

  setSharedData(String strKey, String strValue) {
    _shareDataManager.setSharedData(strKey, strValue);
  }

  getSharedData(String strKey) {
    return _shareDataManager.getSharedData(strKey);
  }

  deleteSharedData(String strKey) {
    _shareDataManager.deleteSharedData(strKey);
  }

  saveData(String strKey, String strData) {
    _spManager.saveString(strKey, strData);
  }

  loadData(String strKey) {
    return _spManager.getString(strKey);
  }

  deleteData(String strKey) {
    _spManager.deleteString(strKey);
  }

  info(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  openform(BuildContext context, String url, String strTitle, String strData,
      int nOpenMode, int nAnimation) {
    String strOrginUrl = url;
    formViewManager.openform(
        context, strOrginUrl, strTitle, strData, nOpenMode, nAnimation);
  }

  back(BuildContext context, int nAnimation) {
    formViewManager.back(context, nAnimation);
  }

  ///getSystemData 获取平台和APP信息
  getSystemData() {
    if (Platform.isIOS) {
      var array = [
        "2",
        _packageInfo.version.replaceAll(".", ""),
        _packageInfo.version,
        _iosDeviceInfo.systemVersion
      ];
      return array.join(',');
    } else if (Platform.isAndroid) {
      return [
        "1",
        _packageInfo.version.replaceAll(".", ""),
        _packageInfo.version,
        _androidDeviceInfo.version
      ];
    }
  }
}

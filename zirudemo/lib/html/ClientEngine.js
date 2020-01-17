function ClientEngine() {


    /*
	 * Web窗体加载完毕，触发该事件
	 */
    // 客户端调用此方法
    this.onClientFormLoaded = function () {

        //_thisForm_.onClientFormLoaded();
        this.log("==onClientFormLoaded==");
    };

	/*
	 * 窗体得到输入焦点到前台时触发该事件
	 */
    this.onClientFormFocused = function () {
        //_thisForm_.onClientFormFocused();
        this.log("==onClientFormFocused==");
    };
	/*
	 * 窗体失去输入焦点到前台时触发该事件
	 */
    this.onClientFormUnfocused = function () {
        this.log("==onClientFormUnfocused==");
        //_thisForm_.onClientFormUnfocused();
    };

	/*
	 * Web窗口销毁
	 */
    this.onClientFormUnloaded = function () {
        this.log("==onClientFormUnloaded==");

        //_thisForm_.onClientFormUnloaded();
    };
	/*
	按下物理返回键事件
	*/
    this.onClientBackPressed = function () {
        //_thisForm_.onClientBackPressed();
        this.back(2);
    };
    this.openForm = function (strURI, strTitle, nOpenMode, strData, nAnimation) {
        var data = {};
        data["method"] = "openform";
        var params = {};
        params["url"] = strURI;
        params["nAnimation"] = nAnimation;
        params["strTitle"] = strTitle;
        params["nOpenMode"] = nOpenMode;
        params["strData"] = strData;
        data["params"] = params;
        clientJsEngine.postMessage(JSON.stringify(data))
    };
    this.back = function (nAnimation) {
        var data = {};
        data["method"] = "back";
        var params = {};
        params["nAnimation"] = nAnimation;
        data["params"] = params;
        clientJsEngine.postMessage(JSON.stringify(data))
    }
    /*
         退出应用
        */
    this.exitApp = function () {

    };

    this.setShareData = function (strKey, strValue) {
        var params = {};
        params['strKey'] = strKey;
        params['strValue'] = strValue;
        var resultjson = prompt(JSON.stringify(['zrJsEngine', 'setShareData', JSON.stringify(params)]));
        return resultjson;
    }

    this.getShareData = function (strKey) {
        var params = {};
        params['strKey'] = strKey;
        var resultjson = prompt(JSON.stringify(['zrJsEngine', 'getShareData', JSON.stringify(params)]));
        return resultjson;
    }
    this.deleteSharedData = function (strKey) {
        var params = {};
        params['strKey'] = strKey;
        var resultjson = prompt(JSON.stringify(['zrJsEngine', 'deleteSharedData', JSON.stringify(params)]));
        return resultjson;
    }

    /*
	拨打电话
	  @strPhoneNumber 电话号码
	*/
    this.dial = function (strPhoneNumber) {

    }
    this.getLocation = function () {

    }
    this.openBrowser = function (strUrl) {

    }
    /*
	保存数据项到存储（持久化）
	@strKey 数据的key
	@strData 数据的内容
	*/
    this.saveData = function (strKey, strValue) {

        var params = {};
        params['strKey'] = strKey;
        params['strValue'] = strValue;
        var resultjson = prompt(JSON.stringify(['zrJsEngine', 'saveData', JSON.stringify(params)]));
        return resultjson;
    }
    /*
      从存储中加载指定数据项的内容，如果不存在则返回null
   @strKey 数据项的key
*/
    this.loadData = function (strKey) {
        var params = {};
        params['strKey'] = strKey;
        var resultjson = prompt(JSON.stringify(['zrJsEngine', 'loadData', JSON.stringify(params)]));
        return resultjson;
    }
    /*
	      从存储中删除指定的数据项
	   @strKey 数据项的key，key不存在不影响
	*/
    this.deleteData = function (strKey) {
        var params = {};
        params['strKey'] = strKey;
        var resultjson = prompt(JSON.stringify(['zrJsEngine', 'deleteData', JSON.stringify(params)]));
        return resultjson;
    }
    /*
	/*
	     返回系统数据，整数数组字符串格式，比如[0,2000035]，其中
	    下标0为操作系统类型:1-安卓，2-IOS
	    下标1为框架版本号
	*/
    this.getSystemData = function () {

    }

    /*
     打开AppStore对应的App界面
*/
    this.openAppStore = function () {

    }
    /*
     返回设备码
*/
    this.getDeviceCode = function () {
        var params = {};
        var resultjson = prompt(JSON.stringify(['zrJsEngine', 'getDeviceCode', JSON.stringify(params)]));
        return resultjson;
    }
    /**
	 * 显示一个文本消息和确定按钮的模态对话框,显示信息3秒后消失
	 * @param  strText     弹出的消息内容
	 * @return
	 * @remark
	 */
    this.info = function (strText) {
        var data = {};
        data["method"] = "info";
        var params = {};
        params["message"] = strText;
        data["params"] = params;
        clientJsEngine.postMessage(JSON.stringify(data))
    }
    /*
	向服务器发起一个HttpGet请求调用，调用结果通过onHttpResult函数接收;同一个请求，在收到回调之前，再次调用忽略
	 @cdoRequest 请求对象
	 @strCallbackFunctionName 处理回调的函数名称，函数定义为XXX(nResponseCode,strResponseText)
	 @strAttachData 回调时携带上此数据
	*/
    this.raiseHttpGet = function (strCallbackFunctionName, strURL, strAttachData) {

    }
    /*
	   向服务器发起一个HttpPost请求调用，调用结果通过onHttpResult函数接收;同一个请求，在收到回调之前，再次调用忽略
	 @strCallbackFunctionName 处理回调的函数名称，函数定义为XXX(nResponseCode,strResponseText,strAttachData)
	 @strURL 请求URL
	 @strData 通过Post提交的文本数据
	 strContentType  json格式  
	 @strAttachData 回调时携带上此数据
	*/
    this.raiseHttpPost = function (strCallbackFunctionName, strURL, strContentType, strData, strAttachData) {

    }


    /**
    * @param strCallBackFunctionName 回调方法名称
    * @param strClassPath  类名              
    * @param strMethodName  方法名
    * @param params   参数 json字符串
    */
    this.startSDK = function (strCallBackFunctionName, strClassPath, strMethodName, strParams) {

    };
    /**
    * @param strClassPath  类名              
    * @param strMethodName  方法名
    * @param params   参数 json字符串
    */
    this.startSynSDK = function (strClassPath, strMethodName, strParams) {
        return clientEngine.startSynSDK(strClassPath, strMethodName, strParams);
    };
    this.log = function (value) {
        var data = {};
        data["method"] = "log";
        var params = {};
        params["value"] = value;
        data["params"] = params;
        clientJsEngine.postMessage(JSON.stringify(data))
    }


}
var clientEngine = new ClientEngine();
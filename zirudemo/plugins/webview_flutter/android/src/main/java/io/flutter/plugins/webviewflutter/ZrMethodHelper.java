package io.flutter.plugins.webviewflutter;

import android.util.Log;
import android.webkit.JsPromptResult;
import android.webkit.WebView;

import org.json.JSONArray;
import org.json.JSONException;

import java.util.HashMap;

import io.flutter.plugin.common.MethodChannel;

public class ZrMethodHelper {

    public static boolean handMethodCall(MethodChannel methodChannel, String message, String defaultValue, final JsPromptResult result) {
        try {
            JSONArray array = new JSONArray(message);
            HashMap<String, String> arguments = new HashMap<>();
            String method = array.getString(0);
            if (method.equals("zrJsEngine")) {
                arguments.put("zrMethod", array.getString(1));
                arguments.put("params", array.getString(2));
                methodChannel.invokeMethod("zrJsEngine", arguments, new MethodChannel.Result() {
                    @Override
                    public void success(Object res) {
                        result.confirm((String) res);
                    }
                    @Override
                    public void error(String errorCode, String errorMessage, Object errorDetails) {
                        result.confirm(errorMessage);
                    }
                    @Override
                    public void notImplemented() {
                        result.confirm("notImplemented");
                    }
                });
            }

        } catch (JSONException e) {
            e.printStackTrace();
            Log.e("test", "JSONException=");
            return true;
        }

        return true;
    }
}

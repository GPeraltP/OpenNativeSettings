package com.gperalta.cordova.plugin;

import android.content.Intent;
import android.content.Context;

//import android.net.Uri;

//import android.os.Build;

import android.provider.Settings;

// Cordova-required packages
import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class NativeSettings extends CordovaPlugin {
  Intent intent;
  Context context;
  @Override
  public boolean execute(String action, JSONArray args,
    final CallbackContext callbackContext) {

      // Verify that the user sent a 'open' action
      if (!action.equals("open")) {
        callbackContext.error("\"" + action + "\" is not a recognized action.");
        return false;
      }
      //Create new Intent
      context=this.cordova.getActivity().getApplicationContext();

      intent = new Intent(android.provider.Settings.ACTION_WIFI_SETTINGS);

      this.cordova.getActivity().startActivity(intent);

      // Send a positive result to the callbackContext
      PluginResult pluginResult = new PluginResult(PluginResult.Status.OK);
      callbackContext.sendPluginResult(pluginResult);
      return true;

  }
}
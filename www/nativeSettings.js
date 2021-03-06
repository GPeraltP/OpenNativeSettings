// Empty constructor
function NativeSettings() {}

// The function that passes work along to native shells
NativeSettings.open = function( setting, successCallback, errorCallback) {
  var options = {};
  options.setting = setting;
  cordova.exec(successCallback, errorCallback, 'NativeSettings', 'open', [options]);
}

/* // Installation constructor that binds ToastyPlugin to window
NativeSettings.install = function() {
  if (!window.plugins) {
    window.plugins = {};
  }
  window.plugins.nativeSettings = new NativeSettings();
  return window.plugins.nativeSettings;
};
cordova.addConstructor(NativeSettings.install); */

module.exports = NativeSettings;
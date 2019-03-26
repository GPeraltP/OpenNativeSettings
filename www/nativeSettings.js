// Empty constructor
function NativeSettings() {}

// The function that passes work along to native shells
// Message is a string, duration may be 'long' or 'short'
NativeSettings.prototype.open = function(message, duration, successCallback, errorCallback) {
  var options = {};
  options.message = message;
  options.duration = duration;
  cordova.exec(successCallback, errorCallback, 'ToastyPlugin', 'show', [options]);
}

// Installation constructor that binds ToastyPlugin to window
ToastyPlugin.install = function() {
  if (!window.plugins) {
    window.plugins = {};
  }
  window.plugins.nativeSettings = new NativeSettings();
  return window.plugins.nativeSettings;
};
cordova.addConstructor(NativeSettings.install);
#import "NativeSettings.h"
#import <Cordova/CDVPlugin.h>

@implementation NativeSettings

- (BOOL)do_open{
	if ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]]) {
		return YES;
	} else {
		return NO;
	}
}

- (void)open:(CDVInvokedUrlCommand*)command
{
	CDVPluginResult* pluginResult = nil;
	NSString* key = [command.arguments objectAtIndex:0];
//	NSString* prefix = @"App-prefs:";
	BOOL result = NO;

	//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];

/*	if(SYSTEM_VERSION_LESS_THAN(@"11.3")){
        prefix = @"app-settings:";
    } */

	if ([key isEqualToString:@"wifi"]) {
		result = [self do_open:[]];
	} else {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Invalid Action"];
	}
		
	if (result) {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Opened"];
	} else {
		pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Cannot open"];
	}
	
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

@end
#import "SimnumberPlugin.h"
#if __has_include(<simnumber/simnumber-Swift.h>)
#import <simnumber/simnumber-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "simnumber-Swift.h"
#endif

@implementation SimnumberPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSimnumberPlugin registerWithRegistrar:registrar];
}
@end

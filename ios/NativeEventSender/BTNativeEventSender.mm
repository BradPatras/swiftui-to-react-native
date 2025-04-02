//
//  NativeEventSender.m
//  react-native-swiftui
//
//  Created by Brad Patras on 4/2/25.
//

#import "BTNativeEventSender.h"

@interface BTNativeEventSender()
@end

@implementation BTNativeEventSender

RCT_EXPORT_MODULE(NativeEventSender)

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const facebook::react::ObjCTurboModule::InitParams &)params {
	return std::make_shared<facebook::react::NativeEventSenderSpecJSI>(params);
}

- (void)sendEvent:(nonnull NSString *)name json:(nonnull NSString *)json {
	NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];

    if (error) {
        NSLog(@"Error parsing JSON: %@", error);
        return;
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:self userInfo:dict];
}

@end

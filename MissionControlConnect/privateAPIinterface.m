//
//  privateAPIinterface.m
//  MissionControlConnect
//
//  Created by Ryoma Canastra on 11/2/19.
//  Copyright © 2019 Ryoma Canastra. All rights reserved.
//

#import <Foundation/Foundation.h>

// this function is not part of the public Apple/macOS API, or whatever
// so we have this little wrapper for it, callMissionControl()
extern void CoreDockSendNotification(NSString*);

// what is even this code? what does it mean?
// well, you can try running
// otool -tV /Applications/Mission\ Control.app/Contents/MacOS/Mission\ Control
// see for youself the output! and try running this executable yourself

// Mission control arguments:
// 0: Mission Control
// 1: Show Desktop
// 2: Application windows
void callMissionControl(int callType) {
    NSString *notificationName;
    if (callType == 0) {
        notificationName = @"com.apple.expose.awake";
    } else if (callType == 1) {
        notificationName = @"com.apple.showdesktop.awake";
    } else if (callType == 2) {
        notificationName = @"com.apple.expose.front.awake";
    } else {
        return;
    }

    CoreDockSendNotification(notificationName);
}

//
//  ViewController.swift
//  MissionControlConnect
//
//  Created by Ryoma Canastra on 10/29/19.
//  Copyright © 2019 Ryoma Canastra. All rights reserved.
//

import Cocoa
import os

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSEvent.addGlobalMonitorForEvents(matching: NSEvent.EventTypeMask.otherMouseDown, handler: {(mouseEvent:NSEvent) in
            let buttonNumber = mouseEvent.buttonNumber;
            os_log("%d", buttonNumber);
            
            // Mission control arguments:
            // 0: Mission Control
            // 1: Show Desktop
            // 2: Application windows
            // else: Mission Control
            
            // 2: middle click
            // 3: top thumb button
            // 4: scroll wheel click
            // 5: bottom thumb button
            var missionControlType:Int32
            if buttonNumber == 3 {
                missionControlType = 0
            } else if buttonNumber == 5 {
                missionControlType = 1
            } else if buttonNumber == 4 {
                missionControlType = 2
            } else {
                return
            }
            
            callMissionControl(missionControlType)
            
        })
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}



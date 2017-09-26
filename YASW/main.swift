//
//  main.swift
//  YASW
//
//  Created by Kota Nakano on 2017/04/18.
//  Copyright © 2017 Kota Nakano. All rights reserved.
//
import Cocoa
import os.log
NSWorkspace.shared.notificationCenter.addObserver(forName: NSWorkspace.willSleepNotification,
                                                  object: nil,
                                                  queue: .current) {
	guard let script: NSAppleScript = NSAppleScript(source: "tell application \"system events\" to shut down") else {
		os_log("%@", log: .default, type: .fault, String(describing: $0))
		return
	}
	script.executeAndReturnError(nil)
}
NSApplication.shared.run()

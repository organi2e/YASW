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
	let source: String = "tell application \"system events\" to shut down"
	guard let script: NSAppleScript = NSAppleScript(source: source) else {
		os_log("script %@ has any error at %@", log: .default, type: .fault, source, String(describing: $0))
		return
	}
	script.executeAndReturnError(nil)
}
NSApplication.shared.run()

//
//  main.swift
//  YASW
//
//  Created by Kota Nakano on 2017/04/18.
//  Copyright © 2017 Kota Nakano. All rights reserved.
//
import Cocoa
import os.log
withExtendedLifetime(NSWorkspace.shared.notificationCenter.addObserver(forName: NSWorkspace.willSleepNotification, object: nil, queue: .current) {
	guard let script: NSAppleScript = NSAppleScript(source: "tell application \"system events\" to shut down") else {
		os_log(.fault, "%{public}@", String(describing: $0))
		return
	}
	do {
		var error: NSDictionary?
		script.executeAndReturnError(&error)
		switch error {
		case.none:
			os_log(.info, "this machine will shut down by %{public}@", ProcessInfo.processInfo.processName)
		case.some(let error):
			os_log(.error, "@{public}@", String(describing: error))
		}
	}
}, NSApplication.shared.run)

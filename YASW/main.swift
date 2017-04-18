//
//  main.swift
//  YASW
//
//  Created by Kota Nakano on 2017/04/18.
//  Copyright © 2017 Kota Nakano. All rights reserved.
//

import Cocoa
class Observer: NSObject {
	func shutdown(_: NSNotification) {
		let source: String = "tell application \"system events\" to shut down"
		guard let script: NSAppleScript = NSAppleScript(source: source) else { fatalError("no way") }
		script.executeAndReturnError(nil)
	}
}
let observer: Observer = Observer()
NSWorkspace.shared().notificationCenter.addObserver(observer, selector: #selector(observer.shutdown), name: .NSWorkspaceWillSleep, object: nil)
NSApplication.shared().run()

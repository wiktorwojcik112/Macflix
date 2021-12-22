//
//  BugController.swift
//  Macflix
//
//  Created by Wiktor Wójcik on 15/11/2020.
//

import Cocoa
import TelemetryClient

class BugController: NSViewController {
    @IBOutlet var tfReport: NSTextField!
    @IBOutlet var btnSend: NSButton!

    override func viewWillAppear() {

    }
    
    @IBAction func send(_ sender: NSButton) {
        btnSend.title = "Report has been send. Thank you!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}

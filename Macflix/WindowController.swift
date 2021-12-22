//
//  WindowController.swift
//  Macflix
//
//  Created by Wiktor Wójcik on 11/12/2020.
//

import Cocoa

extension Notification.Name {
    static let searchIsActivated = NSNotification.Name("URLContainerDidAddURL")
    static let goBackSelected = NSNotification.Name("goBackSelected")
    static let goForwardSelected = NSNotification.Name("goForwardSelected")
}

class WindowController: NSWindowController {
    @IBOutlet var navigationOutlet: NSSegmentedControl!
    
    @IBAction func navigation(_ sender: NSSegmentedControl) {
        if (navigationOutlet.isSelected(forSegment: 0)) {
            NotificationCenter.default.post(name: Notification.Name.goBackSelected, object: nil)
        } else {
            NotificationCenter.default.post(name: Notification.Name.goForwardSelected, object: nil)
        }
    }
    
    @IBAction override func newWindowForTab(_ sender: Any?) {
        let newWindowController = self.storyboard!.instantiateInitialController() as! WindowController
        let newWindow = newWindowController.window!
        newWindow.windowController = self
        self.window!.addTabbedWindow(newWindow, ordered: .above)
    }
    
    @IBOutlet var searchField: NSSearchField!
    
    @IBAction func search(_ sender: NSSearchField) {
        
        var query = searchField.stringValue
        query = query.replacingOccurrences(of: " ", with: "%20")
        NotificationCenter.default.post(name: Notification.Name.searchIsActivated, object: nil, userInfo: ["query": query])
        
        
        
        searchField.resignFirstResponder()
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()

    }

}

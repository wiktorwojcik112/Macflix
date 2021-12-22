//
//  ViewController.swift
//  Macflix
//
//  Created by Wiktor Wójcik on 10/10/2020.
//

import Cocoa
import WebKit
import TelemetryClient

extension Notification.Name {
    static let canGoBack = NSNotification.Name("canGoBack")
    static let canGoForward = NSNotification.Name("canGoForward")
    
    static let cantGoBack = NSNotification.Name("cantGoBack")
    static let cantGoForward = NSNotification.Name("cantGoForward")
}

class ViewController: NSViewController, WKUIDelegate {

    @IBOutlet var NetflixView: WKWebView!
    
    @IBAction func Home(_ sender: Any) {
        NetflixView.load(URLRequest(url: URL(string: "https://www.netflix.com")!))
    }
    
    
@IBAction func comedyMovie(_ sender: NSComboBox) {
            NetflixView.load(URLRequest(url: URL(string: "https://www.netflix.com/browse/genre/6548?bc=34399")!))
}

@IBAction func horrorsMovie(_ sender: NSComboBox) {
            NetflixView.load(URLRequest(url: URL(string: "https://www.netflix.com/browse/genre/8711?bc=34399")!))
}
    
@IBAction func scienceMovies(_ sender: NSComboBox) {
            NetflixView.load(URLRequest(url: URL(string: "https://www.netflix.com/browse/genre/2595?bc=34399")!))
}
    
@IBAction func historyMovies(_ sender: NSComboBox) {
            NetflixView.load(URLRequest(url: URL(string: "https://www.netflix.com/browse/genre/81268388?bc=34399")!))
}
@IBAction func comedySerials(_ sender: NSComboBox) {
            NetflixView.load(URLRequest(url: URL(string: "https://www.netflix.com/browse/genre/10375?bc=83")!))
}
@IBAction func horrorSerials(_ sender: NSComboBox) {
            NetflixView.load(URLRequest(url: URL(string: "https://www.netflix.com/browse/genre/83059?bc=83")!))
}
    
@IBAction func scienceSerials(_ sender: NSComboBox) {
            NetflixView.load(URLRequest(url: URL(string: "https://www.netflix.com/browse/genre/52780?bc=83")!))
}
    
@IBAction func historySerials(_ sender: NSComboBox) {
            NetflixView.load(URLRequest(url: URL(string: "https://www.netflix.com/browse/genre/81268388?bc=83")!))
}
    
@IBAction func Documentary(_ sender: NSComboBox) {
            NetflixView.load(URLRequest(url: URL(string: "https://www.netflix.com/browse/genre/10105?bc=83")!))
}
    
    
    @IBAction func goBack(_ sender: Any) {
        NetflixView.goBack()
        let url = NetflixView.url?.absoluteString
    }
    @IBAction func goForward(_ sender: Any) {
        NetflixView.goForward()
        let url = NetflixView.url?.absoluteString
    }
    
    @IBAction func switchProfile(_ sender: NSButton) {
        NetflixView.load(URLRequest(url: URL(string: "https://www.netflix.com/profiles")!))
    }
    
    @IBAction func switchEnglish(_ sender: NSButton) {

    }
    
    @IBAction func switchPolish(_ sender: NSButton) {

    }
    
    @IBAction func clearCookies(_ sender: NSButton) {
        NetflixView.load(URLRequest(url: URL(string: "http://www.netflix.com/clearcookies")!))
    }
    
    override func viewWillAppear() {
            let configuration = TelemetryManagerConfiguration(appID: "6DE2133D-F52B-45D9-997E-8DA81136DB88")
            TelemetryManager.initialize(with: configuration)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetflixView.load(URLRequest(url: URL(string: "https://www.netflix.com")!))
        let observerSearch = NotificationCenter.default.addObserver(forName: NSNotification.Name.searchIsActivated, object: nil, queue: nil) { notification in
            let queryNotHashable = notification.userInfo?["query"]
            let query = queryNotHashable as! String
            if (URL(string: "https://www.netflix.com/browse?q=" + query) != nil) {
            let browse = URLRequest(url: URL(string: "https://www.netflix.com/browse?q=" + query)!)
            let search = URLRequest(url: URL(string: "https://www.netflix.com/search?q=" + query)!)
            self.NetflixView.load(browse)
            self.NetflixView.load(search)
            }
        }
        
        let observerBack = NotificationCenter.default.addObserver(forName: NSNotification.Name.goBackSelected, object: nil, queue: nil) { notification in
            self.NetflixView.goBack()
        }
        
        let observerForward = NotificationCenter.default.addObserver(forName: NSNotification.Name.goForwardSelected, object: nil, queue: nil) { notification in
            self.NetflixView.goForward()
        }
        
    }

    override var representedObject: Any? {
        didSet {
        
        }
    }


}


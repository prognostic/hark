//
//  ViewController.swift
//  SimpleBrowser
//
//  Created by prognosticator on 06.02.17.
//  Copyright © 2017 prognosticator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addressBar: UITextField!
    @IBOutlet weak var infoLabel: UIWebView!
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goBack(_ sender: UIButton) {
        webView.goBack()
    }

    @IBAction func goForward(_ sender: UIButton) {
        webView.goForward()
    }
    
    @IBAction func didTapGo(_ sender: UIButton) {
        if addressBar.text == "" {
            return
        }
        guard let text:String = addressBar.text else {
            return
        }
        if text.range(of: ".") != nil {
            var finalString:String = text.lowercased()
            if finalString.range(of: "http://") == nil {
                finalString = "http://\(finalString)"
            }
            self.loadURL(finalString)
        } else {
            let searchStr = text.replacingOccurrences(of: " ", with: "+")
            let finalString = "https://www.google.com/search?q=\(searchStr)"
            self.loadURL(finalString)
        }
        
    }
    
    func loadURL(_ str:String) {
        let url = URL(string: str)!
        let request = URLRequest(url: url)
        webView.loadRequest(request)
    }
}


//
//  LoadURL.swift
//  MyBooks
//
//  Created by CanDang on 1/5/16.
//  Copyright © 2016 CanDang. All rights reserved.
//

import UIKit

class LoadURL: UIViewController, UITextFieldDelegate, UIWebViewDelegate {

    
    @IBOutlet weak var myActivity: UIActivityIndicatorView!
    @IBOutlet weak var urlString: UITextField!
    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func reload(sender: AnyObject) {
        webView.reload()
    }
    
    @IBAction func forward(sender: AnyObject) {
        webView.goForward()
    }
    
    @IBAction func back(sender: AnyObject) {
        webView.goBack()
    }
    @IBAction func stopload(sender: AnyObject) {
        webView.stopLoading()
    }
    let baseUrl = "http://www."
    override func viewDidLoad() {
        myActivity.hidden = true
        super.viewDidLoad()
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        myActivity.hidden = false
        let url = NSURL(string: baseUrl + textField.text!)!
        let urlRequest = NSURLRequest(URL: url)
        self.webView.loadRequest(urlRequest)
        myActivity.startAnimating()
        return true
    }
    func webViewDidFinishLoad(webView: UIWebView)
    {
        myActivity.hidden = true
        myActivity.stopAnimating()
    }

}

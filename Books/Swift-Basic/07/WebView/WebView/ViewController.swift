//
//  ViewController.swift
//  WebView
//
//  Created by Jiho on 2022/07/17.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var txtURL: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        loadWebPage("https://2sam.net/")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    
    func checkURL(_ url: String) -> String {
        var strURL = url
        let flag = strURL.hasPrefix("http://")
        if !flag {
            strURL = "http://" + strURL
        }
        return strURL
    }

    @IBAction func btnGotoURL(_ sender: UIButton) {
        let myURL = checkURL(txtURL.text!)
        txtURL.text = ""
        loadWebPage(myURL)
    }
    
    @IBAction func btnSite1(_ sender: UIButton) {
        loadWebPage("https://fallinmac.tistory.com/")
    }
    
    @IBAction func btnSite2(_ sender: UIButton) {
        loadWebPage("https://blog.2sam.net/")
    }
    
    @IBAction func btnHTML(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p><p><a href=\"https://2sam.net/\">2sam</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myURL = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myURL)
        myWebView.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
}


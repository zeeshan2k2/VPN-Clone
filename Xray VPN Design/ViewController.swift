//
//  ViewController.swift
//  Xray VPN Design
//
//  Created by Zeeshan Waheed on 18/11/2024.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var memberBtn: UIButton!
    @IBOutlet weak var supportBtn: UIButton!
    @IBOutlet weak var ipBtn: UIButton!
    @IBOutlet weak var connectBtn: UIButton!
    
    @IBOutlet weak var controlsBG: UIView!
    
    @IBOutlet weak var testConnectionBGView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controlsBG.layer.cornerRadius = 15
        testConnectionBGView.layer.cornerRadius = 10
        
        
        // to hide navigation bar
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    @IBAction func menuBtnclicked(_ sender: Any) {
        print("menu button clicked")
        
        if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "menuvc") as? MenuViewController {
            // Add custom animation
            let transition = CATransition()
            transition.duration = 0.2
            transition.type = .push
            transition.subtype = .fromLeft // Slide from left to right
            view.window?.layer.add(transition, forKey: kCATransition)
            
            // Push the view controller without animation since we handle it
            navigationController?.pushViewController(nextViewController, animated: false)
        }
    }
    
    @IBAction func memberBtnclicked(_ sender: Any) {
        print("member button clicked")
    }
    
    @IBAction func supportBtnclicked(_ sender: Any) {
        print("support button clicked")
    }
    
    @IBAction func ipBtnclicked(_ sender: Any) {
        print("ip button button clicked")
    }
    
    @IBAction func connectBtnclicked(_ sender: Any) {
        print("connect button clicked")
    }
    
    @IBAction func fastestLocationBtnclicked(_ sender: Any) {
        print("fastest location button clicked")
        
        if let nextViewController = storyboard?.instantiateViewController(withIdentifier: "servervc") as? ServersViewController {
                // Use pushViewController to slide from right to left
                navigationController?.pushViewController(nextViewController, animated: true)
            }
    }
    
    
    @IBAction func autoModeBtnclicked(_ sender: Any) {
        print("automode button clicked")
    }
    
    @IBAction func openWebPage(_ sender: UIButton) {
        let webViewController = WebViewController()
        webViewController.modalPresentationStyle = .popover
        webViewController.urlString = "https://speed.cloudflare.com/"
        self.present(webViewController, animated: true, completion: nil)
    }
    
}

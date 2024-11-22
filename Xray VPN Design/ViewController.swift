//
//  ViewController.swift
//  Xray VPN Design
//
//  Created by Zeeshan Waheed on 18/11/2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var memberBtn: UIButton!
    @IBOutlet weak var supportBtn: UIButton!
    @IBOutlet weak var ipBtn: UIButton!
    @IBOutlet weak var connectBtn: UIButton!
    
    @IBOutlet weak var controlsBG: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controlsBG.layer.cornerRadius = 15
        
        
        // to hide navigation bar
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    
    @IBAction func menuBtnclicked(_ sender: Any) {
        print("menu button clicked")
        
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "menuvc") as! MenuViewController
        
        // Replace the current view controller with the next one
        navigationController?.setViewControllers([nextViewController], animated: false)
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
    }
    
    
    @IBAction func autoModeBtnclicked(_ sender: Any) {
        print("automode button clicked")
    }

}

//
//  menuViewController.swift
//  Xray VPN Design
//
//  Created by Zeeshan Waheed on 18/11/2024.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var dismissBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func navigateToNext(_ sender: UIButton) {
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "viewcontroller") as! ViewController
        // Replace the current view controller with the next one
        navigationController?.setViewControllers([nextViewController], animated: false)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

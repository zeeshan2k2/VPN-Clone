//
//  menuViewController.swift
//  Xray VPN Design
//
//  Created by Zeeshan Waheed on 18/11/2024.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let menuItems = [
        "Sign In",
        "Share",
        "Rate Us",
        "Contact Us",
        "Reinstall Profile",
        "Privacy Policy",
        "Terms of Services",
        "About Subscription",
        "About Us"
    ]

    @IBOutlet weak var menuTableView: UITableView!
    
    @IBOutlet weak var dismissBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the tableView delegate and dataSource
        menuTableView.delegate = self
        menuTableView.dataSource = self
    }
    
    @IBAction func navigateToNext(_ sender: UIButton) {
        if let navigationController = navigationController {
            // Add a custom transition for the navigation pop
            let transition = CATransition()
            transition.duration = 0.2
            transition.type = .push
            transition.subtype = .fromRight // Animate from right to left
            navigationController.view.layer.add(transition, forKey: kCATransition)
            
            // Pop the view controller without animation since we're handling it
            navigationController.popViewController(animated: false)
        } else {
            // Dismiss the modal view
            let transition = CATransition()
            transition.duration = 0.2
            transition.type = .push
            transition.subtype = .fromRight // Animate from right to left
            view.window?.layer.add(transition, forKey: kCATransition)
            
            dismiss(animated: false, completion: nil)
        }
    }

    // MARK: - TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count // Number of rows in the table
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Do nothing when a row is tapped to prevent highlighting
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell
            
        
        // Disable highlighting
        cell.selectionStyle = .none
        
        
        // Get the menu item text
        let menuItem = menuItems[indexPath.row]
        
        // Create a symbol image for the arrow
        let arrowImage = UIImage(systemName: "arrowtriangle.forward.fill")?.withRenderingMode(.alwaysTemplate)
        
        // Configure the button
        cell.menuButton.setTitle(" \(menuItem)", for: .normal) // Add space before text
        cell.menuButton.setImage(arrowImage, for: .normal)    // Set the arrow image
        cell.menuButton.tintColor = .white                   // Set the arrow color
        cell.menuButton.contentHorizontalAlignment = .left    // Align image and text to the left
        
        // Adjust spacing between image and text
        cell.menuButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -7, bottom: 0, right: 10) // Move image closer to text
        cell.menuButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10) // Adjust text spacing
        
        
        // Assign a closure to handle button clicks
        cell.buttonAction = { [weak self] in
            print("Button tapped at row \(indexPath.row) for menu item: \(menuItem)")
            
            // Example: Navigate or perform action based on the menu item
            self?.handleMenuAction(for: menuItem)
        }
        
        return cell
    }
    
    
    func handleMenuAction(for menuItem: String) {
        switch menuItem {
        case "Sign In":
            print("Sign In action triggered")
            // Add navigation or specific logic for Sign In

        case "Share":
            print("Share action triggered")
            // Add navigation or specific logic for Share

        case "Rate Us":
            print("Rate Us action triggered")
            // Add navigation or specific logic for Rate Us

        case "Contact Us":
            print("Contact Us action triggered")
            // Add navigation or specific logic for Contact Us

        case "Reinstall Profile":
            print("Reinstall Profile action triggered")
            // Add navigation or specific logic for Reinstall Profile

        case "Privacy Policy":
            print("Privacy Policy action triggered")
            // Add navigation or specific logic for Privacy Policy

        case "Terms of Services":
            print("Terms of Services action triggered")
            // Add navigation or specific logic for Terms of Services

        case "About Subscription":
            print("About Subscription action triggered")
            // Add navigation or specific logic for About Subscription

        case "About Us":
            print("About Us action triggered")
            // Add navigation or specific logic for About Us

        default:
            print("Unknown action for menu item: \(menuItem)")
            // Handle unexpected or unknown cases
        }
    }

}

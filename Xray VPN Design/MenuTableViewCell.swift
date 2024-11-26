//
//  MenuTableViewCell.swift
//  Xray VPN Design
//
//  Created by Zeeshan Waheed on 26/11/2024.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    @IBOutlet weak var menuButton: UIButton!
    
    // Closure to handle button clicks
    var buttonAction: (() -> Void)?
    
    @IBAction func menuButtonTapped(_ sender: UIButton) {
        buttonAction?() // Trigger the closure when the button is tapped
    }
}

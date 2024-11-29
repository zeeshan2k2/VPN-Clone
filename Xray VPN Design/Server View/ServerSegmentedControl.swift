//
//  ServerSegmentedControl.swift
//  Xray VPN Design
//
//  Created by Zeeshan Waheed on 28/11/2024.
//

import UIKit

class ServerSegmentedControl: UISegmentedControl {
    private let cornerRadius: CGFloat = 20

    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Apply corner radius to the entire segmented control
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true

        // Iterate through subviews to adjust the selection indicator
        for subview in subviews {
            if String(describing: type(of: subview)) == "_UISegmentedControlSelectionIndicator" {
                subview.layer.cornerRadius = cornerRadius
                subview.layer.masksToBounds = true
                subview.backgroundColor = .white // Ensure the background color matches
            }
        }
    }
}

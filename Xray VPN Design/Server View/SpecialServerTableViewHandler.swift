//
//  SpecialServerTableViewHandler.swift
//  Xray VPN Design
//
//  Created by Zeeshan Waheed on 29/11/2024.
//

import UIKit

class SpecialServerTableViewHandler: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    // Data for the table view
    let vpnCountries: [String]
    let vpnCountryPingLbl: [Int]
    
    // Section Titles
    let sectionTitles = ["Random", "Special Server"]
    
    // Initialize with data
    init(countries: [String], pings: [Int]) {
        self.vpnCountries = countries
        self.vpnCountryPingLbl = pings
    }
    
    // MARK: - TableView DataSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count // Number of sections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1 // First section (Random) has 1 row
        } else {
            return vpnCountries.count - 1 // Remaining rows in the second section
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    // MARK: - Custom Section Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear // Background color for header

        let label = UILabel()
        label.text = sectionTitles[section]
        label.textColor = .white // Text color
        label.font = UIFont.boldSystemFont(ofSize: 16) // Bold font
        label.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(label)
        
        // Add constraints to position the label within the header
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40 // Height for the header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServerCell", for: indexPath) as! ServerTableViewCell
        
        cell.selectionStyle = .none
        
        if indexPath.section == 0 {
            // First section (Random)
            cell.countryNameLbl.text = vpnCountries[0]
            cell.countryImg.image = UIImage(named: "\(vpnCountries[0])")
            cell.countryPingLbl.text = "\(vpnCountryPingLbl[0]) ms"
        } else {
            // Second section (Special Server)
            let adjustedIndex = indexPath.row + 1 // Offset to skip the first row
            cell.countryNameLbl.text = vpnCountries[adjustedIndex]
            cell.countryImg.image = UIImage(named: "\(vpnCountries[adjustedIndex])")
            cell.countryPingLbl.text = "\(vpnCountryPingLbl[adjustedIndex]) ms"
        }
        
        return cell
    }
}


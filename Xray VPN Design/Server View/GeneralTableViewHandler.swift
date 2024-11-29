//
//  GeneralTableViewHandler.swift
//  Xray VPN Design
//
//  Created by Zeeshan Waheed on 28/11/2024.
//

import UIKit

class GeneralTableViewHandler: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    // Data for the table view
    let vpnCountries: [String]
    let vpnCountryPingLbl: [Int]
    
    // Section Titles
    let sectionTitles = ["Fastest Location", "Random", "Quality Server"]
    
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
            return 1 // First section has 1 row
        } else if section == 1 {
            return 1 // Second section has 1 row
        } else {
            return vpnCountries.count - 2 // Remaining rows in the third section
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
            cell.countryNameLbl.text = vpnCountries[0]
            cell.countryImg.image = UIImage(named: "\(vpnCountries[0])")
            cell.countryPingLbl.text = "\(vpnCountryPingLbl[0]) ms"
        } else if indexPath.section == 1 {
            cell.countryNameLbl.text = vpnCountries[1]
            cell.countryImg.image = UIImage(named: "\(vpnCountries[1])")
            cell.countryPingLbl.text = "\(vpnCountryPingLbl[1]) ms"
        } else {
            let adjustedIndex = indexPath.row + 2
            cell.countryNameLbl.text = vpnCountries[adjustedIndex]
            cell.countryImg.image = UIImage(named: "\(vpnCountries[adjustedIndex])")
            cell.countryPingLbl.text = "\(vpnCountryPingLbl[adjustedIndex]) ms"
        }
        
        return cell
    }
}

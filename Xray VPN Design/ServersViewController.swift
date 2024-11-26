//
//  ServersViewController.swift
//  Xray VPN Design
//
//  Created by Zeeshan Waheed on 26/11/2024.
//

import UIKit

class ServersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let vpnCountries = [
        "Singapore",
        "America",
        "Canada",
        "England",
        "Estonia",
        "Germany",
        "Iceland",
        "Switzerland"
    ]
    
    let vpnCountryPingLbl = [
        20,  // America
        50,  // Canada
        30,  // England
        90,  // Estonia
        40,  // Germany
        70,  // Iceland
        200, // Singapore
        60   // Switzerland
    ]
    
    @IBOutlet weak var serverSearchTxtFld: UITextField!
    
    @IBOutlet weak var tableView: UITableView! // Link this to your storyboard

    @IBOutlet weak var backBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the tableView delegate and dataSource
        tableView.delegate = self
        tableView.dataSource = self
        
        // adding done button to the keyboard
        addDoneButtonToKeyboard()

    }
    
    func addDoneButtonToKeyboard() {
        // Create a toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit() // Adjust the size to fit the keyboard

        // Create a Done button
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        
        // Add flexible space to position the Done button on the right
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        // Add the button to the toolbar
        toolbar.items = [flexibleSpace, doneButton]
        
        // Assign the toolbar as the inputAccessoryView of the text field
        serverSearchTxtFld.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonTapped() {
        // Dismiss the keyboard
        serverSearchTxtFld.resignFirstResponder()
    }



    
    @IBAction func backBtnTapped(_ sender: Any) {
        if navigationController != nil {
                navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }


    // MARK: - TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vpnCountries.count // Number of rows in the table
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Do nothing when a row is tapped to prevent highlighting
        tableView.deselectRow(at: indexPath, animated: false)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServerCell", for: indexPath) as! ServerTableViewCell
            
        
        // Disable highlighting
        cell.selectionStyle = .none
        
        
        cell.countryNameLbl.text = vpnCountries[indexPath.row]
        cell.countryImg.image = UIImage(named: "\(vpnCountries[indexPath.row])")
        cell.countryPingLbl.text = "\(vpnCountryPingLbl[indexPath.row]) ms"
        
        return cell
    }
}

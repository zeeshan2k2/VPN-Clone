//
//  ServersViewController.swift
//  Xray VPN Design
//
//  Created by Zeeshan Waheed on 26/11/2024.
//

import UIKit

class ServersViewController: UIViewController {
    
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
    
    @IBOutlet weak var serverSegmentBtn: ServerSegmentedControl!
    
    var segmetentState = false
    
    @IBOutlet weak var generalTableView: UITableView! // Link this to your storyboard
    
    @IBOutlet weak var backBtn: UIButton!
    
    // Handlers for General and Special Server
    private var generalTableViewHandler: GeneralTableViewHandler!
    private var specialServerTableViewHandler: SpecialServerTableViewHandler!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize the handlers with data
        generalTableViewHandler = GeneralTableViewHandler(
            countries: vpnCountries,
            pings: vpnCountryPingLbl
        )

        specialServerTableViewHandler = SpecialServerTableViewHandler(
            countries: vpnCountries,
            pings: vpnCountryPingLbl
        )

        // Start with GeneralTableViewHandler
        generalTableView.delegate = generalTableViewHandler
        generalTableView.dataSource = generalTableViewHandler

        // Add a target to detect when the segment control value changes
        serverSegmentBtn.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
    
        design()
    }
    
    func design() {
        
        // Create the search icon and placeholder
        let placeholderText = " Search"
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "magnifyingglass")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        imageAttachment.bounds = CGRect(x: 0, y: -2, width: 19, height: 17) // Adjust icon size and position

        // Create attributed string with the icon and text
        let imageString = NSAttributedString(attachment: imageAttachment)
        let placeholderAttributedString = NSMutableAttributedString(attributedString: imageString)
        placeholderAttributedString.append(NSAttributedString(string: placeholderText))

        // Set attributed placeholder
        serverSearchTxtFld.attributedPlaceholder = placeholderAttributedString

        // Optional: Customize text field appearance
        serverSearchTxtFld.borderStyle = .roundedRect
    }

    @objc func segmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // Load General TableView Handler
            generalTableView.delegate = generalTableViewHandler
            generalTableView.dataSource = generalTableViewHandler
            generalTableView.isHidden = false
        } else {
            // Load Special Server TableView Handler
            generalTableView.delegate = specialServerTableViewHandler
            generalTableView.dataSource = specialServerTableViewHandler
            generalTableView.isHidden = false
        }

        // Reload the table view to display the new content
        generalTableView.reloadData()

        // Debugging log
        print("Segment clicked: \(sender.selectedSegmentIndex)")
    }

    func addDoneButtonToKeyboard() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.items = [flexibleSpace, doneButton]

        serverSearchTxtFld.inputAccessoryView = toolbar
    }

    @objc func doneButtonTapped() {
        serverSearchTxtFld.resignFirstResponder()
    }
    
    
    @IBAction func backBtnTapped(_ sender: Any) {
        if navigationController != nil {
            navigationController?.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
}

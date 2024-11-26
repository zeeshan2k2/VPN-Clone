import UIKit
import WebKit

class WebViewController: UIViewController {
    var urlString: String? // The URL to be loaded
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeaderView()   // Add a white background for the Cancel button
        setupWebView()      // Add the WebView below the header
        loadWebPage()       // Load the webpage
    }

    // Add a white background for the Cancel button
    private func setupHeaderView() {
        // Create a container view for the button
        let headerView = UIView()
        headerView.backgroundColor = .white
        headerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(headerView)

        // Constrain the header view to the top of the screen
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60) // Set height for the header
        ])

        // Add the Cancel button inside the header view
        let closeButton = UIButton()
        closeButton.setTitle("Cancel", for: .normal)
        closeButton.setTitleColor(.systemRed, for: .normal)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(closeWebView), for: .touchUpInside)
        headerView.addSubview(closeButton)

        // Constrain the Cancel button within the header
        NSLayoutConstraint.activate([
            closeButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor), // Vertically centered in the header
            closeButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16) // 16 points from the right
        ])
    }

    // Set up the WKWebView
    private func setupWebView() {
        webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(webView)

        // Constrain the WebView to start below the header view
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40), // Start below the header
            webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }

    // Load the webpage
    private func loadWebPage() {
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }

    // Close the modal view
    @objc private func closeWebView() {
        self.dismiss(animated: true, completion: nil)
    }
}


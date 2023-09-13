//
//  CompactViewController.swift
//  CompactController
//
//  Created by Kirill Milekhin on 13/09/2023.
//

import UIKit

final class CompactViewController: UIViewController {
    private lazy var segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["280pt","150pt"])
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .close, primaryAction: .init(handler: { _ in
            self.dismiss(animated: true)
        }))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    private func configureLayout() {
        view.backgroundColor = .white
        
        view.addSubview(segmentedControl)
        view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }

    @objc private func segmentedControlValueChanged() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            preferredContentSize.height = 280
        case 1:
            preferredContentSize.height = 150
        default:
            return
        }
    }
}

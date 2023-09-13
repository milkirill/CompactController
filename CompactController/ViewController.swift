//
//  ViewController.swift
//  CompactController
//
//  Created by Kirill Milekhin on 13/09/2023.
//

import UIKit

class ViewController: UIViewController {
    private lazy var presentButton: UIButton = {
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            self.didTapPresentButton()
        }))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Present", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(presentButton)
        NSLayoutConstraint.activate([
            presentButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    func didTapPresentButton() {
        let compactViewController = CompactViewController()
        compactViewController.modalPresentationStyle = .popover
        compactViewController.preferredContentSize = .init(width: 300, height: 280)
        compactViewController.popoverPresentationController?.sourceView = presentButton
        compactViewController.popoverPresentationController?.permittedArrowDirections = [.up]
        compactViewController.popoverPresentationController?.delegate = self
        present(compactViewController, animated: true)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        UIModalPresentationStyle.none
    }
}

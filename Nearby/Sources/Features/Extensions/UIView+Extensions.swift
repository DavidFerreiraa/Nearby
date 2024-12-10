//
//  UIView+Extensions.swift
//  Nearby
//
//  Created by David Ferreira Lima on 10/12/24.
//

import Foundation
import UIKit

extension UIView {
    func setConstraintsToParent(_ parent: UIView) {
            NSLayoutConstraint.activate([
                self.topAnchor.constraint(equalTo: parent.topAnchor),
                self.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
                self.bottomAnchor.constraint(equalTo: parent.bottomAnchor),
                self.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            ])
        }
}

//
//  SplashViewController.swift
//  Nearby
//
//  Created by David Ferreira Lima on 10/12/24.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    let contentView: SplashView
    
    init(contentView: SplashView) {
        self.contentView = contentView
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy() {
        self.view.backgroundColor = .red
        self.view.addSubview(contentView)
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = Colors.greenLight
    }
    
    private func setConstraints() {
        self.contentView.setConstraintsToParent(self.view)
    }
}

//
//  NearbyFlowController.swift
//  Nearby
//
//  Created by David Ferreira Lima on 09/12/24.
//

import Foundation
import UIKit

class NearbyFlowController {
    
    private var navigationController: UINavigationController?
    
    public init() {
        
    }
    
    func start() -> UINavigationController? {
        let contentView = SplashView()
        
        let startViewController = SplashViewController(contentView: contentView, delegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        
        return navigationController
    }
}

extension NearbyFlowController: SplashFlowDelegate {
    func decideNavigationFlow() {
        let contentView = WelcomeView()
        let welcomeViewcontroller = WelcomeViewController(contentView: contentView)
        navigationController?.pushViewController(welcomeViewcontroller, animated: true)
    }
}

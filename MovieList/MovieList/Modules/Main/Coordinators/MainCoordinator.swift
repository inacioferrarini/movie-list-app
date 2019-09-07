//
//  MainCoordinator.swift
//  MovieList
//
//  Created by José Inácio Athayde Ferrarini on 07/09/19.
//  Copyright © 2019 José Inácio Athayde Ferrarini. All rights reserved.
//

import Foundation
import Common
//import MovieList
import Favorites

class MainCoordinator: NSObject, Coordinator {

    var childCoordinators = [Coordinator]()
    var tabBarController: UITabBarController

    public init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
    }

    public func start() {
        loadModules()
    }

    internal func loadModules() {
//        let modules: [Module] = [
//            StoreFrontModule(),
//            LoginModule()
//        ]
//
//        self.tabBarController.viewControllers = modules.map({ return $0.viewController })
//        print("loading modules ...")
    }

}

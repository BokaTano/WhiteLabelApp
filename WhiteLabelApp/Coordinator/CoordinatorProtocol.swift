//
//  CoordinatorProtocol.swift
//  BrettlyPrototype05
//
//  Created by Lars Klimmeck on 28.11.18.
//  Copyright © 2018 Sendmeback GmbH. All rights reserved.
//

// https://www.hackingwithswift.com/articles/71/how-to-use-the-coordinator-pattern-in-ios-apps

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

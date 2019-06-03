//
//  ThirdViewController.swift
//  WhiteLabelApp
//
//  Created by Lars Klimmeck on 04.12.18.
//  Copyright © 2018 Sendmeback GmbH. All rights reserved.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController, Storyboarded {
    var coordinator: AppCoordinator?

    override func awakeFromNib() {
        super.awakeFromNib()
        setTabBarDetails()
    }
}

extension ThirdViewController {
    func setTabBarDetails() {
        title = "Third"
        tabBarItem.image = #imageLiteral(resourceName: "add")
    }
}

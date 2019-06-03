//
//  AppCoordinator.swift
//  BrettlyPrototype05
//
//  Created by Lars Klimmeck on 28.11.18.
//  Copyright © 2018 Sendmeback GmbH. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()

    var navigationController: UINavigationController //for Protocol

    var newsNavController: UINavigationController
    var listNavController: UINavigationController
    var addNavController: UINavigationController
    var tabBarController: UITabBarController

    //var für ViewModel
    var itemvm = ItemsViewModel()

    init(
        newsCtrl: UINavigationController,
        listCtrl: UINavigationController,
        addCtrl: UINavigationController,
        tabBarController: UITabBarController
        ) {
        self.newsNavController = newsCtrl
        self.listNavController = listCtrl
        self.addNavController = addCtrl
        self.tabBarController = tabBarController

        self.navigationController = UINavigationController() //for Protocol
    }

    func start() {
        let vc1 = HomeViewController.instantiate()
        vc1.coordinator = self
        vc1.itemvm = itemvm
        newsNavController.pushViewController(vc1, animated: false)

        let vc2 = SecondViewController.instantiate()
        vc2.coordinator = self
        vc2.itemvm = itemvm
        listNavController.pushViewController(vc2, animated: false)

        let vc3 = ThirdViewController.instantiate()
        vc3.coordinator = self
        addNavController.pushViewController(vc3, animated: false)

        tabBarController.addChild(newsNavController)
        tabBarController.addChild(listNavController)
        tabBarController.addChild(addNavController)
    }

    func openDetailViewController(index: Int) {
        let detailvc = HomeDetailViewController.instantiate()

        let item = itemvm.itemArray[index]
        detailvc.item.value = item
        detailvc.itemvm = itemvm
        detailvc.index = index

        newsNavController.pushViewController(detailvc, animated: true)
    }

    //open vc of another tab
    func openRelatedLink() {
        //        let vc = FirstHomeChildViewController.instantiate()
        //        vc.coordinator = self
        //        let activeVc = navigationController.viewControllers.last!
        //        tabBarController.selectedIndex = 0
        //        only push FirstHomeChildViewController if not already active ViewController
        //        if(activeVc.title != vc.title) {
        //            navigationController.pushViewController(vc, animated: true)
        //        }
    }
}

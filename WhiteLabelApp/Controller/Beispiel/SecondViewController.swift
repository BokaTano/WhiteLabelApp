//
//  SecondViewController.swift
//  WhiteLabelApp
//
//  Created by Lars Klimmeck on 04.12.18.
//  Copyright © 2018 Sendmeback GmbH. All rights reserved.
//
//Tutorial: http://www.benmeline.com/ios-empty-table-view-with-swift/

import Foundation
import UIKit
// import Bond
import ReactiveKit

class SecondViewController: UIViewController, Storyboarded {
    var coordinator: AppCoordinator?
    var itemvm: ItemsViewModel?

    @IBOutlet private var tableview: UITableView!
    @IBOutlet private var emptyTableViewView: EmptyTableViewView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setTabBarDetails()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupEmptyTableViewView()

        itemvm?.itemArray.bind(to: tableview, animated: true) {[weak self] dataSource, indexPath, _
            -> UITableViewCell in
            let cell = self?.tableview.dequeueReusableCell(withIdentifier: "second cell")
            cell?.textLabel?.text = dataSource[indexPath.row].valueString
            return cell!
        }

        //Controls the visibility depended of the itemArray.isEmpty
        /*itemvm?.itemArray.bind(to: self) { me, array in
            me.emptyTableViewView.isHidden = !array.source.isEmpty
        }*/
        itemvm?.itemArray.observeNext { [weak self] _ in
            print(self?.emptyTableViewView.isHidden)
            self?.emptyTableViewView.isHidden = !(self?.itemvm?.itemArray.isEmpty ?? true)
            print(self?.emptyTableViewView.isHidden)
        }
        .dispose()
    }
}

extension SecondViewController {
    func setTabBarDetails() {
        title = "List"
        tabBarItem.image = #imageLiteral(resourceName: "list")
    }

    func setupEmptyTableViewView() {
        emptyTableViewView.image.image = #imageLiteral(resourceName: "Emptytrash1.svg")
        emptyTableViewView.header.text = "You made no Entries yet"
        emptyTableViewView.text.text = "Lorem Ipsum dorem lorem ipsum dorem"
    }
}

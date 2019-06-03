//
//  UITableViewExtension.swift
//  BrettlyPrototype05
//
//  Created by Lars Klimmeck on 05.12.18.
//  Copyright © 2018 Sendmeback GmbH. All rights reserved.
//

import Foundation
import ReactiveKit
import UIKit

extension UITableView {
    // Swipe-to-delete feature
    var commitStyle: Signal<(Int, Int), NoError> {
        return reactive
            .dataSource
            .signal(for: #selector(UITableViewDataSource.tableView(_:commit:forRowAt:))) { (subject: SafePublishSubject<(Int, Int)>, _: UITableView, editingStyle: Int, indexPath: IndexPath)
                in
                subject.next((editingStyle, indexPath.row))
            }
    }
}

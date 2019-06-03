//
//  HomeDetailViewController.swift
//  BrettlyPrototype05
//
//  Created by Lars Klimmeck on 28.11.18.
//  Copyright © 2018 Sendmeback GmbH. All rights reserved.
//

import Bond
import Foundation
import UIKit

class HomeDetailViewController: UIViewController, Storyboarded {
    var item = Observable<Item>(Item(valueString: "", valueInt: 0, isValue: false))
    var itemvm = ItemsViewModel()
    var index: Int?

    var valueString = Observable<String?>("")
    var valueInt = Observable<Int>(0)
    var isValue = Observable<Bool>(false)

    @IBOutlet private var valueStringLbl: UILabel!
    @IBOutlet private var valueIntLbl: UILabel!
    @IBOutlet private var isValueSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        initObservations()
    }
}

extension HomeDetailViewController {
    func initObservations() {
        _ = item.observe { [weak self] item in
            self?.valueStringLbl.text = item.element?.valueString
            self?.valueIntLbl.text = String(item.element?.valueInt ?? 404)
            self?.isValueSwitch.isOn = item.element?.isValue ?? false
        }

        _ = isValueSwitch.reactive.isOn.observe { [weak self] in
            self?.item.value.isValue = $0.element!
            self?.itemvm.itemArray[(self?.index)!] = (self?.item.value)!
        }
    }
}

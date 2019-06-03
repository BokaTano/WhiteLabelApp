//
//  NewsViewController.swift
//  BrettlyPrototype05
//
//  Created by Lars Klimmeck on 28.11.18.
//  Copyright © 2018 Sendmeback GmbH. All rights reserved.
//

import Bond
import Foundation
import UIKit

class HomeViewController: UIViewController, Storyboarded {
    var coordinator: AppCoordinator?
    var itemvm: ItemsViewModel?

    @IBOutlet var stringValueTextfield: UITextField!
    @IBOutlet var intValueTextfield: UITextField!
    @IBOutlet var isValueSwitch: UISwitch!
    @IBOutlet var stringValueLbl: UILabel!
    @IBOutlet var intValueLbl: UILabel!
    @IBOutlet var isValueLbl: UILabel!
    @IBOutlet var tableview: UITableView!

    @IBAction func addBtn(_ sender: UIButton) {
        if stringValueTextfield.text == nil {
            openTextfieldIsEmptyAlert()
        } else {
            itemvm?.addToArray(valueString: itemvm?.valueString.value,
                               valueInt: itemvm?.valueInt.value,
                               isValue: itemvm?.isValue.value)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setTabBarDetails()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindVC()
    }
}

extension HomeViewController {
    func setTabBarDetails() {
        title = "News"
        tabBarItem.image = #imageLiteral(resourceName: "news")
    }

    func bindVC() {
        //TODO: nested Binding like here: https://github.com/DeclarativeHub/Bond/issues/113

        //UIBidirectional Bind Example with overwriting of Getter and Setter
        //        _ = isValueSwitch.reactive.isOn
        //            .bidirectionalMap(
        //            to: { $0 ? "true" : "false"},
        //            from: { $0 == "true" })
        //            .bidirectionalBind(to: isValueLbl.reactive.text)

        //Bidirectional Bind on UI Elements and VM Elements
        itemvm?.valueString.bidirectionalBind(to: stringValueTextfield.reactive.text)
        itemvm?.isValue.bidirectionalBind(to: isValueSwitch.reactive.isOn)

        //UIBidirectional Bind Example with overwriting of Getter and Setter
        intValueTextfield.reactive.text
            .bidirectionalMap(to: { Int($0!) ?? 0 }, from: { "\($0 ?? 0)" })
            .bidirectionalBind(to: itemvm!.valueInt)

        //Binds
        itemvm?.valueString.bind(to: stringValueLbl.reactive.text)
        itemvm?.valueInt.map { "\($0 ?? 0)" } .bind(to: intValueLbl.reactive.text)

        //Bind UITableView to array
        itemvm?.itemArray.bind(to: tableview, animated: true) { dataSource, indexPath, tableView -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            cell?.textLabel?.text = dataSource[indexPath.row].valueString
            return cell!
        }

        //Observe tap on row and open another VC
        _ = tableview.reactive.selectedRowIndexPath.observe { [weak self] event in
            self?.coordinator!.openDetailViewController(index: event.element?.row ?? 1)
        }

        //editing style
        tableview.commitStyle.observeNext { editingStyle, row in
            switch editingStyle {
            case 1: self.itemvm?.itemArray.remove(at: row)
            default:  print("Hmmm, not sure about that one.")
            }
        }
        .dispose(in: tableview.reactive.bag)
    }

    func openTextfieldIsEmptyAlert() {
        let alert = UIAlertController(title: "Textfield is empty!",
                                      message: "Please enter text in the textfield.",
                                      preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Return", style: .default) { action in
            print("This is action1: \(action)")
        }
        alert.addAction(action1)
        present(alert, animated: true, completion: nil)
    }
}

//
//  EmptyTableVIew.swift
//  BrettlyPrototype03
//
//  Created by Lars Klimmeck on 22.11.18.
//  Copyright © 2018 Sendmeback GmbH. All rights reserved.
//

//Implemented in secondVC
import UIKit

class EmptyTableViewView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet var image: UIImageView!
    @IBOutlet var header: UILabel!
    @IBOutlet var text: UITextView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }

    func loadViewFromNib() {
        Bundle.main.loadNibNamed("EmptyTableViewView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

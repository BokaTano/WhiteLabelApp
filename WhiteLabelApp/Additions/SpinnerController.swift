//
//  SpinnerController.swift
//  BrettlyPrototype03
//
//  Created by Lars Klimmeck on 21.11.18.
//  Copyright © 2018 Sendmeback GmbH. All rights reserved.
//

//tutorial: https://prograils.com/posts/reusable-activity-indicator-with-swift

import Foundation
import UIKit

open class Spinner {
    internal static var spinner: UIActivityIndicatorView?

    public static var style: UIActivityIndicatorView.Style = .whiteLarge
    public  static var baseBackColor = UIColor(white: 0, alpha: 0.6)
    public  static var baseColor = UIColor.white

    public  static func start(style: UIActivityIndicatorView.Style = style,
                              backColor: UIColor = baseBackColor,
                              baseColor: UIColor = baseColor) {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(update),
                                               name: UIDevice.orientationDidChangeNotification,
                                               object: nil)

        if spinner == nil, let window = UIApplication.shared.keyWindow {
            let frame = UIScreen.main.bounds
            spinner = UIActivityIndicatorView(frame: frame)
            spinner!.backgroundColor = backColor
            spinner!.style = style
            spinner?.color = baseColor
            window.addSubview(spinner!)
            spinner!.startAnimating()
        }
    }

    public static func stop() {
        if spinner != nil {
            spinner!.stopAnimating()
            spinner!.removeFromSuperview()
            spinner = nil
        }
    }

    @objc
    public static func update() {
        if spinner != nil {
            stop()
            start()
        }
    }
}

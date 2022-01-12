//
//  UIControl.swift
//  POEPlus
//
//  Created by Алексей Филатов on 26.11.2021.
//

import UIKit

extension UIControl {
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping()->()) {
        addAction(UIAction { (action: UIAction) in closure() }, for: controlEvents)
    }
}

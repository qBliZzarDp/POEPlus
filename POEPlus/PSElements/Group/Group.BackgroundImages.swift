//
//  Group.BackgroundImages.swift
//  POEPlus
//
//  Created by Алексей Филатов on 17.11.2021.
//

import UIKit

extension Group {
    /// Энум изображений групп и групп для камней умений
    enum BackgroundImage {
        /// Большой размер фон групп (если более 3х орит)
        case large
        /// Средний размер фона групп (если 2 орибиты)
        case medium
        /// Малый размер фона групп (если 1 орбита)
        case small
        /// Размеры  и фоны  для групп камней умений
        case jewel(JewelBackgroundImage)
        
        var image: UIImage {
            switch self {
            case .large:
                if let image = UIImage(named: "PSGroupBackground3.png") {
                    return image
                }
            case .medium:
                if let image = UIImage(named: "PSGroupBackground2.png") {
                    return image
                }
            case .small:
                if let image = UIImage(named: "PSGroupBackground1.png") {
                    return image
                }
            case .jewel(let jewel):
                switch jewel {
                case .large:
                    if let image = UIImage(named: "GroupBackgroundLargeHalfAlt.png") {
                        return image
                    }
                case .medium:
                    if let image = UIImage(named: "GroupBackgroundMediumAlt.png") {
                        return image
                    }
                case .small:
                    if let image = UIImage(named: "GroupBackgroundSmallAlt.png") {
                        return image
                    }
                }
            }
            return self.image
        }
    }
    enum JewelBackgroundImage {
        case large
        case medium
        case small
    }
}

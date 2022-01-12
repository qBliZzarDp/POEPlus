//
//  NodeStateProtocol.swift
//  POEPlus
//
//  Created by Алексей Филатов on 30.11.2021.
//

import UIKit

protocol NodeStateProtocol {
    func setImages(for type: NodeClass.NodeType, classStartIdx: Int, masteryName: String) -> UIImage
}

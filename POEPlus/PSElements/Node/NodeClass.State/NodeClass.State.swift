//
//  NodeClass.State.swift
//  POEPlus
//
//  Created by Алексей Филатов on 27.10.2021.
//

import Foundation

extension NodeClass {
    /// Состояние умения
    enum NodeState {
        /// Активное
        case allocate
        /// Не активное
        case normal

        var setImageName: NodeStateProtocol {
            switch self {
            case .allocate:
                return NodeAllocated()
            case .normal:
                return NodeUnallocated()
            }
        }
    }
}

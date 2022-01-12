//
//  PSRenderProperty.swift
//  POEPlus
//
//  Created by Алексей Филатов on 26.11.2021.
//

import UIKit

/// Структура для настройки отображения PassiveTreeView
struct PSRenderProperty: PassiveTreeCreaterDataSource {
    
    private let model = TreeDataStorage.shared
    let view: UIView

    init(view: UIView) {
        self.view = view
    }

    func treeSize(_ size: PassiveTreeView) -> (xMax: CGFloat, xMin: CGFloat, yMax: CGFloat, yMin: CGFloat) {
        guard let model = model.passiveTree else { return (0,0,0,0) }
        return (CGFloat(model.maxX ?? 0), CGFloat(model.minX ?? 0), CGFloat(model.maxY ?? 0), CGFloat(model.minY ?? 0))
    }

    func nodeDictionary(_ node: PassiveTreeView) -> [String : SkillNodes] {
        guard let nodes = model.passiveTree?.nodes else { return [:] }
        return nodes
    }

    func groupDictionary(_ group: PassiveTreeView) -> [Int : TreeNum] {
        guard let groups = model.passiveTree?.groups else { return [:] }
        return groups
    }

    func startRenderOn(_ scrollView: PassiveTreeView) -> UIScrollView {
        let scroll = PassiveTreeScrollView(contentView: scrollView, frame: UIScreen.main.bounds)
        view.addSubview(scroll)
        return scroll
    }
}

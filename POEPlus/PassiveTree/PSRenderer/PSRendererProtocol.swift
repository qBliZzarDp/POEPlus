//
//  PSRendererProtocol.swift
//  POEPlus
//
//  Created by Алексей Филатов on 26.11.2021.
//

import Foundation

/// Протокол, реализующий визуальную обработку древа
protocol PSRendererProtocol { }

extension PSRendererProtocol {
    func startRenderTree(property: PSRenderProperty) {
        let view = PassiveTreeView()
        view.dataSource = property
    }
}

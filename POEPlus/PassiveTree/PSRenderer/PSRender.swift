//
//  PSRender.swift
//  POEPlus
//
//  Created by Алексей Филатов on 26.11.2021.
//

import UIKit

/// Протокол, описывающий методы для отображения вью древа
protocol RenderProtocol: AnyObject {
    func startRenderOn(_ view: UIView)
}

/// Класс-отрисовщик древа пассивных умений
class Render: RenderProtocol {

    private let render: PSRendererProtocol = PassiveTreeView()
    
    /// Метод для отрисовки древа пассивных умений на UIViiew
    /// - Parameter view: UIView, на который необходимо добавить древо пассивных умений
    func startRenderOn(_ view: UIView) {
        render.startRenderTree(property: PSRenderProperty(view: view))
    }
}

//
//  Connector.swift
//  POEPlus
//
//  Created by Алексей Филатов on 05.11.2021.
//

import UIKit

/// Класс для построения коннекторов
final class Connector {
    
    private let mathPi = CGFloat.pi
    
    /// Метод, отвечающий за создание коннекторов между умениями
    /// - Parameters:
    ///   - startNode: начальное умение для соединения со вторым
    ///   - endNode: второе умение, служащее направлением соединения
    /// - Returns: дугу или прямую линию (в зависимости от местоположения умений) для соединения умений
    func createConnector(startNode: NodeClass, endNode: NodeClass) -> CAShapeLayer? {
        let start = startNode
        let end = endNode
        if start.nodeModel.group == end.nodeModel.group && start.nodeModel.orbit == end.nodeModel.orbit {
            if start.nodeAngle > end.nodeAngle {
                return createArc(startNode: start, endNode: end, startAngle: start.nodeAngle, endAngle: end.nodeAngle)
            } else {
                return createArc(startNode: start, endNode: end, startAngle: start.nodeAngle, endAngle: end.nodeAngle)
            }
        } else {
            return createLine(startNode: start, endNode: end)
        }
    }
    
    /// Метод, создающий дугу между умениями
    /// - Parameters:
    ///   - startNode: начальная точка - умение, для  построения дуги
    ///   - endNode: конечная точка  - умение, для  построения дуги
    ///   - startAngle: начальный точка на окружности умений для определения угла дуги
    ///   - endAngle: конечная точка на окружности умений для определения угла дуги
    /// - Returns: дугу для соединения начального и конечного нода
    private func createArc(startNode: NodeClass, endNode: NodeClass, startAngle: CGFloat, endAngle: CGFloat) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath()
        /// Получение начальных координат и смещение их на 90* для корректного отображения
        var start = startAngle - mathPi / 2
        var end = endAngle - mathPi / 2
        /// Если начальный угол больше конечного, меняем точки местами
        if start > end {
            (start, end) = (end, start)
        }
        /// Вычисляем угол дуги, чтобы понять в какую сторону рисовать. Так как мы отняли по 90*, то угол что получился с отрицательным значением должен рисоваться против часовой стрелки.
        let arcAngle = start - end

        if arcAngle < -mathPi {
            path.addArc(withCenter: startNode.groupCenter, radius: startNode.nodeSettings.orbitDist[startNode.nodeModel.orbit ?? 0], startAngle: start, endAngle: end, clockwise: false)
        } else {
            path.addArc(withCenter: startNode.groupCenter, radius: startNode.nodeSettings.orbitDist[startNode.nodeModel.orbit ?? 0], startAngle: start, endAngle: end, clockwise: true)
        }
        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = #colorLiteral(red: 0.5240191065, green: 0.5011639614, blue: 0.2445632527, alpha: 0.6986014259)
        shapeLayer.fillColor = .none
        shapeLayer.lineWidth = 15.0
        shapeLayer.position = CGPoint(x: 0, y: 0)
        return shapeLayer
    }
    
    /// Создает обычную линию для соединения умений
    /// - Parameters:
    ///   - startNode: начальная точка линии - умение
    ///   - endNode: конечное точка  линии - умение
    /// - Returns: прямую линию для соединения умений
    private func createLine(startNode: NodeClass, endNode: NodeClass) -> CAShapeLayer {
        let path = UIBezierPath()
        let shapeLayer = CAShapeLayer()
        
        path.move(to: startNode.center)
        path.addLine(to: endNode.center)
        
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = #colorLiteral(red: 0.5240191065, green: 0.5011639614, blue: 0.2445632527, alpha: 0.7)
        shapeLayer.fillColor = .none
        shapeLayer.lineWidth = 15.0
        return shapeLayer
    }
}
// MARK: - Еще не зайдествованы
extension Connector {
    enum ConnectorState {
        case normal
        case intermediate
        case active
    }
    enum ConnectorType {
        case line
        case orbit
    }
}

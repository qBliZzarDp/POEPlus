//
//  PassiveTreeCreater.swift
//  POEPlus
//
//  Created by Алексей Филатов on 25.11.2021.
//

import UIKit

/// Протокол, описывающий методы передачи данных для настройки PassiveTreeView
protocol PassiveTreeCreaterDataSource {
    /// Метод для установки размера View
    /// - Returns: данные координат, для установки ширины/высоты вью и ее начала координат
    func treeSize(_ size: PassiveTreeView) -> (xMax: CGFloat, xMin: CGFloat, yMax: CGFloat, yMin: CGFloat)
    /// Метод, реализующий подключение словаря умений
    /// - Returns: словарь [String: SkillNodes] для установки умений на древо
    func nodeDictionary(_ node: PassiveTreeView) -> [String : SkillNodes]
    /// Метод, реализующий подключение словаря групп
    /// - Returns: словарь [Int: TreeNum] для установки групп на древо
    func groupDictionary(_ group: PassiveTreeView) -> [Int: TreeNum]
    /// Метод для установки готовой модели древа пассивных умений на scrollView
    /// - Returns: UIScrollView для помещения PassiveTreeView на него
    func startRenderOn(_ scrollView: PassiveTreeView) -> UIScrollView
}

/// Класс, представляющий собой UIView с настройками древа пассивных умений
class PassiveTreeView: UIView, PSRendererProtocol {
    
    public var dataSource: PassiveTreeCreaterDataSource? {
        didSet {
            setupBounds()
            setupView()
            addOnScrollView()
            self.backgroundColor = #colorLiteral(red: 0.04802367301, green: 0.0634347555, blue: 0.09249411975, alpha: 1)
        }
    }

    // Хранилище данных, расположенных на вью
    /// Массив групп, расположенных на вью
    private var groupArray = TreeDataStorage.shared.groupArray
    /// Массив умений, расположенных на вью
    private var nodeArray = TreeDataStorage.shared.nodeArray

    /// Метод, отвечающий за установку групп и умений на вью
    private func setupView() {
        guard let groups = dataSource?.groupDictionary(self) else { return }
        for (id, group) in groups {
            let group = Group(group: group, groupID: id)
            takeFirstLayer(from: &groupArray, at: self, subview: group, aboveGroup: false)
            for nodeNum in group.nodes {
                guard let nodes = dataSource?.nodeDictionary(self)[nodeNum] else { return }
                let node = NodeClass(nodes: nodes, type: .custom, group: group)
                takeFirstLayer(from: &nodeArray, at: self, subview: node, aboveGroup: true)
            }
        }
        generateConnectors()
    }

    /// Метод, отвечающий за создание коннекторов между умениями
    private func generateConnectors() {
        let connector = Connector()
        for node in nodeArray {
            let nodeStart = node
            guard let outNodes = nodeStart.nodeModel.out else { return }
            outNodes.forEach { out in
                guard let outNum = Int(out) else { return }
                let connect = nodeArray.filter({$0.nodeModel.skill == outNum })
                for endNode in connect {
                    if connectorFilter(node1: nodeStart, node2: endNode) {
                        guard let connectorLine = connector.createConnector(startNode: nodeStart, endNode: endNode) else { return }
                        self.layer.insertSublayer(connectorLine, above: groupArray.first?.layer)
                        endNode.path.append(connectorLine)
                    }
                }
            }
        }
    }

    /// Установка размера
    private func setupBounds() {
        guard let size = dataSource?.treeSize(self) else { return }
        let treeBounds = CGRect(origin: .init(x: size.xMin, y: size.yMin), size:
                                        .init(width: -size.xMin + size.xMax, height: -size.yMin + size.yMax))
        self.bounds = treeBounds
        self.backgroundColor = #colorLiteral(red: 0.04802367301, green: 0.0634347555, blue: 0.09249411975, alpha: 1)
    }

    /// Фильтр коннекторов
    private func connectorFilter(node1: NodeClass, node2: NodeClass) -> Bool {
        if node1.nodeType != .classStart && node2.nodeType != .classStart
            && node1.nodeType != .mastery && node2.nodeType != .mastery
            && node1.nodeModel.ascendancyName == node2.nodeModel.ascendancyName
            || node1.nodeModel.isProxy == false && node2.nodeModel.isProxy == false {
            return true
        }
        return false
    }

    /// Метод для обработки subview
    private func takeFirstLayer<T: UIView>(from array: inout [T], at view: UIView, subview: T, aboveGroup: Bool) {
        switch aboveGroup {
        case true:
            guard let firstGroup = groupArray.first  else { return }
            view.insertSubview(subview, aboveSubview: firstGroup)
        case false:
            if let first = array.first {
                view.insertSubview(subview, belowSubview: first)
            } else {
                view.insertSubview(subview, at: 0)
            }
        }
        array.append(subview)
    }

    /// Установка вью на scrollView
    private func addOnScrollView() {
        guard let scrollview = dataSource?.startRenderOn(self) else { return }
        scrollview.addSubview(self)
    }
}

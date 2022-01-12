//
//  PassiveTreeModels.swift
//  POEPlus
//
//  Created by Алексей Филатов on 18.11.2021.
//

import UIKit

/// Набор структур для передачи данных между компонентами VIP цикла. Каждый круг цикла имеет в себе 3 вида структур
/// -  Request: - структура запроса
/// -  Response  - структура ответа
/// -  ViewModel - структура модели представления
enum PassiveTree {
        struct Request {
            var passiveTree: UIView
        }
        struct Response {
            var isError: Bool
            var message: String?
        }
        struct ViewModel {
            var isError: Bool
            var message: String?
        }
}

//
//  PassiveTreeRouter.swift
//  POEPlus
//
//  Created by Алексей Филатов on 18.11.2021.
//

import Foundation

/// Все методы переходов описаны в этом протоколе.
@objc protocol PassiveTreeRoutingLogic {
}

/// Протокол, описывающий данные, которые будут переданы в целевой контроллер.
protocol PassiveTreeDataPassing {
  var dataStore: PassiveTreeDataStore? { get }
}

class PassiveTreeRouter: NSObject, PassiveTreeRoutingLogic, PassiveTreeDataPassing {
  weak var viewController: PassiveTreeViewController?
  var dataStore: PassiveTreeDataStore?

}

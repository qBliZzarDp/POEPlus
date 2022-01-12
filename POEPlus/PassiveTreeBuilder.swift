//
//  PassiveTreeBuilder.swift
//  POEPlus
//
//  Created by Алексей Филатов on 18.11.2021.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    static func buildPassiveTreeView() -> UIViewController
}

final class Builder: BuilderProtocol {
    
    static func buildPassiveTreeView() -> UIViewController {
        let viewController = PassiveTreeViewController()
        let interactor = PassiveTreeInteractor()
        let presenter = PassiveTreePresenter()
        let router = PassiveTreeRouter()
        let render = Render()
        viewController.interactor = interactor
        viewController.router = router
        interactor.render = render
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        return viewController
    }
}

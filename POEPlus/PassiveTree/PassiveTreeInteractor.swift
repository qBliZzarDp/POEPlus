//
//  PassiveTreeInteractor.swift
//  POEPlus
//
//  Created by Алексей Филатов on 18.11.2021.
//

import Foundation

/// Протокол, описывающий методы бизнес-логики
protocol PassiveTreeBusinessLogic {
    func treeView(request: PassiveTree.Request)
}
/// Протокол передачи данных
protocol PassiveTreeDataStore {
    
}

/// Класс, который содержит в себе бизнес логику сцены.
class PassiveTreeInteractor: PassiveTreeBusinessLogic, PassiveTreeDataStore {
    
    var treeDataStorage = TreeDataStorage.shared
    var presenter: PassiveTreePresentationLogic?
    var worker: PassiveTreeWorker?
    var render: RenderProtocol?
    
    func treeView(request: PassiveTree.Request) {
        worker = PassiveTreeWorker()
        worker?.startLoad(
            onSucces: { [weak self] response in
                /// Скорей всего тут надо будет перекинуть в сторейдж еще в воркере
                self?.presenter?.presentPassiveTree(response: PassiveTree.Response(isError: false, message: "Passive tree load successfully"))
            }, onError: { [weak self] response in
                self?.presenter?.presentPassiveTree(response: PassiveTree.Response(isError: true, message: response.message))
            })
        render?.startRenderOn(request.passiveTree)
    }
}

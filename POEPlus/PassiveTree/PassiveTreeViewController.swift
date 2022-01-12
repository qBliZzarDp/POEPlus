//
//  PassiveTreeViewController.swift
//  POEPlus
//
//  Created by Алексей Филатов on 18.11.2021.
//

import UIKit

protocol PassiveTreeDisplayLogic: AnyObject {
    func displaypassiveTree(viewModel: PassiveTree.ViewModel)
    func errorCreatePassiveTree(viewModel: PassiveTree.ViewModel)
    func succesCreatePassiveTree(viewModel: PassiveTree.ViewModel)
}

class PassiveTreeViewController: UIViewController, PassiveTreeDisplayLogic {
    var interactor: PassiveTreeBusinessLogic?
    var router: (NSObjectProtocol & PassiveTreeRoutingLogic & PassiveTreeDataPassing)?

    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        doRequestToCreatePassiveTree()
    }
    
    // MARK: Requsets
    
    func doRequestToCreatePassiveTree() {
        let request = PassiveTree.Request(passiveTree: view)
        interactor?.treeView(request: request)
    }
    // Показать что-то
    func displaypassiveTree(viewModel: PassiveTree.ViewModel) {
//        view.addSubview(viewModel.scrollView)
        
    }
    
    func errorCreatePassiveTree(viewModel: PassiveTree.ViewModel) {
        print(viewModel.message)
        print(viewModel.isError)
    }
    
    func succesCreatePassiveTree(viewModel: PassiveTree.ViewModel) {
        print(viewModel.message)
        print(viewModel.isError)
    }
    
}

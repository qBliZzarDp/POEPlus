//
//  PassiveTreePresenter.swift
//  POEPlus
//
//  Created by Алексей Филатов on 18.11.2021.
//

import Foundation

/// Протокол, описывающий методы для отображения данныхъ
protocol PassiveTreePresentationLogic {
  func presentPassiveTree(response: PassiveTree.Response)
}

/// Класс, занимающийся подготовкой данных для отображения.
class PassiveTreePresenter: PassiveTreePresentationLogic {
  weak var viewController: PassiveTreeDisplayLogic?
  
  // MARK: Do something
  
  func presentPassiveTree(response: PassiveTree.Response) {
      let viewModel = PassiveTree.ViewModel(isError: response.isError, message: response.message)

      if response.isError {
          viewController?.errorCreatePassiveTree(viewModel: viewModel)
      } else {
          viewController?.succesCreatePassiveTree(viewModel: viewModel)
      }
  }
}

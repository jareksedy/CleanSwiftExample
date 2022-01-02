//
//  TestScreenPresenter.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 02.01.2022.
//

import Foundation

protocol TestScreenPresentationLogic {

  /// Метод форматирования полученных данных с Interactor'a
  func presentUser(_ response: HomeModels.FetchUser.Response)
}

final class TestScreenPresenter: TestScreenPresentationLogic {

  /// Ссылка на логику отображения View Controller'a
  weak var viewController: TestScreenDisplayLogic?

  func presentUser(_ response: TestScreenModels.FetchUser.Response) {
    // Для примера отформатируем номер телефона
    let formattedPhone = response.userPhone.replacingOccurrences(of: "-", with: " ")

    // Создаем экземляр ViewModel для отправки в View Controller
    let viewModel = TestScreenModels.FetchUser.ViewModel(userPhone: formattedPhone, userEmail: response.userEmail)

    // Вызываем метод логики отображения у View Controller'a
    viewController?.displayUser(viewModel)
  }
}

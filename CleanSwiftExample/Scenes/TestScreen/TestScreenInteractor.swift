//
//  TestScreenInteractor.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 02.01.2022.
//

import Foundation

protocol TestScreenBusinessLogic {
  func fetchUser(_ request: TestScreenModels.FetchUser.Request)
}

final class TestScreenInteractor: TestScreenBusinessLogic {

  var presenter: TestScreenPresentationLogic?

  func fetchUser(_ request: TestScreenModels.FetchUser.Request) {
    // Здесь должен быть код получения данных
    // Для примера просто создадим константы
    let userPhone = "+7 (999) 111-22-33"
    let userEmail = "im@alekseypleshkov.ru"
    // ...
    // Создаем запрос к Presentor'у с необходимыми данными
    let response = TestScreenModels.FetchUser.Response(userPhone: userPhone, userEmail: userEmail)

    // Вызываем метод логики презентации у Presentor'а
    presenter?.presentUser(response)
  }
}

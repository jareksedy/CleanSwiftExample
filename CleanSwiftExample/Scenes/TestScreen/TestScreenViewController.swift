//
//  TestScreenViewController.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 02.01.2022.
//

import UIKit

/// Протокол логики для отображения подготовленной информации
protocol TestScreenDisplayLogic {
  /// Метод логики отображения данных
  func displayUser(_ viewModel: TestScreenModels.FetchUser.ViewModel)
}

class TestScreenViewController: UIViewController {
    
    /// Ссылка на протокол бизнес логики Interactor'a сцены
    var interactor: TestScreenBusinessLogic?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      setup()
    }

    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setup()
    }
    
    /// Метод для стартовой настройки компонентов сцены
    private func setup() {
      // Создаем компоненты VIP цикла
      let interactor = TestScreenInteractor()
      let presenter = TestScreenPresenter()

      // Связываем созданные компоненты
      interactor.presenter = presenter
      presenter.viewController = self

      // Указываем ссылку на Interactor для View Controller
      self.interactor = interactor
    }
    
    /// Делаем запрос к Interactor для получения данных
    private func loadUserInfromation() {
      // Создаем экземпляр запроса к Interactor с параметрами
      let request = TestScreenModels.FetchUser.Request(userName: "Aleksey")

      // Вызываем метод бизнес логики у Interactor'a
      interactor?.fetchUser(request)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
       loadUserInfromation()
    }
}

extension TestScreenViewController: TestScreenDisplayLogic {
  func displayUser(_ viewModel: TestScreenModels.FetchUser.ViewModel) {
    print(viewModel)
  }
}

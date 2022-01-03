//
//  TestTemplateInteractor.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 03.01.2022.
//

import UIKit

protocol TestTemplateBusinessLogic {
    func doSomething(request: TestTemplate.Something.Request)
}

protocol TestTemplateDataStore {
    // var name: String { get set }
}

class TestTemplateInteractor: TestTemplateBusinessLogic, TestTemplateDataStore {
    var presenter: TestTemplatePresentationLogic?
    var worker: TestTemplateWorkerLogic?
    // var name: String = ""

    // MARK: - Do something

    func doSomething(request _: TestTemplate.Something.Request) {
        worker = TestTemplateWorker()
        worker?.doSomeWork()

        let response = TestTemplate.Something.Response(userName: "Jarek Šedÿ", userEmail: "jareksedy@icloud.com", userPhoneNo: "+77770443761")
        presenter?.presentSomething(response: response)
    }
}

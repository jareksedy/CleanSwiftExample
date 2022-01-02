//
//  HomeScreenViewController.swift
//  CleanSwiftExample
//
//  Created by Ярослав on 01.01.2022.
//

import UIKit

protocol HomeScreenDisplayLogic {
    func displayGreeting(viewModel: HomeScreen.Home.ViewModel)
}

class HomeScreenViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    func displayGreeting(viewModel: HomeScreen.Home.ViewModel) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

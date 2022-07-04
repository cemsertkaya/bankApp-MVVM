//
//  BanksFlowCoordinator.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 4.07.2022.
//
import Foundation
import UIKit


protocol BanksFlowCoordinatorDependencies
{
    func makeBanksListViewController(actions : BanksListViewModelActions) -> BanksListViewController
    func makeBankDetailsViewController(bank : Bank) -> BankDetailsViewController
}


final class BanksFlowCoordinator
{
    private weak var navigationController: UINavigationController?
    private let dependencies : BanksFlowCoordinatorDependencies
    
  
    
    init(navigationController: UINavigationController, dependencies : BanksFlowCoordinatorDependencies)
    {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start()
    {
        let actions = BanksListViewModelActions(showBankDetails: showBankDetails)
        let vc = dependencies.makeBanksListViewController(actions: actions)
        navigationController?.pushViewController(vc, animated: false)
        
    }

    private func showBankDetails(bank: Bank)
    {
        let vc = dependencies.makeBankDetailsViewController(bank: bank)
        navigationController?.pushViewController(vc, animated: true)
    }

    
}


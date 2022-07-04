//
//  AppFlowCoordinator.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 3.07.2022.
//

import Foundation
import UIKit

final class AppFlowCoordinator
{
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer

    init(navigationController: UINavigationController, appDIContainer: AppDIContainer)
    {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }

    func start()
    {
        let banksSceneDIContainer = appDIContainer.makeBanksSceneDIContainer()
        let flow = banksSceneDIContainer.makeBanksSearchFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
}

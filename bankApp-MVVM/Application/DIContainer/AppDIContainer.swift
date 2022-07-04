//
//  AppDIContainer.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 3.07.2022.
//

import Foundation

final class AppDIContainer
{
    
    lazy var appConfiguration = AppConfiguration()
    
    // MARK: - Network
    lazy var apiDataTransferService: DataTransferService =
    {
        let config = ApiDataNetworkConfig(baseURL: URL(string: appConfiguration.apiBaseURL)!)
        let apiDataNetwork = DefaultNetworkService(config: config)
        return DefaultDataTransferService(with: apiDataNetwork)
    }()
    
    
    // MARK: - DIContainers of scenes
    func makeBanksSceneDIContainer() -> BanksSceneDIContainer
    {
        let dependencies = BanksSceneDIContainer.Dependencies(apiDataTransferService: apiDataTransferService)
        return BanksSceneDIContainer(dependencies: dependencies)
    }
}

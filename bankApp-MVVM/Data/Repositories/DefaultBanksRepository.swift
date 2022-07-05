//
//  DefaultBankRepository.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 3.07.2022.
//
import Foundation



final class DefaultBanksRepository
{
    private let dataTransferService : DataTransferService
    
    init(dataTransferService : DataTransferService)
    {
        self.dataTransferService = dataTransferService
    }
}

extension DefaultBanksRepository: BanksRepository
{
    func fetchBanksList(completion: @escaping (Result<[Bank], Error>) -> Void) -> Cancellable?
    {
        
    
        let task = RepositoryTask()
        
        
        task.networkTask = self.dataTransferService.request(with:  APIEndpoints.getBanks()) { result in
            switch result
            {
                case .success(let banks):
                    completion(.success(banks))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
        
        return task
    }

}

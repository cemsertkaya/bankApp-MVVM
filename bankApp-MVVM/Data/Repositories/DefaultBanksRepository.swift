//
//  DefaultMoviesRepository.swift
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
        

        let endpoint = APIEndpoints.getBanks()
        
        /*
        task.networkTask = self.dataTransferService.request(with: endpoint) { result in
            switch result
            {
                case .success():
                    completion(.success(result))
                case .failure():
                    completion(.failure(error))
            }
        }*/
        
        return task
    }

}

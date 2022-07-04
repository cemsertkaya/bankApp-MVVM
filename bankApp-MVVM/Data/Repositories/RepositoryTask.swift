//
//  RepositoryTask.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 3.07.2022.
//

import Foundation

class RepositoryTask: Cancellable
{
    var networkTask: NetworkCancellable?
    var isCancelled: Bool = false
    
    func cancel() {
        networkTask?.cancel()
        isCancelled = true
    }
}

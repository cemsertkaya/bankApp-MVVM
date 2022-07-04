//
//  BankListViewController.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 3.07.2022.
//

import UIKit


final class BanksListViewController: UIViewController, StoryboardInstantiable
{
    private var viewModel : BanksListViewModel!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("cemDidLoad")
        
        // Do any additional setup after loading the view.
    }
    
    static func create(with viewModel: BanksListViewModel) -> BanksListViewController
    {
        let view = BanksListViewController.instantiateViewController()
        view.viewModel = viewModel
        print("cem")
        return view
    }

}



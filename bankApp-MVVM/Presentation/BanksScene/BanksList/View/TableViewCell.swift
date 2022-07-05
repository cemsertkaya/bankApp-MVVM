//
//  TableViewCell.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 5.07.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var state: UILabel!
    @IBOutlet var city: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var type: UILabel!
    @IBOutlet var closestAtm: UILabel!
    
    private var viewModel : BanksListItemViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fill(with viewModel: BanksListItemViewModel)
    {
        self.viewModel = viewModel
        state.text = viewModel.state
        city.text = viewModel.city
        address.text = viewModel.address
        type.text = viewModel.type.rawValue
        closestAtm.text = viewModel.closestATM
    }
}

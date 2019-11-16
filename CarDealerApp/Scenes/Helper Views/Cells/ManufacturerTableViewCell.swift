//
//  ManufacturerTableViewCell.swift
//  CarDealerApp
//
//  Created by Nisum on 11/16/19.
//  Copyright © 2019 Orlando Arzola. All rights reserved.
//

import UIKit

class ManufacturerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var manufacturerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    func setupCell(viewModel: ManufacturerViewModel) {
        manufacturerLabel.text = viewModel.name
        backgroundColor = viewModel.row % 2 == 0 ? .lightGray : .white
    }
    
}

struct ManufacturerViewModel {
    let name: String
    let row: Int
}

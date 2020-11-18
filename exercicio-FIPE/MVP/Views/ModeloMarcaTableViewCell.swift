//
//  ModeloMarcaTableViewCell.swift
//  exercicio-FIPE
//
//  Created by Mizia Lima on 11/18/20.
//

import UIKit

class ModeloMarcaTableViewCell: UITableViewCell {

    @IBOutlet weak var labelModelos: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setup(modelo: ModeloMarca?){
        //
    }
}

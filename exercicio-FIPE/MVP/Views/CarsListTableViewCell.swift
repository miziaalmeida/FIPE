import UIKit

class CarsListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var marcasLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(marca: Marca){
        marcasLabel.text = marca.nome
    }
    
}

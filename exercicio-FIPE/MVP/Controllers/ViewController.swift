import Alamofire
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableViewFIPE: UITableView!
    
    var arrayMarcas = [Marca]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewFIPE.register(UINib(nibName: "CarsListTableViewCell", bundle: nil), forCellReuseIdentifier: "CarsListTableViewCell")
        
        tableViewFIPE.delegate = self
        tableViewFIPE.dataSource = self
        
        request()
    }
    
    func loadMarcas(arrayMarcas: [Marca]) {
        self.arrayMarcas = arrayMarcas
        tableViewFIPE.reloadData()
    }
    
    func request() {
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas").responseJSON { (response) in
            if let arrayDicts = response.value as? [[String: Any]] {
                var arrayMarcas = [Marca]()
                
                for item in arrayDicts {
                    arrayMarcas.append(Marca(fromDictionary: item))
                }
                DispatchQueue.main.async {
                    self.loadMarcas(arrayMarcas: arrayMarcas)
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate{
    
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMarcas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarsListTableViewCell", for: indexPath) as! CarsListTableViewCell
        let object = arrayMarcas[indexPath.row]
        cell.setup(marca: object)
        return cell
    }
}

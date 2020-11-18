import Alamofire
import UIKit

class ModeloTableViewController: UITableViewController {
    
    var arrayModelos = [ModeloMarca]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        request()
        
        tableView.register(UINib(nibName: "CarListTableViewCell", bundle: nil), forCellReuseIdentifier: "CarListTableViewCell")
        
    }
    
    func loadModelo(arrayModelo: [ModeloMarca]) {
        self.arrayModelos = arrayModelo
        tableView.reloadData()
    }
    
    func request() {
        AF.request("https://parallelum.com.br/fipe/api/v1/carros/marcas/21/modelos").responseJSON { (response) in
            if let arrayDicts = response.value as? [[String: Any]] {
                var arrayModelos = [ModeloMarca]()
                
                for item in arrayDicts {
                    arrayModelos.append(ModeloMarca(fromDictionary: item))
                }
                DispatchQueue.main.async {
                    self.loadModelo(arrayModelo: arrayModelos)
                }
            }
        }
    }
}


// MARK: - Table view data source

func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 0
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "CarsListTableViewCell", for: indexPath) as! CarsListTableViewCell
   
    return cell
}

/*
 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */

/*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

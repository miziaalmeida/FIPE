import Foundation

class ModeloMarca : NSObject, NSCoding{

    var anos : [Ano]!
    var modelos : [Marca]!
    
    init(fromDictionary dictionary: [String:Any]){
        anos = [Ano]()
        if let anosArray = dictionary["anos"] as? [[String:Any]]{
            for dic in anosArray{
                let value = Ano(fromDictionary: dic)
                anos.append(value)
            }
        }
        modelos = [Marca]()
        if let modelosArray = dictionary["modelos"] as? [[String:Any]]{
            for dic in modelosArray{
                let value = Marca(fromDictionary: dic)
                modelos.append(value)
            }
        }
    }

    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if anos != nil{
            var dictionaryElements = [[String:Any]]()
            for anosElement in anos {
                dictionaryElements.append(anosElement.toDictionary())
            }
            dictionary["anos"] = dictionaryElements
        }
        if modelos != nil{
            var dictionaryElements = [[String:Any]]()
            for modelosElement in modelos {
                dictionaryElements.append(modelosElement.toDictionary())
            }
            dictionary["modelos"] = dictionaryElements
        }
        return dictionary
    }
    
    @objc required init(coder aDecoder: NSCoder)
    {
         anos = aDecoder.decodeObject(forKey :"anos") as? [Ano]
         modelos = aDecoder.decodeObject(forKey :"modelos") as? [Marca]
    }

    @objc func encode(with aCoder: NSCoder)
    {
        if anos != nil{
            aCoder.encode(anos, forKey: "anos")
        }
        if modelos != nil{
            aCoder.encode(modelos, forKey: "modelos")
        }

    }

}

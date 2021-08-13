//
//  ViewController.swift
//  APICollectionView
//
//  Created by Pooja's MacBook Pro on 11/07/21.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource ,UICollectionViewDelegate{
    
    

    @IBOutlet weak var collectionVIew: UICollectionView!
    
    var person = [Person] ()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://jsonplaceholder.typicode.com/posts/1/comments"
        if let url = URL(string : urlString)
        {
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: url) { data, response, error in
                
                if let unwrappeddata = data {
                    
                    if let jsonArray = try? JSONSerialization.jsonObject(with: unwrappeddata, options: []) as? [[String : Any]]
                    {
                        var person = [Person]()
                        for dict in jsonArray{
                            let postId = dict ["postId"] as? Int
                            let id = dict["id"] as? Int
                            let name = dict ["name"] as? String
                            let email = dict ["email"] as? String
                            let body = dict ["body"] as? String
                            person.append(Person(postId: postId ?? 0, id: id ?? 0, name: name ?? "NO name", email: email ?? "no email", body: body ?? "no body"))
                        }
                        
                        self.person = person
                        DispatchQueue.main.async {
                            self.collectionVIew.reloadData()
                        }
                    }
                    }
                else {
                    print ("unable to unwrap data")
                }
            }
            dataTask.resume()
        }
        print("ViewController : viewDidLoad")
        
        title = "PersonDetails"
       self.collectionVIew.delegate = self
        self.collectionVIew.dataSource = self
        self.collectionVIew.collectionViewLayout = UICollectionViewFlowLayout()
        // Do any additional setup after loading the view.
//        self.collectionVIew.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: "PersonCollectionViewCell")// (UINib(nibName: "PersonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PersonCollectionViewCell")
        
    }

    
  //  extension ViewController : UICollectionViewDataSource
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return person.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = self.collectionVIew.dequeueReusableCell(withReuseIdentifier: "PersonCollectionViewCell", for: indexPath) as? PersonCollectionViewCell
            else {
            
           // cell.setup(with: person[indexPath.row])
            return UICollectionViewCell()
                
        }
            let per = person[indexPath.row]
            cell.postId?.text = String(per.postId)
            cell.id?.text = String(per.id)
            cell.body?.text = per.body
            cell.email?.text = per.email
            cell.name?.text = per.name
            
            //cell.postId?.text = "person : \(per.postId) : id :\(per.id) : name : \(per.name) : email :\(per.email) : body :\(per.body)"
            
            return cell
    }
    
    
    
    
    }
extension ViewController : UICollectionViewDelegateFlowLayout{


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350  , height: 300)
}

}

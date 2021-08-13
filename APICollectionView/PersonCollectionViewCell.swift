//
//  PersonCollectionViewCell.swift
//  APICollectionView
//
//  Created by Pooja's MacBook Pro on 11/07/21.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var postId: UILabel?
    
    
    @IBOutlet weak var id: UILabel?
   
    @IBOutlet weak var name: UILabel?
   
    @IBOutlet weak var body: UILabel?
    @IBOutlet weak var email: UILabel?
   
    
    
   /* func setup (with person : Person){
        
        postId.text = person.postId
        id.text = person.id
        name.text = person.name
        body.text = person.body
        email.text = person.email
        
    }*/
}


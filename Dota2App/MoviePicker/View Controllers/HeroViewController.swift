//
//  HeroViewController.swift
//  MoviePicker
//
//  Created by Test on 11/05/2020.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class HeroViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var attributeLabel: UILabel!
    
    @IBOutlet weak var attackLabel: UILabel!
    
    @IBOutlet weak var healthLabel: UILabel!
    
    @IBOutlet weak var manaLabel: UILabel!
    
    @IBOutlet weak var maxAttackLabel: UILabel!
    
    var hero: HeroStats?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = "Hero name: " + hero!.localized_name
        
        switch hero!.primary_attr {
        case "agi":
            attributeLabel.text = "Attribute: Agility"
        case "str":
            attributeLabel.text = "Attribute: Strength"
        default:
            attributeLabel.text = "Attribute: Intelligence"
        }
        attackLabel.text = "Attack type: " + hero!.attack_type
        healthLabel.text = "Base health: " + "\((hero?.base_health)!)"
        manaLabel.text = "Base mana: " + "\((hero?.base_mana)!)"
        maxAttackLabel.text = "Maximum base attack: " + "\((hero?.base_attack_max)!)"
        
        let urlString = "https://api.opendota.com" + (hero?.img)!
        let url = URL(string: urlString)
        
        imageView.downloaded(from: url!)
        
        // Style
        Utilities.styleLabel(nameLabel)
        Utilities.styleLabel(attributeLabel)
        Utilities.styleLabel(attackLabel)
        Utilities.styleLabel(healthLabel)
        Utilities.styleLabel(manaLabel)
        Utilities.styleLabel(maxAttackLabel)
        
        view.backgroundColor = UIColor.darkGray
    }
    

}

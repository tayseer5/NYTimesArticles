//
//  MainScreen.swift
//  NYTimesArticles
//
//  Created by Tayseer Anwar on 12/30/21.
//

import UIKit

class MainScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getData(_ sender: Any) {
        NetworkManager().getMostPopularNYArticles(period: 1) { result in
            print(result)
        }
    }
    

}


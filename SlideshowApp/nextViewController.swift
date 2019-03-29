//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by 萩原祐太郎 on 2019/03/29.
//  Copyright © 2019 Yutaro_Hagiwara. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    var imageName = ""
    
    @IBOutlet weak var extendImage: UIImageView!
    
    @IBOutlet weak var backSegue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: imageName)
        extendImage.image = image

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

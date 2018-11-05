//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by 久保田慧 on 2018/11/05.
//  Copyright © 2018年 KeiKubota. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {
    
    @IBOutlet weak var ZoomImageSpace: UIImageView!
    var ReciveImage: String? = nil
    
    @IBOutlet weak var nameLabel: UILabel!
    var RecieveName: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画像を伸ばす
        ZoomImageSpace.contentMode = .scaleAspectFit
        //受け取った画像を表示
        ZoomImageSpace.image = UIImage(named: ReciveImage!)
        nameLabel.text = RecieveName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

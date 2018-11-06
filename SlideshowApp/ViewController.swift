//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 久保田慧 on 2018/11/05.
//  Copyright © 2018年 KeiKubota. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer?
    var timer_sec: Float = 0
    var counter:Int = 0
    let imagelist = ["ヒトカゲ","リザード","リザードン","メガリザードンX","メガリザードンY"]
    
    
    
    @IBOutlet weak var image_name: UILabel!
    //表示上の指示をするために定義
    @IBOutlet weak var nextbutton: UIButton!
    @IBOutlet weak var beforebutton: UIButton!
    @IBOutlet weak var startstopbutton: UIButton!
    
    @IBOutlet weak var ImageSpace: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //背景を黄色にする
        //self.view.backgroundColor = UIColor.yellow
        //画像を適切に引き伸ばす
        ImageSpace.contentMode = .scaleAspectFit
        //画像を表示させる
        ImageSpace.image = UIImage(named: imagelist[counter])
        image_name.text = imagelist[counter]
    }
    
    
    
    //次へボタンを押した時に次の画像に切り替わる
    @IBAction func tapNextbutton(_ sender: Any) {
        
        let max: Int = imagelist.count

        //counterがmaxより小さければcounterを+1
        if counter < max-1{
            counter += 1
            
        }else if counter == max-1{
            counter = 0
        }
        
        ImageSpace.image = UIImage(named: imagelist[counter])
        image_name.text = imagelist[counter]
    }
    
    
    
    
    @IBAction func tapbeforebutton(_ sender: Any) {
        let max: Int = imagelist.count
        //カウンターを-1して配列から画像を取り出す
        //カウンターが0未満にならないようにする。
        if counter >= 1{
            counter -= 1
        }else{//1以上以外の場合　つまり 0の場合は
            counter = max-1
        }
        ImageSpace.image = UIImage(named: imagelist[counter])
        image_name.text = imagelist[counter]
        
    }
    
    
    
    //自動送りが始まり、2秒毎にスライドする。自動送りの最中は進むボタンと戻るボタンは触れない
    //再生ボタンを押すと停止ボタンになり、停止ボタンを押すと再生ボタンになる
    //停止ボタンを押すと自動送りが止まり、進むボタンと止まるボタンがタップできる
    @IBAction func StartStopButton(_ sender: Any) {
        //進むボタンと戻るボタンを無効化&色を変える
        //再生⇄停止
        let curbutton = startstopbutton.currentTitle
        let start = "再生"
        if curbutton == start{
            startstopbutton.setTitle("停止", for: .normal)
            beforebutton.isEnabled = false
            nextbutton.isEnabled = false
            //タイマー始動
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }else{
            startstopbutton.setTitle("再生", for: .normal)
            beforebutton.isEnabled = true
            nextbutton.isEnabled = true
            self.timer?.invalidate()
            
        }
        
    }
    
    @objc func updateTimer(_ timer: Timer) {
        let max: Int = imagelist.count
        //counterがmax-1(配列の最後)より小さければcounterを+1
        if counter < max-1{
            counter += 1
        }else if counter == max-1{
            counter = 0
        }
        ImageSpace.image = UIImage(named: imagelist[counter])
        image_name.text = imagelist[counter]
        
        
    }
    
    
    @IBAction func onTapimage(_ sender: Any) {
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "zoom", sender: nil)        
    }
    
    //画面遷移の際に渡すもの
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let zoomviewcontroller:ZoomViewController = segue.destination as! ZoomViewController
        zoomviewcontroller.ReciveImage = imagelist[counter]
        zoomviewcontroller.RecieveName = image_name.text
        //「停止」のまま画像が動き動き続けることや、画面遷移から戻ってきた際に
        //画像が動いていないのに「停止」→「再生」ボタンを押し、再度再生させるのが不自然な為
        //画面遷移する際にタイマーを止め、「停止」ボタンから「再生」ボタンに
        self.timer?.invalidate()
        startstopbutton.setTitle("再生", for: .normal)
        beforebutton.isEnabled = true
        nextbutton.isEnabled = true
    }
    
    //遷移先の画面から戻ってきた時に呼ばれるメソッド
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
     

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


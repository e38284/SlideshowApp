//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 萩原祐太郎 on 2019/03/23.
//  Copyright © 2019 Yutaro_Hagiwara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var imageView: UIButton!
    
    /// 一定の間隔で処理を行うためのタイマー
    var timer: Timer?
    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    // 画像の名前の配列
    let imageNameArray = [
        "chocolate",
        "grape",
        "onion",
        ]
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        // 画像の番号が正常な範囲を指しているかチェック
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        // 画像を読み込み
        let image = UIImage(named: name)
        // ImageViewに読み込んだ画像をセット
        imageView.setImage(image, for: .normal)
    }
    
    /// Timerによって、一定の間隔で呼び出される関数
    @objc func onTimer(timer: Timer) {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
 
    
    @IBOutlet weak var nextImage: UIButton!
    @IBAction func nextImage(_ sender: Any) {
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        // 表示している画像の番号を元に画像を表示する
        displayImage()
    }
 
    @IBOutlet weak var backImage: UIButton!
    @IBAction func backImage(_ sender: Any) {
        //      表示している画像の番号を1減らす
        dispImageNo += 1
        //      表示している画像の番号を元に画像を表示する
        displayImage()
    }
    
    
    var tapcount = 0
    
    @IBAction func playStopImage(_ sender: Any) {
        // ボタンの表示切り替え
        tapcount += 1
        // タイマーを開始
        if tapcount % 2 != 0 {
            //再生ボタンをタップすると停止ボタンに
            (sender as AnyObject).setTitle("停止",for: .normal)
            ////自動送りが始まったら、進むボタンと戻るボタンをタップ不可に
            nextImage.isEnabled = false
            backImage.isEnabled = false
            // タイマーを設定
            timer = Timer.scheduledTimer(
                timeInterval:2.0,
                target: self,
                selector: #selector(ViewController.onTimer(timer:)),
                userInfo: nil,
                repeats: true)
        } else if tapcount % 2 == 0{
            //停止ボタンをタップすると再生ボタンに
            (sender as AnyObject).setTitle("再生",for: .normal)
            //自動送りが止まったら、進むボタンと戻るボタンをタップ可能に
            nextImage.isEnabled = true
            backImage.isEnabled = true
            // タイマーを停止する
            self.timer?.invalidate()
            self.timer = nil
        }
    }
    
    //遷移先から戻ってくる
    @IBAction func backSegue(_ segue: UIStoryboardSegue) {
    }
    
    //遷移先に現在の画像を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let nextViewController:NextViewController = segue.destination as! NextViewController
        nextViewController.imageName = imageNameArray[dispImageNo]
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        nextImage.titleLabel?.adjustsFontSizeToFitWidth = true
        
//        let image = UIImage(named: "chocolate")
//        imageView.image = image
        
        // Do any additional setup after loading the view, typically from a nib.
    }

}


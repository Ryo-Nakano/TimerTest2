//
//  ViewController.swift
//  TimerTest2
//
//  Created by Ryohei Nanano on 2018/04/20.
//  Copyright © 2018年 GeekSalon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var testDatePicker: UIDatePicker!
    
    var timer:Timer = Timer()
    var count:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startCountDown(_ sender: UIButton) {
        timer.invalidate()//既に動いているタイマーがあった場合は止める(破棄)
        count = Int(testDatePicker.countDownDuration)
        
        //1s毎にcountDown関数を呼ぶ！って事を指示してる！
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func setTimer(_ sender: UIDatePicker) {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
//
//        testLabel.text = formatter.string(from: sender.date)
        
    }
    
    //startCountDown内で繰り返し呼ぶ為の関数を定義している！
    @objc func countDown()
    {
        count -= 1//カウントを減らす
        
        //カウントダウン状況をラベルに表示
        if count > 0 {
            testLabel.text = "残り\(count)秒です。"
        }
        else{
            testLabel.text = "カウントダウン終了"
            timer.invalidate()//タイマー終了(タイマー破棄)
        }
    }
}


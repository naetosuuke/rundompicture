//
//  ViewController.swift
//  rundompicture
//
//  Created by Daisuke Doi on 2022/10/02.
//  This code is quoted from "たった2日でマスターできるiPhoneアプリ開発集中講座 Xcode 11　Swift 5対応 Kindle版" for my personal training. Not for distribution  https://www.amazon.co.jp/%E3%81%9F%E3%81%A3%E3%81%9F2%E6%97%A5%E3%81%A7%E3%83%9E%E3%82%B9%E3%82%BF%E3%83%BC%E3%81%A7%E3%81%8D%E3%82%8BiPhone%E3%82%A2%E3%83%97%E3%83%AA%E9%96%8B%E7%99%BA%E9%9B%86%E4%B8%AD%E8%AC%9B%E5%BA%A7-Xcode-11-Swift-5%E5%AF%BE%E5%BF%9C-%E8%97%A4%E6%B2%BB%E4%BB%81-ebook/dp/B081FG9J2V/ref=sr_1_3?keywords=%E3%81%9F%E3%81%A3%E3%81%9F2%E6%97%A5%E3%81%A7%E3%83%9E%E3%82%B9%E3%82%BF%E3%83%BC%E3%81%A7%E3%81%8D%E3%82%8Biphone%E3%82%A2%E3%83%97%E3%83%AA%E9%96%8B%E7%99%BA%E9%9B%86%E4%B8%AD%E8%AC%9B%E5%BA%A7&qid=1669637309&qu=eyJxc2MiOiIyLjYwIiwicXNhIjoiMi4xOCIsInFzcCI6IjIuMTIifQ%3D%3D&sprefix=%E3%81%9F%E3%81%A3%E3%81%9F2%E6%97%A5%2Caps%2C184&sr=8-3


//アプリが用意しているライブラリUIKit を呼び出している　下のうす紫の字で宣言しているものがライブラリのコマンド
import UIKit



//UIViewController 親クラス
class ViewController: UIViewController {

    //配列のかきかた、製品には関係なし（配列の宣言＋型指定）
    //var aiueoBox = [String]()
    
    
    
    //青が変数名　紫がクラス名（ライブラリとの紐付け）　コマンド押しながら紫をおしたらライブラリの仕様が見れる
 
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    var timer = Timer()

    var count = Int()
    //配列の宣言(クラス　UIImage)
    var imageArray = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //countの初期値を宣言
        count = 0
        
        //stopButtonを押せなくする
        //こい紫がプロパティ（powershellだとオプションと呼ばれていたもの）
        stopButton.isEnabled = true
        
        for i in 0..<5{
            
            print(i)
            
            //image の中にUIImageクラスの中身（asset内の画像）を代入
            let image = UIImage(named: "\(i)")
            //imageの画像を配列に代入する
            //"!"　は変数のうちにNilを許可しないといういみ
            imageArray.append(image!)
            
        }
        
        //最初の画像を表示
        imageView.image = UIImage(named: "0")
        
        
        
    }

    //timerのメソッド
    func startTimer(){
        
        //タイマーを回す　0.2秒ごとに表示
        timer =
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)

    }
    
    
     //0.2秒ごとに呼び出す
    @objc func  timerUpdate(){
        //countup
        count = count + 1
        
        //countが画像の枚数（4）を超える場合、0に戻す
        if count > 4 {
        
            count = 0
        }
        
        
        //countupしていく番号を配列の因数として代入する
        imageView.image = imageArray[count]
              
        
    }
    
    
    
    

    @IBAction func start(_ sender: Any) {
        
        
        //imageViewのimageに画像を反映していく
        
        //startButtonは押せなくする stopButtonを押せるようにする
        startButton.isEnabled = false
        stopButton.isEnabled = true
        //タイマー開始メソッドの呼び出し
        startTimer()
        
    }
        
           
    @IBAction func stop(_ sender: Any) {

    //imageViewのimageに反映されている画像の流れをストップする
        
        
        //startButtonを押せるようにする stopButtonを押せなくする
        startButton.isEnabled = true
        stopButton.isEnabled = false
        //変数timerを無効化（メソッド　startTimerでなく変数を無効化している）
        timer.invalidate()
        
        
    }
    
    
    

}


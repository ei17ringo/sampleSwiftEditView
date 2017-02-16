//
//  ViewController.swift
//  sampleEditView
//
//  Created by Eriko Ichinohe on 2017/02/14.
//  Copyright © 2017年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate,UITextViewDelegate {

    @IBOutlet weak var myTitle: UITextField!
    
    @IBOutlet weak var myDate: UITextField!
    
    @IBOutlet weak var myContents: UITextView!
    
    @IBOutlet weak var formView: UIView!
    
    
    //datePickerが乗るView（下に隠しておく)
    let baseView:UIView = UIView(frame: CGRect(x: 0, y: 720, width: 200, height: 250))
    
    let diaryDatePicker:UIDatePicker = UIDatePicker(frame: CGRect(x: 10, y: 20, width: 300, height: 220))
    
    let mySystemButton:UIButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // イベントの追加
        diaryDatePicker.addTarget(self, action: #selector(showDateSelected(sender:)), for: .valueChanged)
        
        //baseViewにdatePickerを配置
        baseView.addSubview(diaryDatePicker)
        
        //baseViewにボタンを配置
        // Systemボタンに配置するx,y座標とサイズを設定.
        mySystemButton.frame = CGRect(x: self.view.frame.width-60, y: 0, width: 50, height: 20)
        
        // Systemボタンにタイトルを設定する.
        mySystemButton.setTitle("Close", for: .normal)
        
        // イベントの追加
        mySystemButton.addTarget(self, action: #selector(closeDatePickerView(sender:)), for: .touchUpInside)
        
        //baseViewにボタンを配置
        baseView.addSubview(mySystemButton)

        
        //下にピッタリ配置、横幅ピッタリの大きさにしておく
        baseView.frame.origin = CGPoint(x: 0, y: self.view.frame.size.height)
        
        baseView.frame.size = CGSize(width: self.view.frame.width, height: baseView.frame.height)
        
        
        baseView.backgroundColor = UIColor.gray
        self.view.addSubview(baseView)

        
    }
    
    //入力開始
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing\n")
        
        print(textField.tag)
        
        //キーボードが出てたら閉じる
        myTitle.resignFirstResponder()
        myContents.resignFirstResponder()
        
        //日付のViewも一旦閉じる
        hideBaseView()
        
        switch textField.tag {
        case 1:
            //タイトル
            return true
        case 2:
            
            //日付
            //withDuration:アニメーションが行われる間隔（秒）
            //animations:変化後の状態
            //completion:アニメーション後に行われる処理
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
                
                self.baseView.frame.origin = CGPoint(x: 0, y:self.view.frame.size.height - self.baseView.frame.height)
                
                
                
            }, completion: {finished in print("上に現れました")})
            
            return false
        default:
            return true
        }
        
    }

    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        print("textViewShouldBeginEditing\n")
        
        print(textView.tag)
        
        //キーボードが出てたら閉じる
        myTitle.resignFirstResponder()
        myContents.resignFirstResponder()
        
        //日付のViewも一旦閉じる
        hideBaseView()

        
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            
            self.formView.frame.origin = CGPoint(x: 5, y:self.formView.frame.origin.y - 250)
            
            
            
        }, completion: {finished in print("上に現れました")})
        return true
    }
    
    @IBAction func tapClose(_ sender: UIButton) {
        //formViewを元に戻す
        myContents.resignFirstResponder()
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            
            self.formView.frame.origin = CGPoint(x: 5, y:self.formView.frame.origin.y + 250)
            
            
            
        }, completion: {finished in print("上に現れました")})
    }
    
    //baseViewを隠す
    func hideBaseView(){
       self.baseView.frame.origin = CGPoint(x: 0, y:self.view.frame.size.height)
    }
    
    @IBAction func tapTitleReturn(_ sender: UITextField) {
    }
    
    
    //DatePickerが載っているViewを閉じる
    func closeDatePickerView(sender: UIButton){
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            
            self.baseView.frame.origin = CGPoint(x: 0, y:self.view.frame.size.height)
            
            
            
        }, completion: {finished in print("下に隠れました")})
    }
    
    //DatePickerで、選択している日付を変えた時、日付用のTextFieldに値を表示
    func showDateSelected(sender:UIDatePicker){
    
        // フォーマットを設定
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd"
        
        print(df.string(from: sender.date))
        
        let strSelectedDate = df.string(from: sender.date)
        
        myDate.text = strSelectedDate

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


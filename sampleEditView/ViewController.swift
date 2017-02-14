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
    
    //datePickerが乗るView（下に隠しておく)
    let baseView:UIView = UIView(frame: CGRect(x: 0, y: 720, width: 200, height: 250))
    
    let diaryDatePicker:UIDatePicker = UIDatePicker(frame: CGRect(x: 10, y: 20, width: 300, height: 220))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //baseViewにdatePickerを配置
        baseView.addSubview(diaryDatePicker)
        
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
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


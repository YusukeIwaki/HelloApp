//
//  ViewController.swift
//  HelloApp
//
//  Created by yusuke-iwaki on 2016/12/31.
//  Copyright © 2016年 YusukeIwaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var dateEditor: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textFieldEditStart(_ sender: UITextField) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.time
        datePicker.addTarget(self, action: #selector(ViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
        sender.inputView = datePicker
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        dateEditor.text = dateFormatter.string(from: sender.date)
        
        let calendar = Calendar(identifier: .gregorian)
        let hour = calendar.component(.hour, from: sender.date)
        
        switch hour {
        case 2..<10:
            helloLabel.text = "おはよう"
        case 10..<18:
            helloLabel.text = "こんにちは"
        default:
            helloLabel.text = "こんばんは"
        }
    }
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}


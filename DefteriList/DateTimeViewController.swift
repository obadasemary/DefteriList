//
//  DateTimeViewController.swift
//  DefteriList
//
//  Created by Abdelrahman Mohamed on 12/30/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class DateTimeViewController: UIViewController {

    @IBOutlet weak var picker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerDidChange(picker)
    }
    
    @IBAction func pickerDidChange(_ sender: Any) {
        
        let date: Date = picker.date
        let formatter: DateFormatter = DateFormatter()
        
        formatter.dateFormat = "EEEE"
        let dayOfWeek: String = formatter.string(from: date)
        
        label.text = "The Day is a \(dayOfWeek)"
    }
}

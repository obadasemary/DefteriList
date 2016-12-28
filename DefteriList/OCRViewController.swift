//
//  OCRViewController.swift
//  DefteriList
//
//  Created by Abdelrahman Mohamed on 12/26/16.
//  Copyright © 2016 Abdelrahman Mohamed. All rights reserved.
//

import UIKit
import TesseractOCR

class OCRViewController: UIViewController, G8TesseractDelegate {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.hidesWhenStopped = true
        spinner.center = view.center
        view.addSubview(spinner)
        spinner.startAnimating()
        
        loadImage(imageName: "Cover")
    }
    
    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print("Easy Text Recognition with Tesseract OCR")
        print("Recognition Progress \(tesseract.progress) %")
    }
    
    func loadImage(imageName: String) {
        
        if let tesseract = G8Tesseract(language: "eng") {
            
            tesseract.delegate = self
            tesseract.image = UIImage(named: imageName)?.g8_blackAndWhite()
            tesseract.recognize()
            
            textView.text = tesseract.recognizedText
            
            spinner.stopAnimating()
        }
    }
    
    @IBAction func ChangeImage(_ sender: Any) {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            
            loadImage(imageName: "Cover")
        }
        
        if segmentedControl.selectedSegmentIndex == 1 {
            
            loadImage(imageName: "Love")
        }
        
        if segmentedControl.selectedSegmentIndex == 2 {
            
            loadImage(imageName: "Plan")
        }
    }
}

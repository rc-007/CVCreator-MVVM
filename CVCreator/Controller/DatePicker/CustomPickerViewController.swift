//
//  CustomPickerViewController.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 08/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import UIKit

// Create Protocol to pass data back using delegate
@objc protocol PickerProtocol: class {
    @objc optional func selectedPickerItem(displayText: String,ItemIndex:Int)
    @objc optional func selectedDate(selectedDate:Date, index: Int)
}

class CustomPickerViewController: UIViewController {
    
    enum Mode {
        case Date
        case DateAndTime
    }
    
    /// Outlets
    @IBOutlet weak var tappingView: UIView!
    @IBOutlet weak var pickerViewOptions: UIPickerView!
    @IBOutlet weak var datePickerView: UIDatePicker!
    
    /// Properties
    var pickerDelegate: PickerProtocol?
    var arrPickerOptions = [String]()
    var selectedIndex = -1
    var selectedDate:Date?
    var minDate:Date?
    var maxDate:Date?
    var minInterval:Int?
    var isDatePicker:Bool = false
    var pickerMode = Mode.DateAndTime
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tappingView.backgroundColor = UIColor.clear
        view.isOpaque = false
        self.setInputViewAsPicker()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Custom Methods
    // To set picker view according to the selection
    func setInputViewAsPicker()
    {
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(tapBlurButton))
        tappingView.addGestureRecognizer(tapGesture)
        if isDatePicker == true
        {
            self.setupDatePicker()
        }
        else
        {
            self.datePickerView.isHidden = true
            self.pickerViewOptions.reloadAllComponents()
            if selectedIndex >= 0{
                self.pickerViewOptions.selectRow(selectedIndex, inComponent: 0, animated: true)
            }
        }
    }
    
    // To set date picker
    func setupDatePicker()
    {
        if let selctedDate = self.selectedDate{
            datePickerView.date = selctedDate
        }
        if let minDate = self.minDate{
            datePickerView.minimumDate = minDate
        }
        if let maxDate = self.maxDate{
            datePickerView.maximumDate = maxDate
        }
        if let minInterval = self.minInterval {
            datePickerView.minuteInterval = minInterval
        }
        if pickerMode == .Date{
            datePickerView.datePickerMode = .date
        }
        self.view.bringSubviewToFront(self.datePickerView)
        self.pickerViewOptions.isHidden = true
    }
    
    // MARK: - Action Methods
    // To dismiss current view on tapping of blur view
    @objc func tapBlurButton(sender: UITapGestureRecognizer)
    {
        if sender.numberOfTouches>0 {
            self.dismiss(animated: true) {
            }
        }
    }
    
    // Method to pass data back of selected picker on tapping of done button
    @IBAction func doneButtonTapped(_ sender: Any)
    {
        if isDatePicker == true
        {
            self.pickerDelegate?.selectedDate?(selectedDate: datePickerView.date, index: selectedIndex)
        }
        else
        {
            self.pickerDelegate?.selectedPickerItem?(displayText: self.arrPickerOptions[pickerViewOptions.selectedRow(inComponent: 0)], ItemIndex: pickerViewOptions.selectedRow(inComponent: 0))
            
        }
        dismisView()
    }
    
    // method to dismiss current view on tapping of cancel button
    @IBAction func cancelButtontapped(_ sender: Any)
    {
        dismisView()
    }
    
    // To dismiss current view
    func dismisView() {
        self.dismiss(animated: true) {
            
        }
    }
    
}

// MARK: - UIPickerView DataSource and Delegate methods
extension CustomPickerViewController:UIPickerViewDelegate,UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return arrPickerOptions.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return arrPickerOptions[row]
    }
}

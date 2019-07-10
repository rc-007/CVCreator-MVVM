//
//  DateExtensions.swift
//  CVCreator
//
//  Created by Rahul Chouhan on 08/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//

import Foundation


public extension Date {
	
	/// SwifterSwift: Day name format.
	///
	/// - threeLetters: 3 letter day abbreviation of day name.
	/// - oneLetter: 1 letter day abbreviation of day name.
	/// - full: Full day name.
	public enum DayNameStyle {
		case threeLetters
		case oneLetter
		case full
	}
	
	/// SwifterSwift: Month name format.
	///
	/// - threeLetters: 3 letter month abbreviation of month name.
	/// - oneLetter: 1 letter month abbreviation of month name.
	/// - full: Full month name.
	public enum MonthNameStyle {
		case threeLetters
		case oneLetter
		case full
	}
	
}


// MARK: - Properties
public extension Date {
   
    var currentTime : String{
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: Date())
    }
    
    var convertToTime : String{
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: self)
    }
    
    var currentDateInChat: String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: Date())
    }
    
    //"15:00 - 16:00 PM on 3-10-2018"
    
    var set1900Date : Date{
        var comp = DateComponents()
        comp.day = 01
        comp.month = 01
        comp.year = 1900
        return Calendar.current.date(from: comp)!
    }

    func stringDateMMMDDYYYY(_ date: Date) -> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        
        let dateString = formatter.string(from: date)
        return dateString
    }
    
    func dateOfBirth(_ date: Date) -> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        
        let dateString = formatter.string(from: date)
        return dateString
    }
    
}

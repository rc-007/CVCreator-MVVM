//
//  StringExtensions.swift
//  CVCreater
//
//  Created by Rahul Chouhan on 06/07/19.
//  Copyright © 2019 Infosys. All rights reserved.
//


import Foundation


#if os(macOS)
import Cocoa
#else
import UIKit
#endif

// MARK: - Properties
  extension String {
	
    func indices(of occurrence: String) -> [Int] {
        var indices = [Int]()
        var position = startIndex
        while let range = range(of: occurrence, range: position..<endIndex) {
            let i = distance(from: startIndex,
                             to: range.lowerBound)
            indices.append(i)
            let offset = occurrence.distance(from: occurrence.startIndex,
                                             to: occurrence.endIndex) - 1
            guard let after = index(range.lowerBound,
                                    offsetBy: offset,
                                    limitedBy: endIndex) else {
                                        break
            }
            position = index(after: after)
        }
        return indices
    }
    
    ///   Array of self of a string.
    var charactersArray: [Character] {
        return Array(self)
    }
    
    /// Verify if string matches the regex pattern.
    ///
    /// - Parameter pattern: Pattern to verify.
    /// - Returns: true if string matches the pattern.
    func matches(pattern: String) -> Bool {
        return range(of: pattern,
                     options: String.CompareOptions.regularExpression,
                     range: nil, locale: nil) != nil
    }
    
    func ranges(of searchString: String) -> [Range<String.Index>] {
        
        let _indices = indices(of: searchString)
        let count = searchString.charactersArray.count
        return _indices.map({ index(startIndex, offsetBy: $0)..<index(startIndex, offsetBy: $0+count) })
    }
	///   First character of string (if applicable).
    var firstCharacter: String? {
		guard let first = self.first else {
			return nil
		}
		return String(first)
	}
	
	///   Check if string contains one or more letters.
    var hasLetters: Bool {
		return rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
	}
	
	///   Check if string contains one or more numbers.
    var hasNumbers: Bool {
		return rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
	}
    
    var hasOnlyNUmber: Bool{
    let ACCEPTABLE_CHARACTERS = "0123456789"
        let cs = NSCharacterSet(charactersIn: ACCEPTABLE_CHARACTERS).inverted
        let filtered = self.components(separatedBy: cs).joined(separator: "")
        return self == filtered ? true : false
    }

	///   Check if string contains only letters.
    var isAlphabetic: Bool {
		return hasLetters && !hasNumbers
	}
	
	///   Check if string contains at least one letter and one number.
    var isAlphaNumeric: Bool {
		return components(separatedBy: CharacterSet.alphanumerics).joined(separator: "").self.count == 0 && hasLetters && hasNumbers
	}
	
	///   Check if string is valid email format.
    var isEmail: Bool {
		// http://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
		return matches(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
	}
	
	///   Check if string is a valid URL.
    var isValidUrl: Bool {
		return URL(string: self) != nil
	}
	
	///   Check if string is a valid schemed URL.
    var isValidSchemedUrl: Bool {
		guard let url = URL(string: self) else {
			return false
		}
		return url.scheme != nil
	}
	
	///   Check if string is a valid https URL.
    var isValidHttpsUrl: Bool {
		guard let url = URL(string: self) else {
			return false
		}
		return url.scheme == "https"
	}
	
	///   Check if string is a valid http URL.
    var isValidHttpUrl: Bool {
		guard let url = URL(string: self) else {
			return false
		}
		return url.scheme == "http"
	}
	
	///   Check if string contains only numbers.
    var isNumeric: Bool {
		return  !hasLetters && hasNumbers
	}
	
	
	///   Number of characters in string.
    var length: Int {
		return self.count
	}
    
	///   Reversed string.
    var reversed: String {
		return String(self.reversed())
	}
	
	///   Bool value from string (if applicable).
    var bool: Bool? {
		let selfLowercased = trimmed.lowercased()
		if selfLowercased == "true" || selfLowercased == "1" {
			return true
		} else if selfLowercased == "false" || selfLowercased == "0" {
			return false
		}
		return nil
	}
	
	///   Date object from "yyyy-MM-dd" formatted string
    var date: Date? {
		let selfLowercased = trimmed.lowercased()
		let formatter = DateFormatter()
		formatter.timeZone = TimeZone.current
		formatter.dateFormat = "yyyy-MM-dd"
		return formatter.date(from: selfLowercased)
	}
	
	///   Date object from "yyyy-MM-dd HH:mm:ss" formatted string.
    var dateTime: Date? {
		let selfLowercased = trimmed.lowercased()
		let formatter = DateFormatter()
		formatter.timeZone = TimeZone.current
		formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
		return formatter.date(from: selfLowercased)
	}
	
	///   Double value from string (if applicable).
    var double: Double? {
		let formatter = NumberFormatter()
		return formatter.number(from: self) as? Double
	}
	
	///   Float value from string (if applicable).
    var float: Float? {
		let formatter = NumberFormatter()
		return formatter.number(from: self) as? Float
	}
	
	///   Float32 value from string (if applicable).
    var float32: Float32? {
		let formatter = NumberFormatter()
		return formatter.number(from: self) as? Float32
	}
	
	///   Float64 value from string (if applicable).
    var float64: Float64? {
		let formatter = NumberFormatter()
		return formatter.number(from: self) as? Float64
	}
	
	///   Integer value from string (if applicable).
    var int: Int? {
		return Int(self)
	}
	
	///   Int16 value from string (if applicable).
    var int16: Int16? {
		return Int16(self)
	}
	
	///   Int32 value from string (if applicable).
    var int32: Int32? {
		return Int32(self)
	}
	
	///   Int64 value from string (if applicable).
	  var int64: Int64? {
		return Int64(self)
	}
	
	///   Int8 value from string (if applicable).
    var int8: Int8? {
		return Int8(self)
	}
	
	///   URL from string (if applicable).
    var url: URL? {
		return URL(string: self)
	}
	
	///   String with no spaces or new lines in beginning and end.
    var trimmed: String {
		return trimmingCharacters(in: .whitespacesAndNewlines)
	}
    var stringByRemovingWhitespaces: String {
        let component = components(separatedBy: .whitespaces)
        return component.joined(separator: "")
    }
	///   Array with unicodes for all characters in a string.
    var unicodeArray: [Int] {
		return unicodeScalars.map({$0.hashValue})
	}
	
    var urlDecoded: String {
		return removingPercentEncoding ?? self
	}
	
    var urlEncoded: String {
		return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
	}
	
    var withoutSpacesAndNewLines: String {
		return replacing(" ", with: "").replacing("\n", with: "")
	}
	
}


// MARK: - Methods
extension String {
  
	  subscript(i: Int) -> String? {
		guard i >= 0 && i < self.count else {
			return nil
		}
		return String(self[index(startIndex, offsetBy: i)])
	}
	
	  subscript(range: CountableRange<Int>) -> String? {
		guard let lowerIndex = index(startIndex, offsetBy: max(0,range.lowerBound), limitedBy: endIndex) else {
			return nil
		}
		guard let upperIndex = index(lowerIndex, offsetBy: range.upperBound - range.lowerBound, limitedBy: endIndex) else {
			return nil
		}
        return String(self[lowerIndex..<upperIndex])
	}
	
	  subscript(range: ClosedRange<Int>) -> String? {
		guard let lowerIndex = index(startIndex, offsetBy: max(0,range.lowerBound), limitedBy: endIndex) else {
			return nil
		}
		guard let upperIndex = index(lowerIndex, offsetBy: range.upperBound - range.lowerBound + 1, limitedBy: endIndex) else {
			return nil
		}
        return String(self[lowerIndex..<upperIndex])
	}
	
	#if os(iOS) || os(macOS)
	///   Copy string to global pasteboard.
	  func copyToPasteboard() {
		#if os(iOS)
			UIPasteboard.general.string = self
		#elseif os(macOS)
			NSPasteboard.general().clearContents()
			NSPasteboard.general().setString(self, forType: NSPasteboardTypeString)
		#endif
	}
	#endif
	
	
	///   Check if string contains one or more instance of substring.
	///
	/// - Parameters:
	///   - string: substring to search for.
	///   - caseSensitive: set true for case sensitive search (default is true).
	/// - Returns: true if string contains one or more instance of substring.
	  func contains(_ string: String, caseSensitive: Bool = true) -> Bool {
		if !caseSensitive {
			return range(of: string, options: .caseInsensitive) != nil
		}
		return range(of: string) != nil
	}
	
	///   Count of substring in string.
	///
	/// - Parameters:
	///   - string: substring to search for.
	///   - caseSensitive: set true for case sensitive search (default is true).
	/// - Returns: count of appearance of substring in string.
	  func count(of string: String, caseSensitive: Bool = true) -> Int {
		if !caseSensitive {
			return lowercased().components(separatedBy: string.lowercased()).count - 1
		}
		return components(separatedBy: string).count - 1
	}
	
	///   Check if string ends with substring.
	///
	/// - Parameters:
	///   - suffix: substring to search if string ends with.
	///   - caseSensitive: set true for case sensitive search (default is true).
	/// - Returns: true if string ends with substring.
	  func ends(with suffix: String, caseSensitive: Bool = true) -> Bool {
		if !caseSensitive {
			return lowercased().hasSuffix(suffix.lowercased())
		}
		return hasSuffix(suffix)
	}
	
	///   First index of substring in string.
	///
	/// - Parameter string: substring to search for.
	/// - Returns: first index of substring in string (if applicable).
	  func firstIndex(of string: String) -> Int? {
        return Array(self).map({String($0)}).firstIndex(of: string)
	}
	
	
	  func replacing(_ substring: String, with newString: String) -> String {
		return replacingOccurrences(of: substring, with: newString)
	}
	
	///   Reverse string.
	  mutating func reverse() {
		self = String(self.reversed())
	}
	
	///   Sliced string from a start index with length.
	///
	/// - Parameters:
	///   - i: string index the slicing should start from.
	///   - length: amount of self to be sliced after given index.
	/// - Returns: sliced substring of length number of self (if applicable) (example: "Hello World".slicing(from: 6, length: 5) -> "World")
	  func slicing(from i: Int, length: Int) -> String? {
		guard length >= 0, i >= 0, i < self.count  else {
			return nil
		}
		guard i.advanced(by: length) <= self.count else {
			return slicing(at: i)
		}
		guard length > 0 else {
			return ""
		}
		return self[i..<i.advanced(by: length)]
	}
	
	///   Slice given string from a start index with length (if applicable).
	///
	/// - Parameters:
	///   - i: string index the slicing should start from.
	///   - length: amount of self to be sliced after given index.
	  mutating func slice(from i: Int, length: Int) {
		if let str = slicing(from: i, length: length) {
			self = str
		}
	}
	
	///   Sliced string from a start index to an end index.
	///
	/// - Parameters:
	///   - start: string index the slicing should start from.
	///   - end: string index the slicing should end at.
	/// - Returns: sliced substring starting from start index, and ends at end index (if applicable) (example: "Hello World".slicing(from: 6, to: 11) -> "World")
	  func slicing(from start: Int, to end: Int) -> String? {
		guard end >= start else {
			return nil
		}
		return self[start..<end]
	}
	
	///   Slice given string from a start index to an end index (if applicable).
	///
	/// - Parameters:
	///   - start: string index the slicing should start from.
	///   - end: string index the slicing should end at.
	  mutating func slice(from start: Int, to end: Int) {
		if let str = slicing(from: start, to: end) {
			self = str
		}
	}
	
	///   Sliced string from a start index.
	///
	/// - Parameter i: string index the slicing should start from.
	/// - Returns: sliced substring starting from start index (if applicable) (example: "Hello world".slicing(at: 6) -> "world")
	  func slicing(at i: Int) -> String? {
		guard i < self.count else {
			return nil
		}
		return self[i..<self.count]
	}
	
	///   Slice given string from a start index (if applicable).
	///
	/// - Parameter i: string index the slicing should start from.
	  mutating func slice(at i: Int) {
		if let str = slicing(at: i) {
			self = str
		}
	}
	
	///   Array of strings separated by given string.
	///
	/// - Parameter separator: separator to split string by.
	/// - Returns: array of strings separated by given string.
	  func splitted(by separator: Character) -> [String] {
		return self.split{$0 == separator}.map(String.init)
	}
	
	///   Check if string starts with substring.
	///
	/// - Parameters:
	///   - suffix: substring to search if string starts with.
	///   - caseSensitive: set true for case sensitive search (default is true).
	/// - Returns: true if string starts with substring.

	  func starts(with prefix: String, caseSensitive: Bool = true) -> Bool {
		if !caseSensitive {
			return lowercased().hasPrefix(prefix.lowercased())
		}
		return hasPrefix(prefix)
	}
	
	///   Date object from string of date format.
	///
	/// - Parameter format: date format.
	/// - Returns: Date object from string (if applicable).
	  func date(withFormat format: String) -> Date? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = format
		return dateFormatter.date(from: self)
	}
	
	///   Removes spaces and new lines in beginning and end of string.
    mutating func trim() {
        self = trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
	}
    
    func trimCharacter(maxLimit:Int) -> String{
        if (self.length > maxLimit){
            return String(self.prefix(500))
        }
        return self
    }
}


// MARK: - Operators
  extension String {
	
	///   Repeat string multiple times.
	///
	/// - Parameters:
	///   - lhs: string to repeat.
	///   - rhs: number of times to repeat character.
	/// - Returns: new string with given string repeated n times.
	  static func * (lhs: String, rhs: Int) -> String {
		guard rhs > 0 else {
			return ""
		}
		return String(repeating: lhs, count: rhs)
	}
	
	///   Repeat string multiple times.
	///
	/// - Parameters:
	///   - lhs: number of times to repeat character.
	///   - rhs: string to repeat.
	/// - Returns: new string with given string repeated n times.
	  static func * (lhs: Int, rhs: String) -> String {
		guard lhs > 0 else {
			return ""
		}
		return String(repeating: rhs, count: lhs)
	}
	
    
    
}


// MARK: - NSAttributedString extensions



//MARK: - NSString extensions
extension String {
    
	///   NSString from a string.
	  var nsString: NSString {
		return NSString(string: self)
	}
	
	///   NSString lastPathComponent.
	  var lastPathComponent: String {
		return (self as NSString).lastPathComponent
	}
	
	///   NSString pathExtension.
	  var pathExtension: String {
		return (self as NSString).pathExtension
	}
	
	///   NSString deletingLastPathComponent.
	  var deletingLastPathComponent: String {
		return (self as NSString).deletingLastPathComponent
	}
	
	///   NSString deletingPathExtension.
	  var deletingPathExtension: String {
		return (self as NSString).deletingPathExtension
	}
	
	///   NSString pathComponents.
	  var pathComponents: [String] {
		return (self as NSString).pathComponents
	}
	
	///   NSString appendingPathComponent(str: String)
	///
	/// - Parameter str: the path component to append to the receiver.
	/// - Returns: a new string made by appending aString to the receiver, preceded if necessary by a path separator.
	  func appendingPathComponent(_ str: String) -> String {
		return (self as NSString).appendingPathComponent(str)
	}
	
	///   NSString appendingPathExtension(str: String)
	///
	/// - Parameter str: The extension to append to the receiver.
	/// - Returns: a new string made by appending to the receiver an extension separator followed by ext (if applicable).
	  func appendingPathExtension(_ str: String) -> String? {
		return (self as NSString).appendingPathExtension(str)
	}
    
    //MARK: - Skeleton Extensions
	
      static func isNilOrEmpty(string: String?) -> Bool {
        
        switch string?.trimmed {
        case .some(let nonNilString):
            return nonNilString.isEmpty
        default:
            return true
        }
    }
    
    var convertToDictionary : [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}

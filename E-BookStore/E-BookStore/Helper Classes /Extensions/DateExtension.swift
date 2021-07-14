//
//  DateExtension.swift
//  Quick Fill
//
//  Created by Muhammad  Naveed on 11/08/2020.
//  Copyright © 2020 Technerds. All rights reserved.
//

import Foundation

//Wednesday, Sep 12, 2018           --> EEEE, MMM d, yyyy
//09/12/2018                        --> MM/dd/yyyy
//09-12-2018 14:11                  --> MM-dd-yyyy HH:mm
//Sep 12, 2:11 PM                   --> MMM d, h:mm a
//September 2018                    --> MMMM yyyy
//Sep 12, 2018                      --> MMM d, yyyy
//Wed, 12 Sep 2018 14:11:54 +0000   --> E, d MMM yyyy HH:mm:ss Z
//2018-09-12T14:11:54+0000          --> yyyy-MM-dd'T'HH:mm:ssZ
//12.09.18                          --> dd.MM.yy
//10:41:02.112                      --> HH:mm:ss.SSS



extension Date {
    
//    func formattedDate(dateStr: String) -> String? {
//        let apiFormat = "yyyy-MM-dd'T'HH:mm:ss.sssssssZ"
//        let appFormat = "MMM dd,yyyy"
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = apiFormat
//        dateFormatter.calendar = Calendar.current
//        dateFormatter.timeZone = TimeZone.current
//
//        if let date = dateFormatter.date(from: dateStr) {
//            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
//            dateFormatter.dateFormat = appFormat
//
//            return dateFormatter.string(from: date)
//        }
//        return nil
//    }
    
}

extension Date {
    static var past1990 : Date {
        let string = " 01 January 1990 05:001:55 +0200"
            // Create Date Formatter
            let dateFormatter = DateFormatter()
            // Set Date Format
            dateFormatter.dateFormat = "dd MMM yyyy HH:mm:ss Z"
            // Convert String to Date
            return dateFormatter.date(from: string) ?? Date()
    }
    
    static func pastYear(_ pastYear: String) -> Date {
        let string = " 01 January \(pastYear) 05:001:55 +0200"
            // Create Date Formatter
            let dateFormatter = DateFormatter()
            // Set Date Format
            dateFormatter.dateFormat = "dd MMM yyyy HH:mm:ss Z"
            // Convert String to Date
            return dateFormatter.date(from: string) ?? Date()
    }
}



//MARK:- NV Date Picker
extension Date {
    
    func toString(_ formatType: String.AppDateFormat = .monthDateYear) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatType.rawValue
        
        return dateFormatter.string(from: self)
    }
    
    func dateByAddingYears(_ dYears: Int) -> Date {
        
        var dateComponents = DateComponents()
        dateComponents.year = dYears
        
        return Calendar.current.date(byAdding: dateComponents, to: self)!
    }
}



extension Date {
    func getNextMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: 1, to: self)
    }

    func getPreviousYear(_ value: Int  ) -> Date? {
        return Calendar.current.date(byAdding: .year, value: value, to: self)
    }
    
    
    static func getCurrentYearToPreviousYears(_ minimumYearValue: Int) -> [String] {
      
        let currentYear = Calendar.current.component(.year, from: Date())
        let minimumYear = Date().getPreviousYear(-minimumYearValue)
        let minimumYearFormatted = Calendar.current.component(.year, from: minimumYear!)
        
        let result = (minimumYearFormatted...currentYear).compactMap({ value in
            DateComponents(calendar: Calendar.current, year: value).year
            })
        return result.reversed().compactMap({String($0)})
    }
}



extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
// usage exmpale

//let date = Date()
//
//// MARK: Way 1
//
//let components = date.get(.day, .month, .year)
//if let day = components.day, let month = components.month, let year = components.year {
//    print("day: \(day), month: \(month), year: \(year)")
//}
//
//// MARK: Way 2
//
//print("day: \(date.get(.day)), month: \(date.get(.month)), year: \(date.get(.year))")


extension String {
    
    enum AppDateFormat: String {
        case year = "yyyy"
        case month = "MMMM"
        case date = "dd"
        case monthDateYear = "MMM dd, yyyy"
        case time = "h:mm a"
        case monthDateYearTime = "MMM d, h:mm a"
    }
    
    enum APIDateFormat: String {
        case dateTtimeMilliSeconds = "yyyy-MM-dd'T'HH:mm:ss.sssssssZ"
        case monthDateYear = "MMM dd, yyyy"
    }


    
    func formattedDateBy(_ newFormat: AppDateFormat, apiFormat: APIDateFormat = .dateTtimeMilliSeconds) -> String? {
        let apiFormat = apiFormat
        let appFormat = newFormat.rawValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = apiFormat.rawValue
        dateFormatter.calendar = Calendar.current
        dateFormatter.timeZone = TimeZone.current
        
        if let date = dateFormatter.date(from: self) {
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = appFormat
             //dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
    func converToDate(apiFormat: APIDateFormat) -> Date? {
        let apiFormat = apiFormat.rawValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = apiFormat
        dateFormatter.calendar = Calendar.current
        dateFormatter.timeZone = TimeZone.current
       
        return dateFormatter.date(from: self)
    }
}

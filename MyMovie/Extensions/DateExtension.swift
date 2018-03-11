//
//  DateExtension.swift
//  MyMovie
//
//  Created by Sidney Silva on 11/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

extension Date {
    func getFormattedDate(stringDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date: Date = dateFormatter.date(from: stringDate)!
        return dateFormatter.string(from: date)
    }
}

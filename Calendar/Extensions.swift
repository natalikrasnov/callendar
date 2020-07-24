//
//  Extension.swift
//  Calendar
//
//  Created by hyperactive on 22/04/2020.
//  Copyright © 2020 natali. All rights reserved.
//

import Foundation

extension Date {
	var month: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "LLLL"
		return dateFormatter.string(from: self)
	}

	func getMonthName(monthNum: Int)-> String{
		let fmt = DateFormatter()
		fmt.dateFormat = "LLLL"
		return String(fmt.monthSymbols[monthNum - 1].prefix(3))
	}

	func monthAsString() -> String {
		let df = DateFormatter()
		df.setLocalizedDateFormatFromTemplate("MMM")
		return df.string(from: self)
	}

	var year: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "YYYY"
		return dateFormatter.string(from: self)
	}

	var day: String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd"
		return dateFormatter.string(from: self)
	}
}

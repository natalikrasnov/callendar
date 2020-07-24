//
//  DayCollectionViewCell.swift
//  Calendar
//
//  Created by hyperactive on 22/04/2020.
//  Copyright © 2020 natali. All rights reserved.
//

import UIKit

class DayCollectionViewCell : UICollectionViewCell{

	var year:Int?
	var month:Int?

	@IBOutlet weak var titleLable: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		titleLable.text = Date().day
	}
}

//
//  YearTableViewControllerCell.swift
//  Calendar
//
//  Created by hyperactive on 22/04/2020.
//  Copyright © 2020 natali. All rights reserved.
//

import UIKit

class YearTableViewCell: UITableViewCell,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

	let months:[Int] = (1...12).map{$0}
	var date:Date = Date()
	var today = false
	var year: Int?{
		didSet{
			if title == nil {return}
			title.text = "\(String(describing: year! ))"
			
		}
	}
	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var colectionView: UICollectionView!

	override func awakeFromNib() {
		super.awakeFromNib()

		colectionView.delegate = self
		colectionView.dataSource = self
		let cellNib = UINib(nibName: "CollectionViewCell", bundle: nil)
		colectionView.register(cellNib, forCellWithReuseIdentifier: "CollectionViewCell")
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 12
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = colectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! MonthTableViewCell
		cell.title.text = Date().getMonthName(monthNum: months[indexPath.row])
		if today && Date().getMonthName(monthNum: months[indexPath.row]) == String(Date().month.prefix(3)){
			cell.title.textColor = UIColor.red
			cell.today = true 
		}
		return cell
	}



	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let noOfCellsInRow = 3
		let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
		let totalSpace = flowLayout.sectionInset.left
			+ flowLayout.sectionInset.right
			+ (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow ))
		let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
		return CGSize(width: size, height: size)
}
}

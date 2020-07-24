//
//  TableViewCell.swift
//  Calendar
//
//  Created by hyperactive on 22/04/2020.
//  Copyright © 2020 natali. All rights reserved.
//

import UIKit

class MonthTableViewCell: UICollectionViewCell,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{


	var year:Int?
	let days:[Int] = (1...31).map{$0}
	var today = false


//	var tableViewReferncde:TableViewController?

	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var colectionView: UICollectionView!

	override func awakeFromNib() {
		super.awakeFromNib()
//		for i in 0..<Int(colectionView.frame.height){
//			if i%30 == 0 {
//				self.dotes.text = self.dotes.text! + "\n|"
//			}
//		}
//		dotesString = dotes.text!
		///title.text = Date().month

		
		colectionView.delegate = self
		colectionView.dataSource = self
		let cellNib = UINib(nibName: "CollectionViewCellDay", bundle: nil)
		colectionView.register(cellNib, forCellWithReuseIdentifier: "CollectionViewCellDay")
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 31
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = colectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellDay", for: indexPath) as! DayCollectionViewCell
		//print(indexPath.row)
	//	print(topic)
		cell.titleLable.text = "\(days[indexPath.row])"

		if today && (Int(Date().day) == indexPath.row){
			print (Date().day)
			cell.titleLable.textColor = UIColor.red
		}
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let nOfCellsInRow = 15
		let size = Int((collectionView.bounds.width) / CGFloat(nOfCellsInRow))
		return CGSize(width: size, height:size)
	}
//
//	@IBAction func selectTableViewButton(_ sender: UIButton) {
//		is_selected = !is_selected
////		for index in 0..<ImageMAnger.allCategory.count{
////			if ImageMAnger.allCategory[index].category.elementsEqual(topic){
////				ImageMAnger.allCategory[index].selected = is_selected
////			}
////		}
//		tableViewReferncde?.tableView.reloadRows(at: indexPath!, with: .automatic)
//
//	}
}

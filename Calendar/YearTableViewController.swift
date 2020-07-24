//
//  YearTableViewController.swift
//  Calendar
//
//  Created by hyperactive on 22/04/2020.
//  Copyright © 2020 natali. All rights reserved.
//

import UIKit

class YearTableViewController: UITableViewController {

	let years:[Int] = (1970...2070).map{$0}

	@IBAction func today(_ sender: UIBarButtonItem) {
	}
	@IBAction func goToToday(_ sender: UIBarButtonItem) {
		goToToday(index: Int(Date().year) ?? 2020)
	}
	func goToToday(index :Int){
		let indexPath = NSIndexPath(row: index, section: 0)
		tableView.scrollToRow(at: indexPath as IndexPath, at: .top, animated: true)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		let cellNib = UINib(nibName: "TableViewCell", bundle: nil)
		tableView.register(cellNib, forCellReuseIdentifier: "TableViewCell")
	//	tableView.rowHeight = UITableView.automaticDimension
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		goToToday(index: (Int(Date().year) ?? 2020)-1970)

	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return years.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! YearTableViewCell
	//	print(indexPath.row)
		cell.year = years[indexPath.row]

		if years[indexPath.row] == Int(Date().year){
			cell.title.textColor = UIColor.red
			cell.today = true
		}
		return cell
	}

//	func setSize(forCell currentCell: TableViewCell, topic: String){
//		var category:Topic?
//		for topiic in ImageMAnger.allCategory{
//			if topiic.category.elementsEqual(topic){
//				category = topiic
//			}
//		}
//		currentCell.is_selected = (category?.selected)!
//		if !(category?.selected)! {
//			currentCell.frame.size.height = 206
//			currentCell.colectionView.frame.size.height = 106
//		}else{
//			currentCell.frame.size.height = UIScreen.main.bounds.height
//			currentCell.colectionView.frame.size.height = UIScreen.main.bounds.height
//		}
//		currentCell.dotes.text = "|"
//		for i in 0..<Int(currentCell.colectionView.frame.size.height){
//			if i%30 == 0 {
//				currentCell.dotes.text = currentCell.dotes.text! + "\n|"
//			}
//		}
}

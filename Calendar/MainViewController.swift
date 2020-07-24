//
//  ViewController.swift
//  Calendar
//
//  Created by hyperactive on 20/04/2020.
//  Copyright © 2020 natali. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

	var container: ContainerViewController!
	var isToday:Bool=true
	var currentDate:Date?

	@IBOutlet weak var extendViewButton: UIBarButtonItem!
	@IBOutlet weak var SearchToolBar: UIToolbar!
	@IBOutlet weak var serchBar: UISearchBar!

	override func viewDidLoad() {
        super.viewDidLoad()
		extendViewButton.isEnabled = false
		currentDate = Date()
	//	print(currentDate?.day + " " + currentDate?.month+" "+currentDate?.year)
		container?.segueIdentifierReceivedFromParent("yearCalendare")
    }

//
//	func goToToday(){
//		//scroll yearCalendar to today
//		isToday=true
//	}
//
//	@IBAction func goToToday(_ sender: UIBarButtonItem) {
//		if isToday {
//			goToToday()
//			return
//		}
//		container!.segueIdentifierReceivedFromParent("monthCalendar")
//	}
	@IBAction func startSearch(_ sender: UIBarButtonItem) {
		SearchToolBar.isHidden = false
	}
	@IBAction func cancelSearch(_ sender: UIBarButtonItem) {
		SearchToolBar.isHidden = true
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "Container" {
			container = segue.destination as? ContainerViewController
			container.animationDurationWithOptions = (0.2, .transitionCrossDissolve)
		}
	}

}


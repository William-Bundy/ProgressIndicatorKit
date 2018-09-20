//
//  ViewController.swift
//  ProgressIndicatorKitExample
//
//  Created by William Bundy on 9/19/18.
//  Copyright © 2018 William Bundy. All rights reserved.
//

import UIKit
import ProgressIndicatorKit

class ViewController: ProgressIndicatorViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		super.startAnimating()
	}

	@IBAction func finishedLoading(_ sender: Any) {
		super.stopAnimating()
	}

}


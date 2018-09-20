//
//  ProgressIndicatorViewController.swift
//  ProgressIndicatorKit
//
//  Created by William Bundy on 9/19/18.
//  Copyright © 2018 William Bundy. All rights reserved.
//

import Foundation
import UIKit

open class ProgressIndicatorViewController:UIViewController
{
	var graphic:UIView!;
	var progress:Progress?
	private(set) var isAnimating:Bool = false

	public func followProgress(_ progress:Progress)
	{
		self.progress = progress
		progress.addObserver(self, forKeyPath: "completedUnitCount", options: .new, context:nil)
	}

	open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?)
	{
		if let progress = self.progress, keyPath == "completedUnitCount" {
			let p = Double(progress.completedUnitCount) / Double(progress.totalUnitCount)
			updateAnimationPercent(p)
		}
	}


	public func updateAnimationPercent(_ percent:Double)
	{

	}

	override open func viewDidLoad()
	{
		super.viewDidLoad()
		graphic = UIView(frame: CGRect(x:100, y:100, width:100, height:100))
		graphic.backgroundColor = .black
		self.view.addSubview(graphic)
	}

	public func startAnimating()
	{
		if !isAnimating {
			isAnimating = true
			UIView.animate(withDuration: 1.0, delay: 0.5, options: .repeat, animations: {
				self.graphic.transform = self.graphic.transform.rotated(by: 3.14 / 2)
			}) { success in
				print(success)
			}
		}
	}

	public func stopAnimating()
	{
		if isAnimating {
			isAnimating = false
			graphic.layer.anim
		}
	}

	open func whenAllAnimationsFinished()
	{

	}


}

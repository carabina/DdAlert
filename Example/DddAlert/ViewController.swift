//
//  ViewController.swift
//  DddAlert
//
//  Created by add TableView on 08/07/2016.
//  Copyright (c) 2016 add TableView. All rights reserved.
//

import UIKit
import DddAlert

class ViewController: UIViewController,UITextFieldDelegate,UINavigationControllerDelegate {
	
	@IBOutlet weak var DUILabel: UILabel!
	@IBOutlet weak var DButtonItem: UIBarButtonItem!
	
	var aas:UITextField!
	var view1 : UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// NavigationControllerのdelegateに自身をセット
		navigationController?.delegate = self
	}
	override func didReceiveMemoryWarning()
	{
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction  func dUILabelSegue(sender: UIBarButtonItem){
		
		let screenWidth2 = self.view.bounds.width
		let screenHeight2 = self.view.bounds.height
		view1 = DbankAlert(frame: CGRectMake(0, 0, screenWidth2, screenHeight2))
		self.view.addSubview(view1)
		//任意のサイズ
		aas = UITextField(frame: CGRectMake(100, 180, 414-200, 50))
		self.aas.delegate = self
		aas.backgroundColor = UIColor.whiteColor()
		aas.becomeFirstResponder()
		//上記よりフレームを生成する
		view1.addSubview(aas)
		DButtonItem.enabled = false
	}
	
	internal func textFieldShouldReturn(textField: UITextField) -> Bool {
		
		DButtonItem.enabled = true
		DUILabel.text = aas.text
		UIView.animateWithDuration(0.5,
		                           animations: { () -> Void in
									// 縮小用アフィン行列を作成.
									self.view1.transform = CGAffineTransformMakeScale(0.7, 0.7)
			}) // 連続したアニメーション処理.
		{ (Bool) -> Void in
			UIView.animateWithDuration(0.5,
			                           // アニメーション中の処理.
				animations: { () -> Void in
					// 拡大用アフィン行列を作成.
					self.view1.transform = CGAffineTransformMakeScale(0, 0)
			})
		}
		UIView.animateWithDuration(0.5,
		                           animations: { () -> Void in
			}) // 連続したアニメーション処理.
		{ (Bool) -> Void in
			UIView.animateWithDuration(0.5,
			                           // アニメーション中の処理.
				animations: { () -> Void in
			})
		}
		// backgroundColorを使って透過させる。
		view1.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
		// アニメーション処理
		UIView.animateWithDuration(NSTimeInterval(CGFloat(0.5)),
		                           animations: {() -> Void in
									// 移動先の座標を指定する.
									self.aas.center = CGPoint(x:self.view1.bounds.midX,y: 200);
			}, completion: {(Bool) -> Void in
				
		})
		aas.resignFirstResponder()
		return true
	}
}
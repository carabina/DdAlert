//
//  DddAlert.swift
//  DddAlert
//
//  Created by 永田大祐 on 2016/08/07.
//  Copyright © 2016年 永田大祐. All rights reserved.
//

import UIKit

public class DbankAlert:UIView,UITextFieldDelegate {
    
    var DbankView : UIView!
    public override init(frame: CGRect) {
        super.init(frame: frame)
        func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
            _ = 100.0 as CGFloat
            let path = UIBezierPath(ovalInRect: self.bounds)
            if path.containsPoint(point) {
                return nil
            }
            return self
        }
        
        let screenHeight = Int(UIScreen.mainScreen().bounds.size.height);
        // Viewに追加.
        switch screenHeight {
        case 480:
            DbankView = UIView(frame: CGRectMake(0,0, 320, 480))
            self.addSubview(DbankView)
            self.getAnimation()
        case 568:
            DbankView = UIView(frame: CGRectMake(0,0, 320, 568))
            self.addSubview(DbankView)
            self.getAnimation()
        case 667:
            DbankView = UIView(frame: CGRectMake(0,0, 375, 667))
            self.addSubview(DbankView)
            self.getAnimation()
        case 736:
            DbankView = UIView(frame: CGRectMake(0,0, 414, 736))
            self.addSubview(DbankView)
            self.getAnimation()
        default:
            break // do nothing
        }
        
        // backgroundColorを使って透過させる。
        DbankView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
    }
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getAnimation(){
        
        UIView.animateWithDuration(0.5,
                                   animations: { () -> Void in
                                    // 縮小用アフィン行列を作成.
                                    self.DbankView.transform = CGAffineTransformMakeScale(0, 0.7)
            }) // 連続したアニメーション処理.
        { (Bool) -> Void in
            UIView.animateWithDuration(0.5,
                                       // アニメーション中の処理.
                animations: { () -> Void in
                    // 拡大用アフィン行列を作成.
                    self.DbankView.transform = CGAffineTransformMakeScale(1, 1)
            })
        }
        UIView.animateWithDuration(0.5,
                                   animations: { () -> Void in
            }) // 連続したアニメーション処理.
        { (Bool) -> Void in
        }
    }
}


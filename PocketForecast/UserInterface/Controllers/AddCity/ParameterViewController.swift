//
//  ParameterViewController.swift
//  PocketForecast
//
//  Created by Maoning Guo on 2016-03-15.
//  Copyright © 2016 typhoon. All rights reserved.
//

import UIKit

class ParameterViewController : UIViewController, UITextFieldDelegate,Themeable {
    

    @IBOutlet weak var initCash: UITextField!
    @IBOutlet weak var rfRate: UITextField!
    // MARK: Properties
    @IBOutlet weak var percent: UITextField!
    
    @IBAction func submit(sender: UIButton) {
        rootViewController.dismissParameterListController();
        rootViewController.showAddCitiesController();
    }
    
    var rootViewController : RootViewController!
    var theme : Theme!
    
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required override init(nibName : String!, bundle : NSBundle!)
    {
        NSLog("yehay!!!!!!!!!!!!!!!!!!!!!")
        super.init(nibName: nibName, bundle: bundle)
    }

    
    override func viewDidLoad() {
       // view.autoresizingMask = [.FlexibleRightMargin, .FlexibleLeftMargin, .FlexibleBottomMargin]
        super.viewDidLoad();
        self.applyTheme()


    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       // self.validationMessage.hidden = true
    }
    
    private func applyTheme() {
        print (String(format:"In apply theme: %@", self.theme!))
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.barTintColor = self.theme.navigationBarColor
    }
    
}
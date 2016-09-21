//
//  ViewController.swift
//  CartoonTrivia
//
//  Created by Grace Lam on 7/22/14.
//  Copyright (c) 2014 Grace Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Create an imageView that I can modify from any function in this class
    var imageView:UIImageView = UIImageView()
    
    var questionLabel:UILabel = UILabel()
    var answerLabel:UILabel = UILabel()
    var scoreLabel:UILabel = UILabel()
    
    var model:TriviaModel = TriviaModel()
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make constants to describe size of view
        let width:CGFloat = 320
        let height:CGFloat = 568
        
        // Make a newView and add it to the main view
        var newView:UIView = UIView(frame: CGRectMake(0, 0, width, height))
        self.view.addSubview(newView)
        
        // Make an image and add it to the imageView
        var newImage:UIImage = UIImage(named: "mike.jpg")
        imageView = UIImageView(frame: newView.frame)
        imageView.image = newImage
        
        // Add the imageView to the newView
        newView.addSubview(imageView)
        
        // Create questionLabel
        questionLabel.frame = CGRectMake(0, 0, 200, 50)
        questionLabel.center = CGPointMake(160, 80)
        questionLabel.text = "Who is this?"
        questionLabel.font = UIFont.systemFontOfSize(35)
        questionLabel.textAlignment = NSTextAlignment.Center
        newView.addSubview(questionLabel)
        
        // Create answerLabel
        answerLabel.frame = CGRectMake(0, 0, 200, 50)
        answerLabel.center = CGPointMake(160, 400)
        answerLabel.textAlignment = NSTextAlignment.Center
        newView.addSubview(answerLabel)
        
        // Create scoreLabel
        scoreLabel.frame = CGRectMake(0, 0, 200, 50)
        scoreLabel.center = CGPointMake(160, 420)
        scoreLabel.textAlignment = NSTextAlignment.Center
        newView.addSubview(scoreLabel)
        
        // Create buttons
        var y:CGFloat = 160
        for cartoon in model.cartoons {
            var button:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
            button.backgroundColor = UIColor.whiteColor()
            button.titleLabel.font = UIFont.systemFontOfSize(20)
            button.frame = CGRectMake(0, 0, 150, 30)
            button.center = CGPointMake(160, y)
            y += 60
            button.setTitle(cartoon, forState: UIControlState.Normal)
            button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            newView.addSubview(button)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    func buttonClicked(sender:UIButton) {
        if model.guess(sender.currentTitle) == true {
            answerLabel.text = "Answer: Correct!"
            scoreLabel.text = "Score: " + String(model.getScore())
            
        }
        else {
            answerLabel.text = "Answer: Incorrect!"
        }
        var newImage:UIImage = UIImage(named: model.getImageForCartoon(model.getRandomCartoon()))
        imageView.image = newImage
    }
    
}

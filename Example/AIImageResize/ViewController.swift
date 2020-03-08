//
//  ViewController.swift
//  AIImageResize
//
//  Copyright (c) 2020 Adrian Ilie. All rights reserved.
//

import UIKit
import AIImageResize

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupScrollView()
        demoOriginal()
        demoWidth()
        demoCrop()
    }
    
    var scrollView: UIScrollView?
    
    private func setupScrollView() {
        scrollView = UIScrollView()
        guard let scrollView = self.scrollView else { return }
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor.white
        view.addSubview(scrollView)
        
        let constraintWidth = NSLayoutConstraint(item: scrollView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1.0, constant: 0.0)
        let constraintHeight = NSLayoutConstraint(item: scrollView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1.0, constant: 0.0)
        let constraintCenterX = NSLayoutConstraint(item: scrollView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let constraintCenterY = NSLayoutConstraint(item: scrollView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        view.addConstraints([
            constraintWidth, constraintHeight,
            constraintCenterX, constraintCenterY
        ])
    }
    
    var image1View: UIImageView?
    var image1Label: UILabel?
    
    var image2View: UIImageView?
    var image2Label: UILabel?
       
    var image3View: UIImageView?
    var image3Label: UILabel?
    
    private func demoOriginal() {
        guard let scrollView = self.scrollView else { return }
        
        image1View = UIImageView()
        guard let image1View = self.image1View else { return }
        
        image1View.translatesAutoresizingMaskIntoConstraints = false
        image1View.contentMode = .scaleToFill
        image1View.clipsToBounds = true
        scrollView.addSubview(image1View)
        
        let constraintImageWidth = NSLayoutConstraint(item: image1View, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: UIScreen.main.bounds.size.width - 40.0)
        let constraintImageHeight = NSLayoutConstraint(item: image1View, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 150.0)
        let constraintImageTop = NSLayoutConstraint(item: image1View, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .top, multiplier: 1.0, constant: 60.0)
        let constraintImageLeading = NSLayoutConstraint(item: image1View, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leading, multiplier: 1.0, constant: 20.0)
        scrollView.addConstraints([
            constraintImageWidth, constraintImageHeight,
            constraintImageTop, constraintImageLeading
        ])
        
        image1Label = UILabel()
        guard let image1Label = self.image1Label else { return }
        
        image1Label.translatesAutoresizingMaskIntoConstraints = false
        image1Label.textAlignment = .center
        scrollView.addSubview(image1Label)
        
        let constraintLabelCenterX = NSLayoutConstraint(item: image1Label, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let constraintLabelTop = NSLayoutConstraint(item: image1Label, attribute: .top, relatedBy: .equal, toItem: image1View, attribute: .bottom, multiplier: 1.0, constant: 20.0)
        scrollView.addConstraints([
            constraintLabelCenterX, constraintLabelTop
        ])
        
        guard let originalImage = UIImage(named: "bucharest.jpg") else { return }
        guard let originalImageData = UIImageJPEGRepresentation(originalImage, 1.0) else { return }
        let originalImageSize = NSData(data: originalImageData).length
        
        image1View.image = originalImage
        image1Label.text = "Original image (\(originalImageSize) bytes)"
    }
    
    private func demoWidth() {
        guard let scrollView = self.scrollView else { return }
        guard let image1Label = self.image1Label else { return }
        
        image2View = UIImageView()
        guard let image2View = self.image2View else { return }
        
        image2View.translatesAutoresizingMaskIntoConstraints = false
        image2View.contentMode = .center
        image2View.clipsToBounds = true
        scrollView.addSubview(image2View)
        
        let constraintImageWidth = NSLayoutConstraint(item: image2View, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: UIScreen.main.bounds.size.width - 40.0)
        let constraintImageHeight = NSLayoutConstraint(item: image2View, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 150.0)
        let constraintImageTop = NSLayoutConstraint(item: image2View, attribute: .top, relatedBy: .equal, toItem: image1Label, attribute: .top, multiplier: 1.0, constant: 80.0)
        let constraintImageLeading = NSLayoutConstraint(item: image2View, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leading, multiplier: 1.0, constant: 20.0)
        scrollView.addConstraints([
            constraintImageWidth, constraintImageHeight,
            constraintImageTop, constraintImageLeading
        ])
        
        image2Label = UILabel()
        guard let image2Label = self.image2Label else { return }
        
        image2Label.translatesAutoresizingMaskIntoConstraints = false
        image2Label.textAlignment = .center
        scrollView.addSubview(image2Label)
        
        let constraintLabelCenterX = NSLayoutConstraint(item: image2Label, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let constraintLabelTop = NSLayoutConstraint(item: image2Label, attribute: .top, relatedBy: .equal, toItem: image2View, attribute: .bottom, multiplier: 1.0, constant: 20.0)
        scrollView.addConstraints([
            constraintLabelCenterX, constraintLabelTop
        ])
        
        guard let originalImage = UIImage(named: "bucharest.jpg") else { return }
        guard let resizedImage = originalImage.resize(toWidth: constraintImageWidth.constant) else { return }
        guard let resizedImageData = UIImageJPEGRepresentation(resizedImage, 1.0) else { return }
        let resizedImageSize = NSData(data: resizedImageData).length
        
        image2View.image = resizedImage
        image2Label.text = "Resized image to width (\(resizedImageSize) bytes)"
    }
    
    private func demoCrop() {
        guard let scrollView = self.scrollView else { return }
        guard let image2Label = self.image2Label else { return }
        
        image3View = UIImageView()
        guard let image3View = self.image3View else { return }
        
        image3View.translatesAutoresizingMaskIntoConstraints = false
        image3View.contentMode = .center
        image3View.clipsToBounds = true
        scrollView.addSubview(image3View)
        
        let constraintImageWidth = NSLayoutConstraint(item: image3View, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200.0)
        let constraintImageHeight = NSLayoutConstraint(item: image3View, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100.0)
        let constraintImageTop = NSLayoutConstraint(item: image3View, attribute: .top, relatedBy: .equal, toItem: image2Label, attribute: .top, multiplier: 1.0, constant: 80.0)
        let constraintImageCenterX = NSLayoutConstraint(item: image3View, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1.0, constant: 00.0)
        scrollView.addConstraints([
            constraintImageWidth, constraintImageHeight,
            constraintImageTop, constraintImageCenterX
        ])
        
        image3Label = UILabel()
        guard let image3Label = self.image3Label else { return }
        
        image3Label.translatesAutoresizingMaskIntoConstraints = false
        image3Label.textAlignment = .center
        scrollView.addSubview(image3Label)
        
        let constraintLabelCenterX = NSLayoutConstraint(item: image3Label, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let constraintLabelTop = NSLayoutConstraint(item: image3Label, attribute: .top, relatedBy: .equal, toItem: image3View, attribute: .bottom, multiplier: 1.0, constant: 20.0)
        let constraintLabelBottom = NSLayoutConstraint(item: image3Label, attribute: .bottom, relatedBy: .equal, toItem: scrollView, attribute: .bottom, multiplier: 1.0, constant: -20.0)
        scrollView.addConstraints([
            constraintLabelCenterX, constraintLabelTop, constraintLabelBottom
        ])
        
        guard let originalImage = UIImage(named: "bucharest.jpg") else { return }
        guard let resizedImage = originalImage.resize(toWidth: constraintImageWidth.constant) else { return }
        
        let cropRect = CGRect(
            x: resizedImage.size.width * 0.5 - constraintImageWidth.constant * 0.5,
            y: resizedImage.size.height * 0.5 - constraintImageHeight.constant * 0.5,
            width: constraintImageWidth.constant,
            height: constraintImageHeight.constant
        )
        
        guard let croppedImage = resizedImage.crop(inRect: cropRect) else { return }
        guard let croppedImageData = UIImageJPEGRepresentation(croppedImage, 1.0) else { return }
        let croppedImageSize = NSData(data: croppedImageData).length
        
        image3View.image = croppedImage
        image3Label.text = "Cropped image to 200p x 100p (\(croppedImageSize) bytes)"
    }
}

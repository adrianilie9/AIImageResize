//
//  AIImageResize+UIImage.swift
//  AIImageResize
//
//  Copyright (c) 2020 Adrian Ilie. All rights reserved.
//

import UIKit

public extension UIImage {
    /**
     * Resize an UIImage to a specified size.
     *
     * - parameter size: new image size
     * - returns: resized image
     */
    func resize(toSize size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        
        draw(in: CGRect(origin: CGPoint.zero, size: size))
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        return image
    }
    
    /**
     * Crop the contents of an UIImage in a specified rect.
     *
     * - parameter rect: crop rectangle
     * - returns: cropped image
     */
    func crop(inRect rect: CGRect) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0.0)
        defer { UIGraphicsEndImageContext() }
        
        draw(at: CGPoint(x: -rect.origin.x, y: -rect.origin.y))
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        return image
    }
    
    /**
     * Resize an UIImage to a specified width, while maintaing aspect ratio.
     *
     * - parameter width: image width in points
     * - returns: resized image
     */
    func resize(toWidth width: CGFloat) -> UIImage? {
        let aspectRatio = size.width / size.height
        let resizedHeight = width / aspectRatio
        
        return resize(toSize: CGSize(width: width, height: resizedHeight))
    }
    
    /**
     * Resize an UIImage to a specified height, while maintaing aspect ratio.
     *
     * - parameter height: image height in points
     * - returns: resized image
     */
    func resize(toHeight height: CGFloat) -> UIImage? {
        let aspectRatio = size.width / size.height
        let resizedWidth = height * aspectRatio
        
        return resize(toSize: CGSize(width: resizedWidth, height: height))
    }
    
    /**
     * Resize an UIImage to fit a specified size.
     *
     * - parameter size: size to fit
     * - returns: resized image
     */
    func resizeToFit(inSize size: CGSize) -> UIImage? {
        var resizeWidth: CGFloat = 0.0
        var resizeHeight: CGFloat = 0.0
        let ratioWidth = self.size.width / size.width
        let ratioHeight = self.size.height / size.height
        
        if ratioWidth > ratioHeight {
            resizeHeight = round(self.size.height / ratioWidth)
            resizeWidth = size.width
        } else {
            resizeWidth = round(self.size.width / ratioHeight)
            resizeHeight = size.height
        }
        
        return resize(toSize: CGSize(width: resizeWidth, height: resizeHeight))
    }
}

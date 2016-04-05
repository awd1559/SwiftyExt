import UIKit

extension UIView {
    func setCornerRadius(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    func setBorderWidth(width: CGFloat, andColor color:UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.CGColor
    }
    
    func getImage() -> UIImage {
        UIGraphicsBeginImageContext(self.bounds.size);
        self.drawViewHierarchyInRect(self.bounds, afterScreenUpdates: true)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return screenshot
    }
    
//    pod 'GPUImage'
//    func geBlurImage() -> UIImage {
//        let screenshot = self.getImage()
//        let blurFilter = GPUImageiOSBlurFilter()
//        blurFilter.saturation = 1.0
//        blurFilter.rangeReductionFactor = 0.1
//        let blurImage = blurFilter.imageByFilteringImage(screenshot)
//        
//        return blurImage
//    }
}
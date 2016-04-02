import UIKit

extension UIImage {
    
    func roundedCornerImage(cornerRadius: CGFloat) -> UIImage {
        
        let w = self.size.width
        let h = self.size.height
        var radius = cornerRadius
        
        if radius < 0 {
            radius = 0
        }
        if radius > min(w, h) {
            radius = min(w,h)
        }
        
        let imageFrame = CGRectMake(0, 0, w, h)
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.mainScreen().scale)
        
        UIBezierPath(roundedRect: imageFrame, cornerRadius: cornerRadius).addClip()
        self.drawInRect(imageFrame)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
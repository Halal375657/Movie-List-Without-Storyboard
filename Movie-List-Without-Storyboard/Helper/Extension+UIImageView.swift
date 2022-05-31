//
//  Extension+UIImageView.swift
//  Movie-List-Without-Storyboard
//
//  Created by iOS on 1/6/22.
//

import UIKit

extension UIImageView {
    
    /// Assign the image remotely to `UIImageView`
    ///
    /// - parameters:
    ///   - URLAddress: thumbnail(image) url.
    ///
    func loadFrom(URLAddress: String) {

        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}

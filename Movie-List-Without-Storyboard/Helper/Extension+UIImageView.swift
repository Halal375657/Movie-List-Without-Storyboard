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
        
        /**
         we use background thread for handle the blocking the Main Thread. it's increase the user inital experiences.
         */
        DispatchQueue.global(qos: .background).async { [ weak self ] in
            guard let self = self else { return }
            if let imageData = try? Data(contentsOf: url) {
                /**
                The uiimage `resizedImage` extension function improving the table view scrolling performances.
                 */
                if let loadedImage = UIImage(data: imageData)?.resizedImage(with: CGSize(width: 200.0, height: 200.0)) {
                    DispatchQueue.main.async {
                        self.image = loadedImage
                    }
                }
            }
        }
    } /// end the `loadFrom(.....)` method
}

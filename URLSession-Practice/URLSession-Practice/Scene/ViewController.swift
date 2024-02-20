//
//  ViewController.swift
//  URLSession-Practice
//
//  Created by EUNJU on 2/19/24.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovieDetailData(userKey: "2fa5866e3c329a53afad886b2f90601c", movieCode: "20236180")
    }
    
    // Network
    private func fetchMovieDetailData(userKey: String, movieCode: String) {
        MovieAPI.shared.requestMovieDetailAPI(userKey: userKey, 
                                              movieCode: movieCode) { networkResult in
            switch networkResult {
                
            case .success(let data):
                if let data = data as? MovieInformation {
                    print(data)
                }
            case .pathErr:
                print("pathErr")
            case .requestErr(_):
                print("requestErr")
            case .networkFail:
                print("networkFail")
            case .serverErr:
                print("serverErr")
                
            }
        }
    }
}

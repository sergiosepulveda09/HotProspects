//
//  UnderstandingSwiftResultType.swift
//  HotProspects
//
//  Created by Sergio Sepulveda on 2021-08-23.
//

import SwiftUI

enum NetworkingError: Error {
    case badURL, requestFailed, unknown
}

struct UnderstandingSwiftResultType: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                self.fetchData(from: "https://www.apple.com") { result in
                    switch result {
                    case .success(let str):
                        print(str)
                    case .failure(let error):
                        switch error {
                        case .badURL:
                            print("Bad URL")
                        case .requestFailed:
                            print("Request Failed")
                        case .unknown:
                            print("Unknown")
                        }
                    }
                }
            }
    }
    
    //First Function
//    func fetchData(from urlString: String) -> Result<String, NetworkingError> {
//        .failure(.badURL)
//    }
    
    //Second Function
//    func fetchData(from urlString: String, completion: (Result<String, NetworkingError>) -> Void) {
//        completion(.failure(.badURL))
//    }
    
    //Third Function
//    func fetchData(from urlString: String, completion: @escaping (Result<String, NetworkingError>) -> Void) {
//        DispatchQueue.main.async {
//            completion(.failure(.badURL))
//        }
//    }
//
    //Fourth Function
    
    func fetchData(from urlString: String, completion: @escaping (Result<String, NetworkingError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    let stringData = String(decoding: data, as: UTF8.self)
                    completion(.success(stringData))
                } else if error != nil {
                    completion(.failure(.requestFailed))
                } else {
                    completion(.failure(.unknown))
                }
            }
            
        }.resume()
    }

}

struct UnderstandingSwiftResultType_Previews: PreviewProvider {
    static var previews: some View {
        UnderstandingSwiftResultType()
    }
}

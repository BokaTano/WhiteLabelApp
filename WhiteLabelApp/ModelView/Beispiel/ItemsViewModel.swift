//
//  ItemViewModel.swift
//  BrettlyPrototype05
//
//  Created by Lars Klimmeck on 28.11.18.
//  Copyright © 2018 Sendmeback GmbH. All rights reserved.
//

import Bond
import Foundation

class ItemsViewModel {
    var itemArray = MutableObservableArray<Item>()
    var item = Observable(Item(valueString: "", valueInt: 0, isValue: false))
    var valueString: Observable<String?> = Observable("")
    var valueInt: Observable<Int?> = Observable(0)
    var isValue = Observable(false)
}

//Für die Funcs
extension ItemsViewModel {

    func addToArray(valueString: String?, valueInt: Int?, isValue: Bool?) {
        let item = Item(valueString: valueString ?? "", valueInt: valueInt ?? 0, isValue: isValue ?? false)
        itemArray.append(item)
    }

    // MARK: Example for HTTP Requests mit Encodable

    //    var searchInfos = [Search]() // TODO: Need better var name
//    var tags = [Tag]()
//
//    //testing data
//    let token =
//      "cFWDpbhfAKA:APA91bEEut0wuUkEY3VaryPDEhA5UIpSe9KNkd6FoODOH5s9J5Z2GY09NN00kRyfcpoyXvyuEUeK_ryAFZFdqU-52gM3
//      hux00X0h6kf1MLaJylcKJ-Y_3TdD3OTPLttp7eoBHkwYX2T5"

//    func postSearch(with tags: [Tag]){
//        guard let url = URL(string:  "https://www.brettly.de:5000/requests/") else { return }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//
//        //testing data
//        let post = Search(requestId: 56, token: token, tags: tags, categories: [""], onlyImages: false,
//          notificationsEnabled: false, notifications: nil, status: nil, date: nil)
//
//        do{
//            let jsonBody = try JSONEncoder().encode(post)
//            request.httpBody = jsonBody
//        } catch {}
//
//        let session = URLSession.shared
//        let task = session.dataTask(with: request) { (data , response, err) in
//            // TODO response
//            // TODO err
//            guard let data = data else {return}
//            do {
//                let status = try JSONDecoder().decode(Status.self, from: data)
//                print("Status: \(status)")
//            } catch {}
//        }
//        task.resume()
//    }
//
//    func getSearches(completion: @escaping ([Search]) -> ()){
//        guard let url = URL(string: "https://www.brettly.de:5000/requests/" + token) else { return }
//        let session = URLSession.shared
//
//        session.dataTask(with: url) { (data, _, err) in
//
//            if let data = data {
//                do {
//                    let searchRequest = try JSONDecoder().decode(Searches.self, from: data)
//                    completion(searchRequest.searches!)
//                } catch {
//                    print("Error in JSONDecoder")
//                }
//            }
//            // TODO err
//            }.resume()
//    }
}

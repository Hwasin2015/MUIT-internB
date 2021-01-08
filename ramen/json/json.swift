//
//  json.swift
//  ramen
//
//  Created by Stanley-Robins-Hwasin on 2021/1/6.
//

//import UIKit
//var jsondata = "1"
//
//
//
//func getjsonString() -> String{
//    let jsonUrlString = "https://72s1bv5qp2.execute-api.ap-northeast-1.amazonaws.com/demo"
//    guard let url = URL(string: jsonUrlString) else { return "json error!" }
//    URLSession.shared.dataTask(with: url) {(data, response, error) in
//        guard let data = data else {return}
//        print(data)
//    }
//    return data
//}
//
//
//
//
//
//func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
//    let jsonData:Data = jsonString.data(using: .utf8)!
//    let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
//    if dict != nil {
//        return dict as! NSDictionary
//    }
//    return NSDictionary()
//}
//

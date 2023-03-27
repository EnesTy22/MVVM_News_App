//
//  WebService.swift
//  MVVM_GoodNews
//
//  Created by Enes Talha Yılmaz on 26.03.2023.
//

import Foundation

class WebService{
    func getArticles(url:URL,completion: @escaping ([Article]?)->())
    {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
                let articles = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articleList = articles{
                    completion(articleList.articles)
                }
                   
                print(articles?.articles)
                
            }
        }.resume()
    }
}

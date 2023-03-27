//
//  ArticleViewModel.swift
//  MVVM_GoodNews
//
//  Created by Enes Talha Yılmaz on 27.03.2023.
//

import Foundation

struct ArticleListViewModel{
    let articles:[Article]
}
extension ArticleListViewModel{
    var numberOfSections :Int{
        return 1
    }
    func numbersOfRowsInSection(_ section: Int)->Int{
        return self.articles.count
    }
    func articleAtIndex(index :Int)->ArticleViewModel{
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}
struct ArticleViewModel{
    private let article : Article
}
extension ArticleViewModel{
    init(_ article : Article){
        self.article = article
    }
}
extension ArticleViewModel{
    var title : String{
        return self.article.title
    }
    var description:String{
        return self.article.description
    }
}

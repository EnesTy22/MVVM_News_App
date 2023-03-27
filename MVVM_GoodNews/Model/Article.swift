//
//  Article.swift
//  MVVM_GoodNews
//
//  Created by Enes Talha Yılmaz on 26.03.2023.
//

import Foundation
struct ArticleList:Decodable{
    let articles : [Article]
}
struct Article : Decodable
{
    let title:String
    let description :String
}

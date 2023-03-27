//
//  NewsListTableViewController.swift
//  MVVM_GoodNews
//
//  Created by Enes Talha Yılmaz on 26.03.2023.
//

import Foundation
import UIKit

class NewsListTableViewController : UITableViewController{
    private var ArticleListVM:ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string:"https://newsapi.org/v2/everything?q=tesla&from=2023-02-26&sortBy=publishedAt&apiKey=66b7e5be800a48a7a7285941bd25e70f")!
        WebService().getArticles(url: url) { articles in
            if let articles = articles{
                self.ArticleListVM = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.ArticleListVM == nil ? 0 : self.ArticleListVM.numberOfSections
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ArticleListVM.numbersOfRowsInSection(section)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else{
            fatalError("ArticleTableViewCell not found")
        }
        let articleVM = self.ArticleListVM.articleAtIndex(index: indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        return cell
    }
}

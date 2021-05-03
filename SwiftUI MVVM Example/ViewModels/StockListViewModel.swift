//
//  StockListViewModel.swift
//  SwiftUI MVVM Example
//
//  Created by Fomagran on 2021/04/06.
//

import Foundation

class StockListViewModel :ObservableObject{
    
    @Published var searchTerm:String = ""
    @Published var stocks:[StockViewModel] = [StockViewModel]()
    @Published var news: [NewsArticleViewModel] = []
    
    func load() {
        fetchNews()
        fetchStocks()
    }
    
    private func fetchStocks() {
        
        WebService().getStocks { stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
    }
    
    private func fetchNews() {
        
        WebService().getTopNews { news in
            if let news = news {
                self.news = news.map(NewsArticleViewModel.init)
            }
        }
    }
    
}

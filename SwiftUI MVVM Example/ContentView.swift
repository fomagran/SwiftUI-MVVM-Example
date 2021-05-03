//
//  ContentView.swift
//  SwiftUI MVVM Example
//
//  Created by Fomagran on 2021/04/06.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchTerm:String = ""
    @ObservedObject private var stockListViewModel = StockListViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = .black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        UITableView.appearance().backgroundColor = .black
        UITableViewCell.appearance().backgroundColor = .black
        
        stockListViewModel.load()
    }
    
    var body: some View {
        let filteredStocks = self.stockListViewModel.searchTerm.isEmpty ? self.stockListViewModel.stocks : self.stockListViewModel.stocks.filter{ $0.symbol.starts(with:self.stockListViewModel.searchTerm)}
        
        NavigationView {
            ZStack(alignment:.leading) {
                Color.black
                Text("Arpril 6 2021")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y:-320)
                
                SearchView(searchTerm: self.$stockListViewModel.searchTerm)
                    .offset(y:-260)
                StockListView(stocks: filteredStocks).offset(y:140)
                    .navigationBarTitle("Stocks")
                NewsArticleView(newsArticles: self.stockListViewModel.news)
                    .offset(y:140)
            }.edgesIgnoringSafeArea(.bottom)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .dark)
    }
}

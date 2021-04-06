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
        NavigationView {
            ZStack(alignment:.leading) {
                Color.black
                Text("Arpril 6 2021")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y:-330)
                
                SearchView(searchTerm: self.$stockListViewModel.searchTerm)
                    .offset(y:-270)
                StockListView(stocks: self.stockListViewModel.stocks).offset(y:100)
                    .navigationBarTitle("Stocks")
            }.edgesIgnoringSafeArea(.bottom)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .dark)
    }
}

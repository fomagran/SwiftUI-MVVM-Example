//
//  NewsArticleViewModel.swift
//  SwiftUI MVVM Example
//
//  Created by Fomagran on 2021/05/03.
//

import Foundation

struct NewsArticleViewModel {
    
    let article:Article
    
    var imageURL:String {
        return self.article.imageURL ?? "https://firebasestorage.googleapis.com/v0/b/moapt-15a9c.appspot.com/o/kidImage%2F%3CUIImage:0x6000010b7060%20anonymous%20%7B100,%20100%7D%3E?alt=media&token=bdcb322c-063c-4d73-a7b3-ac25a72c62e7"
    }
    
    var title:String {
        return self.article.title ?? "There is no title"
    }
    
    var publication:String {
        return self.article.publication?.uppercased() ?? "There is no publication"
    }
}

//
//  NewsArticleView.swift
//  SwiftUI MVVM Example
//
//  Created by Fomagran on 2021/05/03.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {
    
    let newsArticles:[NewsArticleViewModel]
    
    var body: some View {
        let screensize = UIScreen.main.bounds.size
        return  VStack(alignment: .leading) {
            VStack(alignment:.leading) {
                Text("Top News")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(2)
                
                Text("From 🍍News")
                    .foregroundColor(Color.gray)
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(2)
                
                ScrollView {
                    VStack{
                        ForEach(self.newsArticles,id:\.title) {
                            article in
                            HStack {
                                VStack(alignment: .leading){
                                    Text(article.publication)
                                        .foregroundColor(Color.white)
                                        .font(.custom("Arial", size: 22))
                                        .fontWeight(.bold)
                                    
                                    Text(article.title)
                                        .foregroundColor(Color.white)
                                        .font(.custom("Arial", size: 22))
                                        .fontWeight(.bold)
                                }
                                Spacer()
                                
                                //URLImage 패키지 사용
                                URLImage(url: URL(string: article.imageURL)!) { image in
                                    image.resizable()
                                }.frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            }
                        }
                    }.frame(maxWidth:.infinity)
                }
            }
        }.frame(width: screensize.width, height: screensize.height)
        .background(Color(red: 27/255, green: 28/255, blue: 30/255))
        .cornerRadius(20)
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        let article = Article(title: "News Title", imageURL: "https://firebasestorage.googleapis.com/v0/b/moapt-15a9c.appspot.com/o/kidImage%2F%3CUIImage:0x6000010b7060%20anonymous%20%7B100,%20100%7D%3E?alt=media&token=bdcb322c-063c-4d73-a7b3-ac25a72c62e7", publication:  "Fomagran's Journal")
        
        return NewsArticleView(newsArticles:[NewsArticleViewModel(article: article)])
    }
}

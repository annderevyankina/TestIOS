//
//  ContentView.swift
//  Workshop
//
//  Created by Анна on 13.11.2024.
//

import SwiftUI

struct ContentView: View {
    let newsService = NewsService()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            newsService.fetchNews(rubricId: 4, pageId: 1) { news in
                print(news)
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  HeadlinesView.swift
//  iNews
//
//  Created by Paraiso, Gustavo Alexandre on 15/10/2024.
//

import SwiftUI

struct HeadlinesView: View {
    var sections: [NewsCategory: [ArticleModel]]
    var onTapArticle: (ArticleModel) -> Void
    
    let categoryIcons: [NewsCategory: String] = [.general: "📰",
                                                  .entertainment: "🎬",
                                                  .business: "💸",
                                                  .health: "🏥",
                                                  .science: "🧑‍🔬",
                                                  .sports: "⚽️",
                                                  .technology: "🤖"]

    var body: some View {
        List {
            ForEach(Array(sections.keys)
                .sorted(by: { NewsCategory.allCases.firstIndex(of: $0)! < NewsCategory.allCases.firstIndex(of: $1)! }), id: \.self) { key in
                    
                    VStack(alignment: .leading) {
                        Text("\(key.rawValue.capitalized) \(categoryIcons[key] ?? "")")
                            .font(.system(size: 24))
                            .bold()
                            .padding(.vertical, 8)
                    NewsListView(articles: sections[key] ?? [], onTapArticle: onTapArticle)
                }
            }
                .listRowSeparator(.hidden, edges: .all)
        }
        .listStyle(.inset)
    }
}

//#Preview {
//    HeadlinesView(sections: [.general: ArticleModel.mockArray(), .sports: ArticleModel.mockArray()], onTapArticle: {_ in})
//}

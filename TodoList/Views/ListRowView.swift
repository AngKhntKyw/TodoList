//
//  ListRowView.swift
//  TodoList
//
//  Created by Digital Base on 15/5/25.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 2)
    }
}


#Preview {
    Group {
        ListRowView(item: ItemModel(title: "This is first title", isCompleted: false))
        ListRowView(item: ItemModel(title: "This is second title", isCompleted: true))
    }
}

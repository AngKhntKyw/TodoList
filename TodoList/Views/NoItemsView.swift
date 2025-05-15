//
//  NoItemsView.swift
//  TodoList
//
//  Created by Digital Base on 15/5/25.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("If you are not a gay, you must add todo list, well that means if you don't add any todo list , YOU ARE TOTALLY GAY")
        
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add something 🤩")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .cornerRadius(10)
                            .shadow(radius: 6)
                        
                    }
                )
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    
    func addAnimation() {
        guard !animate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            withAnimation(.easeInOut) {
                animate.toggle()
            }
        })
    }
}

#Preview {
    NoItemsView()
}

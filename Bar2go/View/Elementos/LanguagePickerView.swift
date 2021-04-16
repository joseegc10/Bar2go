//
//  LanguagePickerView.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 10/4/21.
//

import SwiftUI

struct Language: Hashable {
    let id: Int
    var title: String
    var selected: Bool
    
    init (id: Int, title: String, selected: Bool) {
        self.id = id
        self.title = title
        self.selected = selected
    }
}

struct LanguagePickerView: View {
    var Categories: [Language] = []
    var lastIndex: Int = 0
    
    @State var selectedIndex: Int = 0
    @Binding var selectedTitle: String
    @State private var currentIndex: Int = 0
    @Namespace private var ns
    
    init(selectedTitle: Binding<String>) {
        _selectedTitle = selectedTitle
        Categories.removeAll()
        Categories.append(Language(id: 0, title: "Español", selected: true))
        Categories.append(Language(id: 1, title: "English", selected: false))
    }
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center, spacing: 35) {
                ForEach(Categories, id: \.self) { item in
                    if item.id == currentIndex {
                        ZStack() {
                            Image(item.title)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .layoutPriority(1)
                            VStack() {
                                RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color("navbar"), lineWidth: 5)
                            }
                            .matchedGeometryEffect(id: "animation", in: ns)
                        }
                    } else {
                        Image(item.title)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .onTapGesture {
                                withAnimation {
                                    UserDefaults.standard.set(item.title, forKey: "idioma")
                                    currentIndex = item.id
                                    selectedTitle = item.title
                                }
                            }
                    }
                }
            }
            .padding(.leading, 10)
            .padding(.trailing, 20)
        }
        .padding()
        .onAppear{
            UserDefaults.standard.set("Español", forKey: "idioma")
        }
    }
    
}

//
//  PickerView.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 10/4/21.
//  Basado en lo encontrado en la página: https://medium.com/@shrineofapple/a-custom-replacement-for-the-horizontal-pickercontrol-f38fb05d22d5

import SwiftUI

struct Tipo: Hashable {
    let id: Int
    var title: String
    var selected: Bool
    
    init (id: Int, title: String, selected: Bool) {
        self.id = id
        self.title = title
        self.selected = selected
    }
}

struct TiposPickerView: View {
    var Categories: [Tipo] = []
    var lastIndex: Int = 0

    @Binding var selectedTitle: String
    @State var currentIndex: Int = 0
    @Namespace private var ns
    
    var index = 0
    
    let tipoInicial: String
    
    init(selectedTitle: Binding<String>, tipoInicial: String) {
        _selectedTitle = selectedTitle
        self.tipoInicial = tipoInicial
        Categories.removeAll()
        
        if tipoInicial == "Pasta" {
            index = 0
            Categories.append(Tipo(id: 0, title: "Pasta", selected: true))
        } else {
            Categories.append(Tipo(id: 0, title: "Pasta", selected: false))
        }
        
        if tipoInicial == "Pescado" {
            index = 1
            Categories.append(Tipo(id: 1, title: "Pescado", selected: true))
        } else {
            Categories.append(Tipo(id: 1, title: "Pescado", selected: false))
        }
        
        if tipoInicial == "Carne" {
            index = 2
            Categories.append(Tipo(id: 2, title: "Carne", selected: true))
        } else {
            Categories.append(Tipo(id: 2, title: "Carne", selected: false))
        }
        
        if tipoInicial == "Rápida" {
            index = 3
            Categories.append(Tipo(id: 3, title: "Rápida", selected: true))
        } else {
            Categories.append(Tipo(id: 3, title: "Rápida", selected: false))
        }
        
        if tipoInicial == "Rustico" {
            index = 4
            Categories.append(Tipo(id: 4, title: "Rustico", selected: true))
        } else {
            Categories.append(Tipo(id: 4, title: "Rustico", selected: false))
        }

        if tipoInicial == "Chino" {
            index = 5
            Categories.append(Tipo(id: 5, title: "Chino", selected: true))
        } else {
            Categories.append(Tipo(id: 5, title: "Chino", selected: false))
        }
    }
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                
                ScrollViewReader { scrollView in
                    
                    HStack(spacing: 35) {
                        
                        ForEach(Categories, id: \.self) { item in
                            if item.id == currentIndex {
                                ZStack() {
                                    Text(item.title)
                                        .bold()
                                        .layoutPriority(1)
                                    VStack() {
                                        Rectangle().frame(height: 2)
                                            .padding(.top, 20)
                                    }
                                    .matchedGeometryEffect(id: "animation", in: ns)
                                }
                            } else {
                                Text(item.title)
                                    .onTapGesture {
                                        withAnimation {
                                            currentIndex = item.id
                                            selectedTitle = item.title
                                            scrollView.scrollTo(item)
                                        }
                                    }
                            }
                        }
                    }
                    .padding(.leading, 10)
                    .padding(.trailing, 20)
                }
            }
        }
        .padding()
        .onAppear{
            currentIndex = index
        }
    }
    
}

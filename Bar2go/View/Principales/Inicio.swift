//
//  Inicio.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 8/4/21.
//  Basado en lo encontrado en la página https://betterprogramming.pub/creating-an-apple-like-splash-screen-in-swiftui-fdeb36b47e81

import SwiftUI

struct UtilidadApp: View {
    var title: String = "title"
    var subTitle: String = "subTitle"
    var imageName: String = "car"

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: imageName)
                .font(.largeTitle)
                .foregroundColor(.mainColor)
                .padding()
                .accessibility(hidden: true)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .accessibility(addTraits: .isHeader)

                Text(subTitle)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.top)
    }
}

struct UtilidadesApp: View {
    var body: some View {
        VStack(alignment: .leading) {
            UtilidadApp(title: "Búsquedas", subTitle: "Realiza una búsqueda de bares a partir del nombre, del tipo de comida o por cercanía.", imageName: "magnifyingglass")

            UtilidadApp(title: "Reservas", subTitle: "Realiza la reserva en el bar que desees para el día siguiente.", imageName: "book")
        }
        .padding(.horizontal)
    }
}

struct TituloBienvenida: View {
    var body: some View {
        VStack {
            Image("iconoBar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, alignment: .center)
                .accessibility(hidden: true)

            Text("Bienvenido a")
                .customTitleText()

            Text("Bar2go")
                .customTitleText()
                .foregroundColor(.mainColor)
        }
    }
}

struct Inicio: View {
    @Binding var index : String
    @State var numPersonas: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {

                Spacer()

                TituloBienvenida()

                UtilidadesApp()

                Spacer(minLength: 80)
                
                VStack(spacing: 20){
                    Text("Introduce el número de personas de la reserva")
                        .bold()
                        .font(.subheadline)
                    
                    TextField("", text: $numPersonas)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("navbar"), lineWidth: 2)
                        )
                        .keyboardType(.numberPad)
                }.padding(.horizontal, 25)
                
                Spacer(minLength: 40)

                Button(action: {
                    guard let num = Int(numPersonas) else { return }
                    UserDefaults.standard.set(num, forKey: "numPersonas")
                    index = "home"
                }) {
                    Text("Buscar bares")
                        .customButton()
                }
                .padding(.horizontal)
                .disabled(numPersonas == "0")
            }
        }
    }
}

struct Inicio2: View {
    @Binding var index : String
    @State var numPersonas: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 100){
                Spacer()
                
                Text("¡Bienvenido a Bar2go!")
                    .bold()
                    .font(.largeTitle)
                    .animation(.easeInOut(duration:1.0))
                
                VStack(spacing: 20){
                    Text("Introduce el número de personas de la reserva")
                        .bold()
                        .font(.subheadline)
                    
                    TextField("", text: $numPersonas)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("navbar"), lineWidth: 5)
                        )
                        .keyboardType(.numberPad)
                }
                
                Button(action:{
                    guard let num = Int(numPersonas) else { return }
                    UserDefaults.standard.set(num, forKey: "numPersonas")
                    index = "home"
                }){
                    Text("Buscar bares")
                        .foregroundColor(Color.black)
                        .bold()
                        .font(.headline)
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color("navbarFuerte"), Color("navbarSuave")]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
                .padding(.horizontal, 20)
                
                
                Spacer()
            }.padding(.horizontal)
        }.onTapGesture {
            self.hideKeyboard()
        }
    }
}



struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.mainColor))
            .padding(.bottom)
    }
}

extension View {
    func customButton() -> ModifiedContent<Self, ButtonModifier> {
        return modifier(ButtonModifier())
    }
}

extension Text {
    func customTitleText() -> Text {
        self
            .fontWeight(.black)
            .font(.system(size: 36))
    }
}

extension Color {
    //static var mainColor = Color(UIColor.systemIndigo)
    static var mainColor = Color("navbar")
}

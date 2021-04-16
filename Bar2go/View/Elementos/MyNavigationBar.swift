//
//  MyNavigationBar.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 17/3/21.
//

import SwiftUI
import Firebase

struct MyNavigationBar: View {
    @Binding var index : String
    @Binding var sacarMenu : Bool
    @EnvironmentObject var login: BarViewModel

    var body: some View {
        HStack{
            
            Menu {
                if UserDefaults.standard.integer(forKey: "numPersonas") != 0 {
                    Button(action: {
                        index = "agregar"
                    }) {
                        Label("Añadir bar", systemImage: "plus")
                    }
                    
                    Button(action: {
                        index = "reservasUsuario"
                    }) {
                        Label("Mis reservas", systemImage: "book")
                    }
                    
                    Button(action: {
                        index = "baresUsuario"
                    }) {
                        Label("Mis bares", systemImage: "rectangle.on.rectangle.angled")
                    }
                    
                    Button(action: {
                        UserDefaults.standard.removeObject(forKey: "numPersonas")
                        index = "inicio"
                    }) {
                        Label("Volver a pantalla de inicio", systemImage: "house")
                    }
                }
                
                Button(action: {
                    try! Auth.auth().signOut()
                    UserDefaults.standard.removeObject(forKey: "logueado")
                    UserDefaults.standard.removeObject(forKey: "numPersonas")
                    login.estado = .login
                }) {
                    Label("Cerrar sesión", systemImage: "escape")
                }
                
            } label: {
                Image(systemName: "line.horizontal.3").foregroundColor(.white).font(.system(size: 26))
            }
            
            Spacer()
            
            Button(action:{
                if (UserDefaults.standard.integer(forKey: "numPersonas")) != 0 {
                    index = "home"
                } else {
                    index = "inicio"
                }
            }){
                Text("Bar2go")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 25))
            }
            
            Spacer()

            Menu {
                Button(action: {
                    index = "nombre"
                }){
                    Text("Búsqueda por nombre")
                }
                
                Button(action: {
                    index = "tipo"
                }){
                    Text("Búsqueda por tipo de comida")
                }
                
                Button(action: {
                    index = "cercania"
                }){
                    Text("Búsqueda por cercanía")
                }
            } label: {
                Image(systemName: "magnifyingglass").foregroundColor(.white).font(.system(size: 26))
                    .frame(height: UserDefaults.standard.integer(forKey: "numPersonas") == 0 ? 0 : nil)
            }
                
        }
        .padding(.top, 25)
        .padding()
        .background(Color("navbar"))
    }
}

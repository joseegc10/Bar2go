//
//  ContentView.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 17/3/21.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView: View {
    @State private var index = "inicio"
    @State private var sacarMenu = false
    @State private var widthMenu = UIScreen.main.bounds.width
    @State private var bar: BarModel = BarModel()
    @State var activeSheet: ActiveSheet? = nil
    
    @EnvironmentObject var login: BarViewModel
    
    @State private var barEditar: BarModel = BarModel()
    
    @State var antiguoIndex: String = ""
    
    var body: some View {
        ZStack{
            Color("fondo").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            if login.estado == .logueado {
                VStack{
                    if UserDefaults.standard.integer(forKey: "numPersonas") != 0 {
                        MyNavigationBar(index: $index, sacarMenu: $sacarMenu)
                    }
                    switch index {
                        case "inicio":
                            Inicio(index: $index)
                                .onTapGesture {
                                    self.hideKeyboard()
                                }
                        case "home":
                            Home(index: $index, barEditar: $barEditar)
                                .onAppear{
                                    antiguoIndex = "home"
                                }
                        case "nombre":
                            BusquedaNombre(index: $index, barEditar: $barEditar)
                                .onAppear{
                                    antiguoIndex = "nombre"
                                }
                                .onTapGesture {
                                    self.hideKeyboard()
                                }
                        case "tipo":
                            BusquedaTipo(index: $index, barEditar: $barEditar)
                                .onAppear{
                                    antiguoIndex = "tipo"
                                }
                        case "cercania":
                            BusquedaCercania(index: $index, barEditar: $barEditar)
                                .onAppear{
                                    antiguoIndex = "cercania"
                                }
                        case "agregar":
                            FormularioBar(bar: $bar, activeSheet: $activeSheet,
                                          index: $index, tipoFormulario: .crear, antiguoIndex: $antiguoIndex)
                                .onAppear{
                                    bar = BarModel()
                                }
                        case "editar":
                            FormularioBar(bar: $barEditar, activeSheet: $activeSheet,
                                        index: $index, tipoFormulario: .editar, antiguoIndex: $antiguoIndex)
                        case "baresUsuario":
                            BaresUsuario(index: $index, barEditar: $barEditar)
                                .onAppear{
                                    antiguoIndex = "baresUsuario"
                                }
                        case "reservasUsuario":
                            ReservasUsuario()
                        default:
                            Text("defecto")
                    }
                }.padding(.top, UserDefaults.standard.integer(forKey: "numPersonas") != 0 ? 0 : 50)
                .onAppear{
                    if (UserDefaults.standard.integer(forKey: "numPersonas")) == 0 {
                        index = "inicio"
                    }
                }
            } else if login.estado == .login {
                Color("navbar").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                LoginView()
            }
            
        }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .onAppear{
            if (UserDefaults.standard.object(forKey: "logueado")) != nil {
                login.estado = .logueado
            }
            
            if (UserDefaults.standard.integer(forKey: "numPersonas")) != 0 {
                index = "home"
            }
        }
    }
}


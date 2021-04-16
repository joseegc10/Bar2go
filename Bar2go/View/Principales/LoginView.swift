//
//  LoginView.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 24/3/21.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    @StateObject var login = BarViewModel()
    @EnvironmentObject var estado: BarViewModel
    
    var body: some View {
        VStack{
            Text("Bar2go")
                .font(.largeTitle)
                .foregroundColor(.white)
                .bold()
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
                .autocapitalization(.none)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 20)
            
            Button(action:{
                login.login(email: email, password: password) { (done) in
                    if done{
                        UserDefaults.standard.set(true, forKey: "logueado")
                        estado.estado = .logueado
                    }
                }
            }){
                Text("Entrar")
                    .font(.title)
                    .frame(width: 200 )
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
            }.background(
                Capsule()
                    .stroke(Color.white)
            )
            
            Button(action:{
                login.register(email: email, password: password) { (done) in
                    if done{
                        UserDefaults.standard.set(true, forKey: "logueado")
                        estado.estado = .logueado
                    }
                }
            }){
                Text("Registrar")
                    .font(.title)
                    .frame(width: 200 )
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
            }.background(
                Capsule()
                    .stroke(Color.white)
            )
            
            
            
        }.padding(.all)
    }
}


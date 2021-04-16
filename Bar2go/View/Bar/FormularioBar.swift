//
//  FormularioBar.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 21/3/21.
//

import SwiftUI
import MapKit
import Firebase

enum TipoFormularioBar: Identifiable {
    case crear, editar
    
    var id: Int {
        hashValue
    }
}

struct FormularioBar: View {
    @Binding var bar: BarModel
    let tiposPosibles: [String] = TipoBar.allCases.map{ $0.rawValue }
    @State private var tipoElegido: [String:Bool] = [:]
    
    @StateObject var bares = BarViewModel()
    
    @Binding var activeSheet : ActiveSheet?
    @Binding var index : String
    var tipoFormulario: TipoFormularioBar
    
    @State private var elegirUbicacion = false
    @State private var elegirCapacidad = false
    
    @State private var alerta = false
    
    @State private var capacidad: String = ""
    
    @State private var centerCoordinate = CLLocationCoordinate2D()
    
    @State private var imageData : Data = .init(capacity: 0)
    @State private var mostrarMenu = false
    @State private var imagePicker = false
    @State private var source : UIImagePickerController.SourceType = .camera
    
    @Binding var antiguoIndex: String
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10){
                VStack{
                    Spacer()
                    
                    ZStack {
                        HStack {
                            if alerta {
                                Spacer()
                                ProgressView()
                                    .padding(.bottom, 30)
                                    .padding(.trailing, 30)
                            }
                        }
                        
                        
                        Button(action:{
                            mostrarMenu.toggle()
                        }){
                            if tipoFormulario == .editar {
                                if imageData.count != 0 {
                                    Image(uiImage: UIImage(data: imageData)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                } else {
                                    ImagenStorageView(imageURL: bar.dirImagen, anchura: 120, altura: 120)
                                }
                            } else {
                                if imageData.count != 0 {
                                    Image(uiImage: UIImage(data: imageData)!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                } else {
                                    Image("bar")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 100)
                                }
                            }
                        }.actionSheet(isPresented: $mostrarMenu, content: {
                            ActionSheet(title: Text("Menu"), message: Text("Selecciona una opción"), buttons: [
                                .default(Text("Cámara"), action: {
                                    source = .camera
                                    imagePicker.toggle()
                                }),
                                .default(Text("Librería"), action: {
                                    source = .photoLibrary
                                    imagePicker.toggle()
                                }),
                                .default(Text("Cancelar"))
                            ])
                        }).sheet(isPresented: $imagePicker) {
                            ImagePicker(show: $imagePicker, image: $imageData, source: source)
                        }
                    }
                }
                
                VStack(alignment:.leading, spacing: 10){
                    Text("Nombre")
                        .bold()
                        .font(.body)
                    
                    TextField("", text: $bar.nombre)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("navbar"), lineWidth: 2)
                        )
                    
                    Spacer()
                    
                    Text("Descripción")
                        .bold()
                        .font(.body)
                    
                    TextEditor(text: $bar.descripcion)
                        .frame(height:100, alignment: .center)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("navbar"), lineWidth: 2)
                        )
                        .lineSpacing(10)
                        .disableAutocorrection(true)
                    
                    Spacer()
                    
                    Text("Capacidad")
                        .bold()
                        .font(.body)
                    
                    TextField("", text: $capacidad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("navbar"), lineWidth: 2)
                        )
                        .keyboardType(.numberPad)
                        .disabled(tipoFormulario == .editar)
                    
                    Spacer()
                    
                    VStack(spacing: 15){
                        Button(action:{
                            elegirUbicacion = true
                        }){
                            HStack(alignment: .center, spacing: 15){
                                Image(systemName: "map")
                                    .font(.system(size: 25))
                                    .foregroundColor(.black)
                                
                                Text("Elegir ubicación en el mapa")
                                    .bold()
                                    .font(.body)
                                    .foregroundColor(.black)
                            }.frame(width: UIScreen.main.bounds.width - 60)
                        }.sheet(isPresented: $elegirUbicacion, content: {
                            ZStack{
                                Color("fondo").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                                ZStack {
                                    AgregarUbicacion(centerCoordinate: $centerCoordinate)
                                        .edgesIgnoringSafeArea(.all)
                                    
                                    Circle()
                                        .fill(Color.blue)
                                        .opacity(0.3)
                                        .frame(width: 32, height: 32)
                                    
                                    VStack {
                                        Spacer()
                                        HStack {
                                            Spacer()
                                            Button(action: {
                                                let newLocation = MKPointAnnotation()
                                                newLocation.coordinate = self.centerCoordinate
                                                bar.lat = newLocation.coordinate.latitude
                                                bar.long = newLocation.coordinate.longitude
                                                elegirUbicacion = false
                                            }) {
                                                Image(systemName: "checkmark")
                                            }
                                            .padding()
                                            .background(Color.black.opacity(0.75))
                                            .foregroundColor(.white)
                                            .font(.title)
                                            .clipShape(Circle())
                                            .padding(.trailing)
                                        }
                                    }
                                }
                            }
                        })
                    }.padding()
                    .background(Color(.white))
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color("navbar"), lineWidth: 2)
                    )
                    
                    
                }.padding(.horizontal)
                
                Spacer()
                
                TiposPickerView(selectedTitle: $bar.tipo, tipoInicial: bar.tipo)
                
                Spacer()
                
                HStack {
                    Button(action:{
                        alerta = true
                        guard let cap = Int(capacidad) else { return }
                        bar.capacidad = cap
                        
                        if tipoFormulario == .crear {
                            bar.id = UUID().uuidString
                            guard let idUser = Auth.auth().currentUser?.uid else { return }
                            bar.idUser = idUser
                            bares.aniadeBar(miBar: bar, imagen: imageData) { (fin) in
                                if fin {
                                    alerta = false
                                    index = "home"
                                }
                            }
                        } else if tipoFormulario == .editar {
                            if imageData.count != 0 {
                                bar.imagen = imageData
                                bares.editarBarConImagen(bar: bar, imagen: imageData) { (fin) in
                                    if fin {
                                        alerta = false
                                        index = antiguoIndex
                                    }
                                }
                            } else {
                                bares.editarBar(bar: bar) { (fin) in
                                    if fin {
                                        alerta = false
                                        index = antiguoIndex
                                    }
                                }
                            }
                        }
                    }){
                        Text("Guardar")
                            .foregroundColor(Color.black)
                            .bold()
                            .font(.largeTitle)
                    }.disabled(bar.nombre == "" || bar.tipo == "" || capacidad == "" || bar.descripcion == "" || (bar.lat == 0.0 && bar.long == 0.0))
                    
                    Image(systemName: "square.and.arrow.down.fill")
                        .font(.system(size: 26))
                        .foregroundColor(Color.black)
                }.frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color("navbarFuerte"), Color("navbarFuerte")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(40)
                .padding(.horizontal, 50)
                
                if tipoFormulario == .editar {
                    HStack {
                        Button(action:{
                            alerta = true
                            bares.eliminarBar(id: bar.id, imageURL: bar.dirImagen){ (fin) in
                                if fin {
                                    alerta = false
                                    index = antiguoIndex
                                }
                            }
                        }){
                            Text("Eliminar")
                                .foregroundColor(Color.black)
                                .bold()
                                .font(.largeTitle)
                        }
                        
                        Image(systemName: "xmark.bin.fill")
                            .font(.system(size: 26))
                            .foregroundColor(Color.black)
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("navbarFuerte"), Color("navbarFuerte")]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .padding(.horizontal, 50)
                    .padding(.top)
                }
                
                Spacer()
            }
        }.onAppear{
            if tipoFormulario == .crear {
                capacidad = "0"
            } else if tipoFormulario == .editar {
                capacidad = String(bar.capacidad)
            }
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

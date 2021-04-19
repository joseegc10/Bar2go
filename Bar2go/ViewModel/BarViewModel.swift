//
//  BarViewModel.swift
//  Bar2go
//
//  Created by Jose Alberto Garcia Collado on 18/3/21.
//

import Foundation
import Combine
import Firebase


/// Estado: Sirve para saber si el usuario esta logueado o no
enum Estado: Identifiable {
    case login, logueado
    
    var id: Int {
        hashValue
    }
}


/// Para realizar la reserva en el dia de mañana
let fechaMañana: String = { () -> String in
    var date = Date()
    date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
    let formatter = DateFormatter()
    formatter.dateFormat = "dd-MM-yyyy"
    return formatter.string(from: date)
}()


/// Clase para la conexion con la base de datos de firebase (login, bares y reservas)
class BarViewModel: ObservableObject {
    @Published var bares = [BarModel]()         /// Almacenar los bares según se pidan
    @Published var reservas = [ReservaModel]()  /// Almacenar las reservas según se pidan
    @Published var estado: Estado = .login      /// Saber si el usuario se ha logueado
    
    /// Login en firebase
    /// - Parameters:
    ///   - email: email del usuario
    ///   - password: contraseña del usuario
    ///   - completion: Para saber si se ha hecho correctamente
    func login(email: String, password: String, completion: @escaping (_ done: Bool) -> Void){
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if user != nil {
                print("Ha entrado")
                completion(true)
            } else {
                if let error = error?.localizedDescription {
                    print("Error login en firebase: ", error)
                } else {
                    print("Error en la app")
                }
            }
        }
    }
    
    
    /// Registro en la app
    /// - Parameters:
    ///   - email: email del usuario
    ///   - password: contraseña del usuario
    ///   - completion: Para saber si se ha hecho correctamente
    func register(email: String, password: String, completion: @escaping (_ done: Bool) -> Void){
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if user != nil {
                print("Se ha registrado")
                completion(true)
            } else {
                if let error = error?.localizedDescription {
                    print("Error registro en firebase: ", error)
                } else {
                    print("Error en la app")
                }
            }
        }
    }
    
    
    /// Para añadir un bar a la base de datos
    /// - Parameters:
    ///   - miBar: bar a añadir
    ///   - imagen: imagen del bar
    ///   - completion: saber si se ha añadido correctamente
    func aniadeBar(miBar: BarModel, imagen: Data, completion: @escaping (Bool) -> Void){
        let storage = Storage.storage().reference()
        let nombrePortada = UUID()
        let directorio = storage.child("imagenes/\(nombrePortada)")
        let metadata = StorageMetadata()
        metadata.contentType = "image/png"
        
        directorio.putData(imagen, metadata: metadata){data, error in
            if error == nil {
                print("guardo la imagen")
                
                // Guardamos primero la imagen y ahora el texto ya que la imagen tarda mas
                let db = Firestore.firestore()
                let id = UUID().uuidString

                guard let idUser = Auth.auth().currentUser?.uid else { return }

                let bar = miBar

                let campos: [String:Any] = ["idUser": idUser, "nombre":bar.nombre, "descripcion":bar.descripcion, "lat":bar.lat, "long":bar.long, "tipo":bar.tipo, "capacidad":bar.capacidad, "capacidadTurno": bar.capacidadTurno, "dirImagen":String(describing: directorio)]
                db.collection("bares").document(id).setData(campos){error in
                    if let e = error?.localizedDescription {
                        print("Error al guardar bar", e)
                    } else {
                        print("Guardado correctamente")
                        completion(true)
                    }
                }
            } else {
                if let error = error?.localizedDescription {
                    print("error al subir la imagen en storage", error)
                } else {
                    print("error en la app al subir imagen")
                }
            }
        }
    }
    
    
    /// Convertir json en BarModel
    /// - Parameter document: json de la query
    /// - Returns: BarModel creado
    func docEnBar(document: QueryDocumentSnapshot) -> BarModel{
        let valor = document.data()
        let id = document.documentID
        let nombre = valor["nombre"] as? String ?? ""
        let descripcion = valor["descripcion"] as? String ?? ""
        let lat = valor["lat"] as? Double ?? 0.0
        let long = valor["long"] as? Double ?? 0.0
        let tipo = valor["tipo"] as? String ?? ""
        let usuario = valor["idUser"] as? String ?? ""
        let capacidad = valor["capacidad"] as? Int ?? 0
        let capacidadTurno = valor["capacidadTurno"] as? [String:[String:Int]] ?? [:]
        let dirImagen = valor["dirImagen"] as? String ?? ""

        let bar = BarModel(id: id, nombre: nombre, descripcion: descripcion,
                           capacidad: capacidad, capacidadTurno: capacidadTurno, lat: lat, long: long,
                           tipo: tipo, idUser: usuario, dirImagen: dirImagen)
        
        return bar
    }
    
    
    /// Pasar json a BarModel pero con los datos directamente en vez de con la query
    /// - Parameters:
    ///   - valor: Datos para generar el BarModel
    ///   - id: id del bar
    /// - Returns: BarModel creado
    func docEnBar2(valor: [String:Any], id: String) -> BarModel{
        let nombre = valor["nombre"] as? String ?? ""
        let descripcion = valor["descripcion"] as? String ?? ""
        let lat = valor["lat"] as? Double ?? 0.0
        let long = valor["long"] as? Double ?? 0.0
        let tipo = valor["tipo"] as? String ?? ""
        let usuario = valor["idUser"] as? String ?? ""
        let capacidad = valor["capacidad"] as? Int ?? 0
        let capacidadTurno = valor["capacidadTurno"] as? [String:[String:Int]] ?? [:]
        let dirImagen = valor["dirImagen"] as? String ?? ""

        let bar = BarModel(id: id, nombre: nombre, descripcion: descripcion,
                           capacidad: capacidad, capacidadTurno: capacidadTurno, lat: lat, long: long, tipo: tipo, idUser: usuario, dirImagen: dirImagen)
        
        return bar
    }
    
    
    /// Obtener todos los bares
    func obtenerBares(){
        let db = Firestore.firestore()
        db.collection("bares").getDocuments { (querySnapshot, err) in
                if let err = err {
                    print("Error al obtener bares: \(err)")
                } else {
                    self.bares.removeAll()
                    for document in querySnapshot!.documents {
                        let barGenerado = self.docEnBar(document: document)
                        let tam = UserDefaults.standard.integer(forKey: "numPersonas")
                        
                        if barGenerado.capacidadTurno[fechaMañana] != nil {
                            if barGenerado.capacidadTurno[fechaMañana]!["1"]! >= tam || barGenerado.capacidadTurno[fechaMañana]!["2"]! >= tam || barGenerado.capacidadTurno[fechaMañana]!["3"]! >= tam || barGenerado.capacidadTurno[fechaMañana]!["4"]! >= tam{
                                self.bares.append(barGenerado)
                            }
                        } else {
                            var bar = barGenerado
                            let cap = bar.capacidad
                            
                            if bar.capacidadTurno[fechaMañana] == nil {
                                let turnos = ["1":cap,"2":cap,"3":cap,"4":cap]
                                bar.capacidadTurno[fechaMañana] = turnos
                            } else {
                                bar.capacidadTurno[fechaMañana]!["1"] = cap
                                bar.capacidadTurno[fechaMañana]!["2"] = cap
                                bar.capacidadTurno[fechaMañana]!["3"] = cap
                                bar.capacidadTurno[fechaMañana]!["4"] = cap
                            }
                            
                            self.bares.append(bar)
                        }
                    }
                }
        }
    }
    
    /// Obtener los bares del usuario
    func obtenerBaresUsuario(){
        let db = Firestore.firestore()
        guard let idUser = Auth.auth().currentUser?.uid else { return }
        
        db.collection("bares").whereField("idUser", isEqualTo: idUser)
            .getDocuments(){ (querySnapshot, err) in
                if let err = err {
                    print("Error al obtener bares del usuario: \(err)")
                } else {
                    self.bares.removeAll()
                    for document in querySnapshot!.documents {
                        let barGenerado = self.docEnBar(document: document)
                        var bar = barGenerado
                        let cap = bar.capacidad
                        
                        if bar.capacidadTurno[fechaMañana] == nil {
                            if bar.capacidadTurno[fechaMañana] == nil {
                                let turnos = ["1":cap,"2":cap,"3":cap,"4":cap]
                                bar.capacidadTurno[fechaMañana] = turnos
                            } else {
                                bar.capacidadTurno[fechaMañana]!["1"] = cap
                                bar.capacidadTurno[fechaMañana]!["2"] = cap
                                bar.capacidadTurno[fechaMañana]!["3"] = cap
                                bar.capacidadTurno[fechaMañana]!["4"] = cap
                            }
                        }
                            
                        self.bares.append(bar)
                    }
                }
        }
    }
    
    
    /// Obtener las reservas del usuario
    func obtenerReservasUsuario(){
        let db = Firestore.firestore()
        guard let idUser = Auth.auth().currentUser?.uid else { return }
        
        db.collection("reservas").whereField("idUser", isEqualTo: idUser)
            .getDocuments(){ (querySnapshot, err) in
                if let err = err {
                    print("Error al obtener reservas del usuario: \(err)")
                } else {
                    self.reservas.removeAll()
                    for document in querySnapshot!.documents {
                        let idBar = document.data()["idBar"] as? String ?? ""
                        let turno = document.data()["turno"] as? String ?? ""
                        let tam = document.data()["tam"] as? Int ?? 0
                        let fecha = document.data()["fecha"] as? String ?? ""
                        
                        let docBar = db.collection("bares").document(idBar)

                        docBar.getDocument { [self] (document2, error2) in
                            if let document2 = document2, document2.exists {
                                let datos = document2.data()
                                let nuevoBar = self.docEnBar2(valor: datos!, id: document2.documentID)
                                
                                let nuevaReserva = ReservaModel(id: document.documentID, idUser: idUser, bar: nuevoBar, tam: tam, turno: turno, fecha: fecha)
                                
                                self.reservas.append(nuevaReserva)
                            } else {
                                print("Error al obtener reservas")
                            }
                        }
                    }
                }
        }
    }
    
    
    /// Eliminar la reserva de un bar
    /// - Parameter reserva: reserva a eliminar
    func eliminarReserva(reserva: ReservaModel){
        let db = Firestore.firestore()
        db.collection("reservas").document(reserva.id).delete()
        
        var bar = reserva.bar
        let tam = reserva.tam
        let turno = reserva.turno
        
        if reserva.fecha == fechaMañana {
            bar.capacidadTurno[fechaMañana]![turno]! += tam
            
            let campos: [String:Any] = ["capacidadTurno": bar.capacidadTurno]
            db.collection("bares").document(bar.id).updateData(campos){ (error) in
                if let error = error?.localizedDescription {
                    print("Error al cancelar reserva", error)
                } else {
                    print("Reserva cancelada correctamente")
                }
            }
        }
    }
    
    
    /// Obtener los bares en los cuales el usuario ha hecho una reserva
    func obtenerBaresConReservasUsuario(){
        let db = Firestore.firestore()
        guard let idUser = Auth.auth().currentUser?.uid else { return }
        
        db.collection("reservas").whereField("idUser", isEqualTo: idUser)
            .getDocuments(){ (querySnapshot, err) in
                if let err = err {
                    print("Error al obtener bares reservados del usuario: \(err)")
                } else {
                    self.bares.removeAll()
                    for document in querySnapshot!.documents {
                        let idBar = document.data()["idBar"] as? String ?? ""
                        let docBar = db.collection("bares").document(idBar)

                        docBar.getDocument { (document2, error2) in
                            if let document2 = document2, document2.exists {
                                let datos = document2.data()
                                let nuevoBar = self.docEnBar2(valor: datos!, id: document2.documentID)
                                var yaExiste = false
                                
                                for bar in self.bares {
                                    if bar.id == nuevoBar.id {
                                        yaExiste = true
                                    }
                                }
                                
                                if !yaExiste {
                                    self.bares.append(nuevoBar)
                                }
                            } else {
                                print("Error al obtener bares reservados")
                            }
                        }
                        
                    }
                }
        }
    }
    
    
    /// Eliminar un bar
    /// - Parameters:
    ///   - id: id del bar a eliminar
    ///   - imageURL: dirección de la imagen del bar a eliminar
    ///   - completion: para saber si se ha hecho correctamente
    func eliminarBar(id: String, imageURL: String, completion: @escaping (Bool) -> Void){
        let db = Firestore.firestore()
        db.collection("bares").document(id).delete()
        
        let storageImage = Storage.storage().reference(forURL: imageURL)
        storageImage.delete(completion: nil)
        completion(true)
    }
    
    
    /// Editar la información de un bar
    /// - Parameters:
    ///   - bar: Bar con la nueva información
    ///   - completion: para saber si se ha hecho bien
    func editarBar(bar: BarModel, completion: @escaping (Bool) -> Void){
        let db = Firestore.firestore()
        let campos: [String:Any] = ["nombre":bar.nombre, "descripcion":bar.descripcion,
                                    "tipo":bar.tipo, "capacidad": bar.capacidad, "lat": bar.lat, "long": bar.long]
        db.collection("bares").document(bar.id).updateData(campos){ (error) in
            if let error = error?.localizedDescription {
                print("Error al editar bar", error)
            } else {
                print("Edito correctamente el bar")
                completion(true)
            }
        }
    }
    
    
    /// Para editar un bar y su imagen
    /// - Parameters:
    ///   - bar: Bar con la nueva información
    ///   - imagen: nueva imagen
    ///   - completion: para saber si se ha hecho bien
    func editarBarConImagen(bar: BarModel, imagen: Data, completion: @escaping (Bool) -> Void){
        let storageImage = Storage.storage().reference(forURL: bar.dirImagen)
        storageImage.delete(completion: nil) 
        
        let storage = Storage.storage().reference()
        let nombrePortada = UUID()
        let directorio = storage.child("imagenes/\(nombrePortada)")
        let metadata = StorageMetadata()
        metadata.contentType = "image/png"
        
        directorio.putData(imagen, metadata: metadata){data, error in
            if error == nil {
                print("guardo la imagen")
                
                // Editamos primero la imagen y ahora el texto ya que la imagen tarda mas
                let db = Firestore.firestore()
                let campos: [String:Any] = ["nombre":bar.nombre, "descripcion":bar.descripcion,
                                            "tipo":bar.tipo, "capacidad": bar.capacidad, "lat": bar.lat, "long": bar.long, "dirImagen": String(describing: directorio)]
                db.collection("bares").document(bar.id).updateData(campos){ (error) in
                    if let error = error?.localizedDescription {
                        print("Error al editar bar", error)
                    } else {
                        print("Edito correctamente el bar")
                        completion(true)
                    }
                }
            } else {
                if let error = error?.localizedDescription {
                    print("error al subir la imagen en storage", error)
                } else {
                    print("error en la app al subir imagen")
                }
            }
        }
    }
    
    
    /// Obtener las reservas de un bar
    /// - Parameters:
    ///   - idBar: id del bar a buscar sus reservas
    ///   - completion: para saber si se ha hecho bien
    func obtenerReservasBar(idBar: String, completion: @escaping ([String:[Int:Int]]) -> Void){
        let db = Firestore.firestore()
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let result = formatter.string(from: date)
        var reservas: [String:[Int:Int]] = [:]
        
        db.collection("reservas")
            .whereField("idBar", isEqualTo: idBar)
            .whereField("fecha", isEqualTo: result)
            .getDocuments(){ (querySnapshot, err) in
                if let err = err {
                    print("Error al obtener reservas del bar: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let datos = document.data()
                        let tamReserva = datos["tam"] as? Int ?? 0
                        let turno = datos["turno"] as? String ?? ""
                        
                        if reservas[turno] == nil {
                            let hueco = [tamReserva:1]
                            reservas[turno] = hueco
                        } else {
                            if reservas[turno]![tamReserva] == nil {
                                reservas[turno]![tamReserva] = 1
                            } else {
                                reservas[turno]![tamReserva]! += 1
                            }
                        }
                    }
                    
                    completion(reservas)
                }
        }
    }
    
    
    /// Reservar una mesa
    /// - Parameters:
    ///   - tam: Tamaño de la mesa a reservar
    ///   - miBar: Bar donde hacer la reserva
    ///   - turno: turno donde hacer la reserva
    /// - Returns: Para saber si existe hueco o no
    func reservaMesa(tam: Int, miBar: BarModel, turno: String) -> Bool{
        var bar = miBar
        
        if (bar.capacidadTurno[fechaMañana]![turno]! >= tam) {
            bar.capacidadTurno[fechaMañana]![turno]! -= tam
        } else {
            return false
        }
        
        let db = Firestore.firestore()
        let campos: [String:Any] = ["capacidadTurno": bar.capacidadTurno]
        db.collection("bares").document(bar.id).updateData(campos){ (error) in
            if let error = error?.localizedDescription {
                print("Error al reservar bar", error)
            } else {
                print("Reserva realizada correctamente")
            }
        }
        
        var date = Date()
        date = Calendar.current.date(byAdding: .day, value: 1, to: date)!
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let result = formatter.string(from: date)
        
        guard let idUser = Auth.auth().currentUser?.uid else {return false}
        let campos2: [String:Any] = ["idUser": idUser, "idBar": bar.id, "tam": tam, "turno": turno, "fecha": result]
        db.collection("reservas").addDocument(data: campos2){ error in
            if let e = error?.localizedDescription {
                print("Error al reservar bar", e)
            } else {
                print("Reserva realizada correctamente")
            }
        }
        
        return true
    }
    
    
    /// Para obtener los bares por subcadena
    /// - Parameter nombreBuscado: subcadena buscada
    func obtenerBaresNombre(nombreBuscado: String){
        let db = Firestore.firestore()
        db.collection("bares").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error al obtener bares por nombre: \(err)")
                } else {
                    self.bares.removeAll()
                    for document in querySnapshot!.documents {
                        let nuevoBar = self.docEnBar(document: document)
                        
                        if nuevoBar.nombre.lowercased().contains(nombreBuscado.lowercased()){
                            let barGenerado = nuevoBar
                            let tam = UserDefaults.standard.integer(forKey: "numPersonas")
                            
                            if barGenerado.capacidadTurno[fechaMañana] != nil {
                                if barGenerado.capacidadTurno[fechaMañana]!["1"]! >= tam || barGenerado.capacidadTurno[fechaMañana]!["2"]! >= tam || barGenerado.capacidadTurno[fechaMañana]!["3"]! >= tam || barGenerado.capacidadTurno[fechaMañana]!["4"]! >= tam{
                                    self.bares.append(barGenerado)
                                }
                            } else {
                                var bar = barGenerado
                                let cap = bar.capacidad
                                
                                if bar.capacidadTurno[fechaMañana] == nil {
                                    let turnos = ["1":cap,"2":cap,"3":cap,"4":cap]
                                    bar.capacidadTurno[fechaMañana] = turnos
                                } else {
                                    bar.capacidadTurno[fechaMañana]!["1"] = cap
                                    bar.capacidadTurno[fechaMañana]!["2"] = cap
                                    bar.capacidadTurno[fechaMañana]!["3"] = cap
                                    bar.capacidadTurno[fechaMañana]!["4"] = cap
                                }
                                
                                self.bares.append(bar)
                            }
                        }
                    }
                }
        }
    }
    
    
    /// Para obtener los bares por tipo
    /// - Parameter tipo: tipo buscado
    func obtenerBaresTipo(tipo: String){
        let db = Firestore.firestore()
        db.collection("bares").whereField("tipo", isEqualTo: tipo)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error al obtener bares por tipo: \(err)")
                } else {
                    self.bares.removeAll()
                    for document in querySnapshot!.documents {
                        let barGenerado = self.docEnBar(document: document)
                        let tam = UserDefaults.standard.integer(forKey: "numPersonas")
                        
                        if barGenerado.capacidadTurno[fechaMañana] != nil {
                            if barGenerado.capacidadTurno[fechaMañana]!["1"]! >= tam || barGenerado.capacidadTurno[fechaMañana]!["2"]! >= tam || barGenerado.capacidadTurno[fechaMañana]!["3"]! >= tam || barGenerado.capacidadTurno[fechaMañana]!["4"]! >= tam{
                                self.bares.append(barGenerado)
                            }
                        } else {
                            var bar = barGenerado
                            let cap = bar.capacidad
                            
                            if bar.capacidadTurno[fechaMañana] == nil {
                                let turnos = ["1":cap,"2":cap,"3":cap,"4":cap]
                                bar.capacidadTurno[fechaMañana] = turnos
                            } else {
                                bar.capacidadTurno[fechaMañana]!["1"] = cap
                                bar.capacidadTurno[fechaMañana]!["2"] = cap
                                bar.capacidadTurno[fechaMañana]!["3"] = cap
                                bar.capacidadTurno[fechaMañana]!["4"] = cap
                            }
                            
                            self.bares.append(bar)
                        }
                    }
                }
        }
    }
    
    
    /// Distancia euclídea entre dos puntos
    /// - Parameters:
    ///   - latX: latitud del punto X
    ///   - longX: longitud del punto X
    ///   - latY: latitud del punto Y
    ///   - longY: longitud del punto Y
    /// - Returns: distancia
    func distanciaEntre(latX: Double, longX: Double, latY: Double, longY: Double) -> Double {
        return sqrt((latX - latY) * (latX - latY) + (longX - longY) * (longX - longY))
    }
    
    
    /// Para obtener los bares ordenados por cercanía al usuario
    /// - Parameters:
    ///   - userLat: latitud del usuario
    ///   - userLong: longitud del usuario
    func obtenerBaresDistancia(userLat: Double, userLong: Double){
        let db = Firestore.firestore()
        db.collection("bares").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error al obtener bares por distancia: \(err)")
                } else {
                    self.bares.removeAll()
                    for document in querySnapshot!.documents {
                        self.bares.append(self.docEnBar(document: document))
                    }
                    
                    var nuevoBares = [BarModel]()
                    var distanciaBares = [Double]()
                    var i = 0
                    
                    while (i < self.bares.count){
                        var bar = self.bares[i]
                        let tam = UserDefaults.standard.integer(forKey: "numPersonas")
                        
                        if bar.capacidadTurno[fechaMañana] != nil {
                            if bar.capacidadTurno[fechaMañana]!["1"]! >= tam || bar.capacidadTurno[fechaMañana]!["2"]! >= tam || bar.capacidadTurno[fechaMañana]!["3"]! >= tam || bar.capacidadTurno[fechaMañana]!["4"]! >= tam{
                                var j = 0
                                let valor = self.distanciaEntre(latX: userLat, longX: userLong, latY: bar.lat, longY: bar.long)
                                
                                while (j < nuevoBares.count && distanciaBares[j] < valor){
                                    j += 1
                                }
                                
                                distanciaBares.insert(valor, at: j)
                                nuevoBares.insert(bar, at: j)
                            }
                        } else {
                            let cap = bar.capacidad
                            
                            let turnos = ["1":cap,"2":cap,"3":cap,"4":cap]
                            bar.capacidadTurno[fechaMañana] = turnos
                            
                            var j = 0
                            let valor = self.distanciaEntre(latX: userLat, longX: userLong, latY: bar.lat, longY: bar.long)
                            
                            while (j < nuevoBares.count && distanciaBares[j] < valor){
                                j += 1
                            }
                            
                            distanciaBares.insert(valor, at: j)
                            nuevoBares.insert(bar, at: j)
                        }
                        
                        i += 1
                    }

                    self.bares = nuevoBares
                }
        }
    }
}

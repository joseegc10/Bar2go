var entities = [{
  "id": 1,
  "typeString": "class",
  "methods": [
    {
  "name": "setUpWithError() throws",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tearDownWithError() throws",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "testExample() throws",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "testPerformanceExample() throws",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Bar2goTests",
  "superClass": 59
},{
  "id": 2,
  "typeString": "class",
  "properties": [
    {
  "name": "let manager",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var locations: CLLocation?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    61,
    62
  ],
  "name": "UserLocation",
  "superClass": 60
},{
  "id": 3,
  "typeString": "class",
  "properties": [
    {
  "name": "var data : Data?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var imageURL : String",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "load()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(imageURL: String)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    61
  ],
  "name": "ImagenViewModel"
},{
  "id": 4,
  "typeString": "class",
  "properties": [
    {
  "name": "var synthesizer",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var utterance: AVSpeechUtterance?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "speak(speech: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "disableAVSession()",
  "type": "instance",
  "accessLevel": "private"
}
  ],
  "protocols": [
    61
  ],
  "name": "SpeechViewModel"
},{
  "id": 5,
  "typeString": "class",
  "properties": [
    {
  "name": "var conexion : ImagePicker",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "imagePickerControllerDidCancel(_ picker: UIImagePickerController)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(conexion: ImagePicker)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Coordinator",
  "superClass": 60
},{
  "id": 6,
  "typeString": "struct",
  "properties": [
    {
  "name": "var show : Bool @Binding",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var image : Data",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var source : UIImagePickerController.SourceType",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "makeCoordinator() -> ImagePicker.Coordinator",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "makeUIViewController(context: Context) -> some UIImagePickerController",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "updateUIViewController(_ uiViewController: UIViewControllerType, context: Context)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ImagePicker",
  "superClass": 63,
  "containedEntities": [
    5
  ]
},{
  "id": 7,
  "typeString": "enum",
  "properties": [
    {
  "name": "var id: Int",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "cases": [
    {
  "name": "login"
},
    {
  "name": "logueado var id"
}
  ],
  "name": "Estado",
  "superClass": 64
},{
  "id": 8,
  "typeString": "class",
  "properties": [
    {
  "name": "var bares",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var reservas",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var estado: Estado",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "login(email: String, password: String, completion: @escaping (_ done: Bool) -> Void)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "register(email: String, password: String, completion: @escaping (_ done: Bool) -> Void)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "aniadeBar(miBar: BarModel, imagen: Data, completion: @escaping (Bool) -> Void)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "docEnBar(document: QueryDocumentSnapshot) -> BarModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "docEnBar2(valor: [String:Any], id: String) -> BarModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "obtenerBares()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "obtenerBaresUsuario()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "obtenerReservasUsuario()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "eliminarReserva(reserva: ReservaModel)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "obtenerBaresConReservasUsuario()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "eliminarBar(id: String, imageURL: String, completion: @escaping (Bool) -> Void)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "editarBar(bar: BarModel, completion: @escaping (Bool) -> Void)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "editarBarConImagen(bar: BarModel, imagen: Data, completion: @escaping (Bool) -> Void)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "obtenerReservasBar(idBar: String, completion: @escaping ([String:[Int:Int]]) -> Void)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "reservaMesa(tam: Int, miBar: BarModel, turno: String) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "obtenerBaresNombre(nombreBuscado: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "obtenerBaresTipo(tipo: String)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "distanciaEntre(latX: Double, longX: Double, latY: Double, longY: Double) -> Double",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "obtenerBaresDistancia(userLat: Double, userLong: Double)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    61
  ],
  "name": "BarViewModel"
},{
  "id": 9,
  "typeString": "enum",
  "protocols": [
    66
  ],
  "cases": [
    {
  "name": "pasta"
},
    {
  "name": "pescado"
},
    {
  "name": "carne"
},
    {
  "name": "rapida"
},
    {
  "name": "rustico"
},
    {
  "name": "chino"
}
  ],
  "name": "TipoBar",
  "superClass": 65
},{
  "id": 10,
  "typeString": "struct",
  "properties": [
    {
  "name": "var id: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var idUser: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var bar: BarModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tam: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var turno: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var fecha: String",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ReservaModel",
  "superClass": 64
},{
  "id": 11,
  "typeString": "struct",
  "properties": [
    {
  "name": "var id: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nombre: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var descripcion: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var capacidad: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var capacidadTurno: [String:[String:Int]]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var lat: Double",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var long: Double",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tipo: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var idUser: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var dirImagen: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var imagen: Data",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "BarModel",
  "superClass": 64
},{
  "id": 12,
  "typeString": "struct",
  "properties": [
    {
  "name": "let imagenAlternativa",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var imageLoader: ImagenViewModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let imageURL: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let anchura: CGFloat",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let altura: CGFloat",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ImagenStorageView",
  "superClass": 67
},{
  "id": 13,
  "typeString": "struct",
  "properties": [
    {
  "name": "let id: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var title: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var selected: Bool",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init (id: Int, title: String, selected: Bool)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Tipo",
  "superClass": 68
},{
  "id": 14,
  "typeString": "struct",
  "properties": [
    {
  "name": "var Categories: [Tipo]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var lastIndex: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var selectedTitle: String @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var currentIndex: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var ns",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var index",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let tipoInicial: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init(selectedTitle: Binding<String>, tipoInicial: String)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "TiposPickerView",
  "superClass": 67
},{
  "id": 15,
  "typeString": "struct",
  "properties": [
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "MyProgressView",
  "superClass": 67
},{
  "id": 16,
  "typeString": "struct",
  "methods": [
    {
  "name": "makeBody(configuration: Configuration) -> some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "DarkBlueShadowProgressViewStyle",
  "superClass": 69
},{
  "id": 17,
  "typeString": "struct",
  "properties": [
    {
  "name": "var index : String @Binding",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var sacarMenu : Bool @EnvironmentObject",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var login: BarViewModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "MyNavigationBar",
  "superClass": 67
},{
  "id": 18,
  "typeString": "struct",
  "properties": [
    {
  "name": "let id: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var title: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var selected: Bool",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init (id: Int, title: String, selected: Bool)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Language",
  "superClass": 68
},{
  "id": 19,
  "typeString": "struct",
  "properties": [
    {
  "name": "var Categories: [Language]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var lastIndex: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var selectedIndex: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var selectedTitle: String @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var currentIndex: Int",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var ns",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init(selectedTitle: Binding<String>)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "LanguagePickerView",
  "superClass": 67
},{
  "id": 20,
  "typeString": "struct",
  "properties": [
    {
  "name": "var text: String @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var isEditing",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "BuscadorBar",
  "superClass": 67
},{
  "id": 21,
  "typeString": "struct",
  "properties": [
    {
  "name": "let id",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let name: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let latitude: Double",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let longitude: Double",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var coordinate: CLLocationCoordinate2D",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Place",
  "superClass": 64
},{
  "id": 22,
  "typeString": "struct",
  "properties": [
    {
  "name": "var bar: BarModel @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var places: [Place]",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var region",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var activeSheet: ActiveSheet? @Binding",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var activeSheet2: ActiveSheet2?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "cambiaLocalizacion()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "MostrarUbicacion",
  "superClass": 67
},{
  "id": 23,
  "typeString": "class",
  "properties": [
    {
  "name": "var parent: AgregarUbicacion",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "mapViewDidChangeVisibleRegion(_ mapView: MKMapView)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "init(_ parent: AgregarUbicacion)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Coordinator",
  "superClass": 60
},{
  "id": 24,
  "typeString": "struct",
  "properties": [
    {
  "name": "var centerCoordinate: CLLocationCoordinate2D",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "makeUIView(context: Context) -> MKMapView",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "updateUIView(_ view: MKMapView, context: Context)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "makeCoordinator() -> Coordinator",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "AgregarUbicacion",
  "superClass": 70,
  "containedEntities": [
    23
  ]
},{
  "id": 25,
  "typeString": "struct",
  "properties": [
    {
  "name": "var title: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var subTitle: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var imageName: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "UtilidadApp",
  "superClass": 67
},{
  "id": 26,
  "typeString": "struct",
  "properties": [
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "UtilidadesApp",
  "superClass": 67
},{
  "id": 27,
  "typeString": "struct",
  "properties": [
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "TituloBienvenida",
  "superClass": 67
},{
  "id": 28,
  "typeString": "struct",
  "properties": [
    {
  "name": "var index : String @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var numPersonas: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let num",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Inicio",
  "superClass": 67
},{
  "id": 29,
  "typeString": "struct",
  "properties": [
    {
  "name": "var index : String @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var numPersonas: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let num",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Inicio2",
  "superClass": 67
},{
  "id": 30,
  "typeString": "struct",
  "methods": [
    {
  "name": "body(content: Content) -> some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ButtonModifier",
  "superClass": 71
},{
  "id": 34,
  "typeString": "struct",
  "properties": [
    {
  "name": "var email",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var password",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var login",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var estado: BarViewModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "LoginView",
  "superClass": 67
},{
  "id": 35,
  "typeString": "struct",
  "properties": [
    {
  "name": "var bares",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var index : String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nombre: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tipo: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var barEditar: BarModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Home",
  "superClass": 67
},{
  "id": 36,
  "typeString": "struct",
  "properties": [
    {
  "name": "var index",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var sacarMenu",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var widthMenu",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var bar: BarModel",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var activeSheet: ActiveSheet?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var login: BarViewModel @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var barEditar: BarModel",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var antiguoIndex: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ContentView",
  "superClass": 67
},{
  "id": 38,
  "typeString": "enum",
  "properties": [
    {
  "name": "var id: Int",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "cases": [
    {
  "name": "ubicacion"
},
    {
  "name": "estado var id"
}
  ],
  "name": "ActiveSheet",
  "superClass": 64
},{
  "id": 39,
  "typeString": "enum",
  "properties": [
    {
  "name": "var id: Int",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "cases": [
    {
  "name": "nombre"
},
    {
  "name": "tipo"
},
    {
  "name": "distancia"
},
    {
  "name": "baresUsuario"
},
    {
  "name": "reservasUsuario var id"
}
  ],
  "name": "TipoBusqueda",
  "superClass": 64
},{
  "id": 40,
  "typeString": "struct",
  "properties": [
    {
  "name": "var bares",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var activeSheet: ActiveSheet?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var activeSheet2: ActiveSheet2?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tipoBusqueda: TipoBusqueda?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nombre: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tipo: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var index: String @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var miBar",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var userLocation",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var cancelable: AnyCancellable? @State",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var region",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var barEditar: BarModel @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var reservas: [String:[Int:Int]]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var speech",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let idUser",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let texto: String",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "showLocation()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "obtenerBares()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ListaBares",
  "superClass": 67
},{
  "id": 41,
  "typeString": "struct",
  "methods": [
    {
  "name": "body(content: Content) -> some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "CardModifier",
  "superClass": 71
},{
  "id": 42,
  "typeString": "struct",
  "properties": [
    {
  "name": "var bar: BarModel @Binding",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var activeSheet: ActiveSheet? @Binding",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var miBar: BarModel @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var confirmaReserva1",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var confirmaReserva2",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var confirmaReserva3",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var confirmaReserva4",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var userLocation",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var cancelable: AnyCancellable? @State",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var region",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var prueba: Data?",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var speech: SpeechViewModel @StateObject",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var bares: BarViewModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var nombre: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tipo: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tipoBusqueda: TipoBusqueda?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let num",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let correcto",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let num",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let correcto",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let num",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let correcto",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let num",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let correcto",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "showLocation()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "obtenerBares()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "CardBar",
  "superClass": 67
},{
  "id": 43,
  "typeString": "enum",
  "properties": [
    {
  "name": "var id: Int",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "cases": [
    {
  "name": "crear"
},
    {
  "name": "editar var id"
}
  ],
  "name": "TipoFormularioBar",
  "superClass": 64
},{
  "id": 44,
  "typeString": "struct",
  "properties": [
    {
  "name": "var bar: BarModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let tiposPosibles: [String]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tipoElegido: [String:Bool]",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var bares",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var activeSheet : ActiveSheet? @Binding",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var index : String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var tipoFormulario: TipoFormularioBar @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var elegirUbicacion",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var elegirCapacidad",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var alerta",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var capacidad: String",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var centerCoordinate",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var imageData : Data",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var mostrarMenu",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var imagePicker",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var source : UIImagePickerController.SourceType",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var antiguoIndex: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let newLocation",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let cap",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let idUser",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "FormularioBar",
  "superClass": 67
},{
  "id": 45,
  "typeString": "struct",
  "properties": [
    {
  "name": "var reserva: ReservaModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let turnoHoras",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var actualiza: Bool @Binding",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var activeSheet: ActiveSheet2? @State",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var cancelar",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var bares",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var miReserva: ReservaModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ReservaCardBar",
  "superClass": 67
},{
  "id": 46,
  "typeString": "enum",
  "properties": [
    {
  "name": "var id: Int",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "cases": [
    {
  "name": "ubicacion var id"
}
  ],
  "name": "ActiveSheet2",
  "superClass": 64
},{
  "id": 47,
  "typeString": "struct",
  "properties": [
    {
  "name": "var bares",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var miReserva: ReservaModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var actualiza: Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var activeSheet: ActiveSheet?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var activeSheet2: ActiveSheet2?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ListaReservas",
  "superClass": 67
},{
  "id": 48,
  "typeString": "struct",
  "properties": [
    {
  "name": "var huecosOcupados : [Int:Int]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var turno: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let ocupado: Int",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "EstadoBar",
  "superClass": 67
},{
  "id": 49,
  "typeString": "struct",
  "properties": [
    {
  "name": "var huecosOcupados : [Int:Int]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let tam: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ContadorMesas",
  "superClass": 67
},{
  "id": 50,
  "typeString": "struct",
  "properties": [
    {
  "name": "var tipo: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let miTipo: String",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "makeBody(configuration: Self.Configuration) -> some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "TipoBarStyle",
  "superClass": 72
},{
  "id": 51,
  "typeString": "struct",
  "properties": [
    {
  "name": "var bares",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var index: String @Binding",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var barEditar: BarModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "BusquedaCercania",
  "superClass": 67
},{
  "id": 52,
  "typeString": "struct",
  "properties": [
    {
  "name": "var bares",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "ReservasUsuario",
  "superClass": 67
},{
  "id": 53,
  "typeString": "struct",
  "properties": [
    {
  "name": "var tipo: String",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var index: String @StateObject",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var bares",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let tiposPosibles: [String]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var barEditar: BarModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "BusquedaTipo",
  "superClass": 67
},{
  "id": 54,
  "typeString": "struct",
  "properties": [
    {
  "name": "var bares",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var index: String @Binding",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var barEditar: BarModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "BaresUsuario",
  "superClass": 67
},{
  "id": 55,
  "typeString": "struct",
  "properties": [
    {
  "name": "var nombre: String",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var index: String @StateObject",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var bares",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var pideBares",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var miBar: BarModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var isEditing",
  "type": "instance",
  "accessLevel": "private"
},
    {
  "name": "var barEditar: BarModel",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some View",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "BusquedaNombre",
  "superClass": 67
},{
  "id": 56,
  "typeString": "class",
  "methods": [
    {
  "name": "application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "AppDelegate",
  "superClass": 60
},{
  "id": 57,
  "typeString": "struct",
  "properties": [
    {
  "name": "var appDelegate",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var body: some Scene",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let login",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Bar2goApp",
  "superClass": 73
},{
  "id": 58,
  "typeString": "class",
  "methods": [
    {
  "name": "setUpWithError() throws",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tearDownWithError() throws",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "testExample() throws",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "testLaunchPerformance() throws",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "Bar2goUITests",
  "superClass": 59
},{
  "id": 59,
  "typeString": "class",
  "name": "XCTestCase"
},{
  "id": 60,
  "typeString": "class",
  "name": "NSObject"
},{
  "id": 61,
  "typeString": "protocol",
  "name": "ObservableObject"
},{
  "id": 62,
  "typeString": "protocol",
  "name": "CLLocationManagerDelegate"
},{
  "id": 63,
  "typeString": "class",
  "name": "UIViewControllerRepresentable"
},{
  "id": 64,
  "typeString": "class",
  "name": "Identifiable"
},{
  "id": 65,
  "typeString": "class",
  "name": "String"
},{
  "id": 66,
  "typeString": "protocol",
  "name": "CaseIterable"
},{
  "id": 67,
  "typeString": "class",
  "name": "View",
  "extensions": [
    31,
    37
  ]
},{
  "id": 68,
  "typeString": "class",
  "name": "Hashable"
},{
  "id": 69,
  "typeString": "class",
  "name": "ProgressViewStyle"
},{
  "id": 70,
  "typeString": "class",
  "name": "UIViewRepresentable"
},{
  "id": 71,
  "typeString": "class",
  "name": "ViewModifier"
},{
  "id": 72,
  "typeString": "class",
  "name": "ButtonStyle"
},{
  "id": 73,
  "typeString": "class",
  "name": "App"
},{
  "id": 74,
  "typeString": "class",
  "name": "Text",
  "extensions": [
    32
  ]
},{
  "id": 75,
  "typeString": "class",
  "name": "Color",
  "extensions": [
    33
  ]
},{
  "id": 31,
  "typeString": "extension",
  "methods": [
    {
  "name": "customButton() -> ModifiedContent<Self, ButtonModifier>",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "extendedEntityName": "View"
},{
  "id": 32,
  "typeString": "extension",
  "methods": [
    {
  "name": "customTitleText() -> Text",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "extendedEntityName": "Text"
},{
  "id": 33,
  "typeString": "extension",
  "properties": [
    {
  "name": "var mainColor",
  "type": "type",
  "accessLevel": "internal"
}
  ],
  "extendedEntityName": "Color"
},{
  "id": 37,
  "typeString": "extension",
  "methods": [
    {
  "name": "hideKeyboard()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "extendedEntityName": "View"
}] 
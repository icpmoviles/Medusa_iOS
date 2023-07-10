//
//  ContentView.swift
//  Medusa
//
//  Created by felipecambas on 3/5/23.
//

import SwiftUI

struct MainLogin: View {
    
    @State var username : String = ""
    @State var password : String = ""
    @State private var recordar : Bool = false
    private var perseoAccountList = PerseoUtils.obtencionKeyChain()
    
    var body: some View {
        VStack {
            
            Image("CascoPerseo")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .padding(.bottom, 32)
            
            
            
            Group{
                HStack(){
                    Text("Usuario")
                    TextField("Usuario", text: $username)
                        .multilineTextAlignment(.trailing)
                }
                
                Divider()
                
                HStack(){
                    Text("Contraseña")
                        
                    SecureInputView("Contraseña", text: $password)
                        .padding(8)
                        .multilineTextAlignment(.trailing)
                }
                
                Divider()
                
                Toggle(isOn: $recordar) {
                    Text("Recordar datos de acceso")
                }
                .padding(.top, 20)
            }
            
            
            Button(action: {
                doLogin()
            }){
                Text("Acceder")
                    .foregroundColor(.white)
            }
            .frame(minWidth:0, maxWidth: .infinity, maxHeight: 50, alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(username == "" && password == "" ? Color("Primary1") : Color("Primary1"))
            )
            .padding(.horizontal)
            .padding(.top, 80)
        }
        .padding()
        .onAppear(perform: mostrarCuentasPerseo)
    }
    
    private func mostrarCuentasPerseo() {
        if (perseoAccountList.accountsList.count > 1) {
            // todo: mostrar dialogo con las cuentas disponibles
        } else if (perseoAccountList.accountsList.count == 1) {
            username = perseoAccountList.accountsList[0].user
            password = perseoAccountList.accountsList[0].pass
        }
    }
    
    private func doLogin() {
        Task {
            let request : LoginRequest = LoginRequest()
            request.u = username
            request.p = password
            
            let response = await RepoLogin().doLogin(loginRequest: request)
            
            if (response != nil) {
                print("Accedo Tengo: \(response?.access_token)")
                
                PerseoUtils.accesoKeyChain(perseoAccountList: perseoAccountList, user: username, pass: password)
            }else{
                print("Oh oh, algo ha ido mal")
            }
            
        }
        
        //RepoLogin().doLogin(loginRequest: request)
        
        //goToMenu.toggle()
    }
}

struct MainLogin_Previews: PreviewProvider {
    static var previews: some View {
        MainLogin()
    }
}

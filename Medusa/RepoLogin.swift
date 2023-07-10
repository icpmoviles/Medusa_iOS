//
//  RepoLogin.swift
//  Medusa
//
//  Created by felipecambas on 3/5/23.
//

import Foundation


class RepoLogin {
    
    func doLogin(loginRequest : LoginRequest) async ->  LoginResponse? {
        guard let encoded = try? JSONEncoder().encode(loginRequest) else {
            print("Failed to encode order")
            return nil
        }
        
        let url = URL(string:  "\(Constantes.URL_BASE + Constantes.EDP_LOGIN)")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        do{
            
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let dataResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
            //let dataResponse = try! JSONDecoder().decode(LoginResponse.self, from: data)
            
            //let loginResponse : LoginResponse = try! JSONDecoder().decode(LoginResponse.self, from: Data(dataResponse.data.jsonOut!.utf8))
            //return loginResponse
            return dataResponse
        } catch(let exception) {
            print("Exception: \(exception.localizedDescription)")
        }
        
        return nil
    }
    
    
    func doLogin2(loginRequest : LoginRequest, completion: @escaping(Result<LoginResponse?, NetworkError>) -> Void) async {
        guard let json = try? JSONEncoder().encode(loginRequest) else {
            return
        }
        await RepoBase().makeRequest(json: json, url: "\(Constantes.URL_BASE + Constantes.EDP_LOGIN)", method: .post){
            result in
            
            switch(result) {
            case .success(let data):
                print("Todo perita, data: \(data)")
                
                //guard let dataR = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                //    let error: Error = LocalizedError()
                //    error.localizedDescription = ""
                //    completion(.failure()
                //}
                
                //completion(.success(dataR))
                
                
                /*do {
                    let dataResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    
                }catch(let exception){
                    print("Exception: \(exception.localizedDescription)")
                }*/
            case .failure(let error) :
                print("Error: \(error.localizedDescription) ")
            }
        }
        
    }
}

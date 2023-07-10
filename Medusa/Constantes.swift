//
//  Constantes.swift
//  Medusa
//
//  Created by felipecambas on 3/5/23.
//

import Foundation

class Constantes {
    
    //=========================================================================================
    
    // ██╗███╗   ███╗██████╗  ██████╗ ██████╗ ████████╗ █████╗ ███╗   ██╗████████╗███████╗
    // ██║████╗ ████║██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝██╔══██╗████╗  ██║╚══██╔══╝██╔════╝
    // ██║██╔████╔██║██████╔╝██║   ██║██████╔╝   ██║   ███████║██╔██╗ ██║   ██║   █████╗
    // ██║██║╚██╔╝██║██╔═══╝ ██║   ██║██╔══██╗   ██║   ██╔══██║██║╚██╗██║   ██║   ██╔══╝
    // ██║██║ ╚═╝ ██║██║     ╚██████╔╝██║  ██║   ██║   ██║  ██║██║ ╚████║   ██║   ███████╗
    // ╚═╝╚═╝     ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝
    
    public static let IS_DEBUG = true
    
    //=========================================================================================
    
    
    /// - Desarrollo
    public static let URL_DESARROLLO = "https://ticketingicp.icp.es:9013"
    public static let URL_ACTUALIZACION_DESARROLLO = "http://integracion.icp.es/icp_app_store/#/detail/eyJhbGciOiJIUzI1NiI"
    /// - Produccion
    public static let URL_PRODUCCION = "https://ticketingicp.icp.es:9013"
    public static let URL_ACTUALIZACION_PRODUCCION = "https://logistica3.icp.es/ICP_app_store/#/detail/eyJhbGciOiJIUzI1NiI"
    /// - Declaracion URLS
    public static let URL_BASE = IS_DEBUG ? URL_DESARROLLO : URL_PRODUCCION
    public static let URL_ACTUALIZACION = IS_DEBUG ? URL_ACTUALIZACION_DESARROLLO : URL_ACTUALIZACION_PRODUCCION
    
    
    public static let packageName : String = "es.icp.agis.generico"
    
    
    public static let idUsuario : Int = -1
    public static let idAgi : Int = 0
    public static let idAgiPadre : Int = 0
    
    /// Endpoints
    public static let EDP_LOGIN = "/icpsec/Login"
    
    
    /// Perfiles de AGIS
    public static let PERFIL_DESCONOCIDO = -1
    public static let PERFIL_ICP = 1
    public static let PERFIL_CONTRATAS = 2
    public static let PERFIL_TECNICOS = 3
    public static let PERFIL_VISUALIZACION = 4
    
    public static let SCL_PERFIL_ICP = "ICP"
    public static let SCL_PERFIL_ALMACEN = "A"
    public static let SCL_PERFIL_SUBALMACEN = "S"
    public static let SCL_PERFIL_TECNICO = "T"
    
    
    
    public static let OP_INSTALACION = 0
    public static let OP_DESINSTALACION = 1
}

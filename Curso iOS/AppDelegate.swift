//
//  AppDelegate.swift
//  Curso iOS
//
//  Created by Fatima Ramirez on 13/11/23.
// APP DELEGATE:
// PRIMERA INSTANCIA CUANDO CORRES UNA APP

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow? // pantalla del iphone

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // crear navigation: lugar donde se almacenan las pantallas // linea que se ve en todas las pantallas que se van haciendo
        let navigation = UINavigationController()
        // tamano a pantalla
        window = UIWindow(frame: UIScreen.main.bounds) // pantalla tamano a todos los telefonos
        //comunicacion de navigation inicial a pantalla
        window?.rootViewController = navigation // proxima vista va a ser la vista en toda la navegacion
        
        // parametros de navegacion
        window?.makeKeyAndVisible()
        navigation.isNavigationBarHidden = false // mostrar o no el boton para regresar
        
        // conexion a modulo inicializador
        let x = HomeMain.createModule(navigation: navigation)
        navigation.pushViewController(x, animated: true)
        return true
    }

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}


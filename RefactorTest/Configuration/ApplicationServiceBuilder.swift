//
//  ApplicationServiceBuilder.swift
//  RefactorTest
//
//  Created by vinhton on 5/10/25.
//

import UIKit
import Swinject

class ApplicationServiceBuilder {

    fileprivate struct Static {
        static var sharedContainer: Container?
    }

    /**
     This is a singleton container.
     Some services should be shared across application
     ### Usage Example to register a service: ###
     After: Static.sharedContainer = Container { container in
     
     add:
     
     container.register(YourServiceName.self) { r in
     return YourServiceNameDefault()
     }
     ````
     container.register(NetworkClient.self) { r in
     return NetworkClientDefault()
     }
     
     ````
     */
    static var defaultContainer: Container {
        Static.sharedContainer = Container { container in
            container.register(W3WService.self) { _ in
                return W3WServiceDefault()
            }
        }
        return Static.sharedContainer!
    }
}

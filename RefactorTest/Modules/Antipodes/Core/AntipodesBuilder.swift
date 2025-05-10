//
//  AntipodesBuilder.swift
//  RefactorTest
//
//  Created by TonThatVinh on 10/05/2025.
//  Copyright © 2025 W3W. All rights reserved.
//

import UIKit
import Swinject

protocol AntipodesBuilder {
  func buildAntipodesViewController() -> AntipodesViewController!
}

class AntipodesDefaultBuilder: AntipodesBuilder {
  
    let container = Container(parent: ApplicationServiceBuilder.defaultContainer)
  
  func buildAntipodesViewController() -> AntipodesViewController! {
    
    container.register(AntipodesInteractor.self) { r in
        AntipodesInteractorImp(w3wService: r.resolve(W3WService.self)!) //Add service
    }
    
    container.register(AntipodesViewController.self) { _ in
      
      AntipodesViewController(nibName: String(describing:AntipodesViewController.self), bundle: Bundle.main)
      
    }.initCompleted { r, h in
      
      h.presenter = r.resolve(AntipodesPresenter.self)
    }
    
    container.register(AntipodesRouter.self) { c in
      let router = AntipodesRouterImp()
      router.viewController = c.resolve(AntipodesViewController.self)!
      return router
    }
    
    container.register(AntipodesPresenter.self) { c in
      AntipodesPresenterImp(view: c.resolve(AntipodesViewController.self)!,
        interactor: c.resolve(AntipodesInteractor.self)!,
        router: c.resolve(AntipodesRouter.self)!)
    }
    
    return container.resolve(AntipodesViewController.self)!
  }
  
  deinit {
    container.removeAll()
  }
}

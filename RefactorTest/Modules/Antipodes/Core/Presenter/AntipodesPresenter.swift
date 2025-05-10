//
//  AntipodesPresenter.swift
//  RefactorTest
//
//  Created by TonThatVinh on 10/05/2025.
//  Copyright © 2025 W3W. All rights reserved.
//

import Foundation

protocol AntipodesPresenter {
}

class AntipodesPresenterImp: AntipodesPresenter {

    weak var view: AntipodesView!
    var interactor: AntipodesInteractor!
    var router: AntipodesRouter!

    init(view: AntipodesView, interactor: AntipodesInteractor, router: AntipodesRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

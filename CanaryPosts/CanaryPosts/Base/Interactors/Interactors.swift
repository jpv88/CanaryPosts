//
//  Interactors.swift
//  CanaryPosts
//
//  Created by Jared Perez Vega on 27/7/21.
//

import Foundation

class Interactor {
    
    init() {}
    
    func execute() async throws { fatalError("Execute must be implemented!") }
}

class OutputInteractor<Output> {
    
    init() {}
    
    func execute() async throws -> Output { fatalError("Execute must be implemented!") }
}

class InputInteractor<Input> {
    
    init() {}
    
    func execute(input: Input) async throws { fatalError("Execute must be implemented!") }
}

class InOutInteractor<Input, Output> {
    
    init() {}
    
    func execute(input: Input) async throws -> Output { fatalError("Execute must be implemented!") }
}

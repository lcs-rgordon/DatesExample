//
//  DateListViewModel.swift
//  DatesExample
//
//  Created by Russell Gordon on 2024-06-12.
//

import Foundation

@Observable
class DateListViewModel {
    
    // MARK: Stored properties
    
    // Tracks a list of names provided by the user, along with a date they picked
    var people: [Person] = []
    
    // MARK: Initializer(s)
    init() {
        Task {
            try await getPeople()
        }
    }
    
    // MARK: Functions
    func getPeople() async throws {
        
        do {
            
            let results: [Person] = try await supabase
                .from("person")
                .select()
                .execute()
                .value
            
            self.people = results
            
        } catch {
            
            debugPrint(error)
            
        }
        
    }
    
}

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
                .order("id", ascending: false)
                .execute()
                .value
            
            self.people = results
            
        } catch {
            
            debugPrint(error)
            
        }
        
    }
    
    func addPerson(firstName: String, providedDate: Date) {
        
        Task {
            
            // Add a new person and a date they selected
            let newPerson = Person(
                firstName: firstName,
                providedDate: providedDate
            )
            
            // Write it to the database
            do {
                
                // Actually write to the 'person' table
                try await supabase
                    .from("person")
                    .insert(newPerson)
                    .execute()
                
                // New refresh the list of people
                try await getPeople()
                
            } catch {
                debugPrint(error)
            }
            
        }
        
    }
    
}

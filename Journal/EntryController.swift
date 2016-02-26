//
//  EntryController.swift
//  Journal
//
//  Created by Caleb Hicks on 10/1/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

//class EntryController {
//    
//    private let entriesKey = "entries"
//    
//    static let sharedController = EntryController()
//    
//    var entries: [Entry]
//    
//    init() {
//        
//        self.entries = []
//        
//        self.loadFromPersistentStorage()
//    }
//    
//    func addEntry(entry: Entry) {
//        
//        entries.append(entry)
//        
//        //self.saveToPersistentStorage()
//    }
//    
//    func removeEntry(entry: Entry) {
//        
//        if let entryIndex = entries.indexOf(entry) {
//            entries.removeAtIndex(entryIndex)
//            
//        }
//    }
//    
//    func loadFromPersistentStorage() {
//        
//        let entryDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(entriesKey) as? [Dictionary<String, AnyObject>]
//
//        if let entryDictionaries = entryDictionariesFromDefaults {
//        
//            self.entries = entryDictionaries.map({Entry(dictionary: $0)!})
//        }
//    }
//    
//    func saveToPersistentStorage() {
//        
//        let entryDictionaries = self.entries.map({$0.dictionaryCopy()})
//        
//        NSUserDefaults.standardUserDefaults().setObject(entryDictionaries, forKey: entriesKey)
//    }
//    
//}

class EntryController {

	private let entriesKey = "entries"

	static let sharedController = EntryController()

	var entries: [Entry] {
		let entryDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(entriesKey) as? [Dictionary<String, AnyObject>]

		if let entryDictionaries = entryDictionariesFromDefaults {
			return entryDictionaries.map({Entry(dictionary: $0)!})
		} else {
			return []
		}
	}

	func addEntry(entry: Entry) {

		var scratch = self.entries
		scratch.append(entry)

		self.saveToPersistentStorage(scratch)
	}

	func removeEntry(entry: Entry) {

		var scratch = self.entries
		scratch.append(entry)
		saveToPersistentStorage(scratch)
	}

	func saveToPersistentStorage(newEntries: [Entry]) {

		let entryDictionaries = newEntries.map({$0.dictionaryCopy()})

		NSUserDefaults.standardUserDefaults().setObject(entryDictionaries, forKey: entriesKey)
	}

}
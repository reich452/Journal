//
//  FirebaseController.swift
//  Journal
//
//  Created by Andrew Madsen on 11/8/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation
import Firebase

class FirebaseController {
	static let base = Firebase(url: "https://burning-torch-2992.firebaseio.com")
	static let entryBase = base.childByAppendingPath("entries")
}
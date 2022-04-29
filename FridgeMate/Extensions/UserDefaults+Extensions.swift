//
//  UserDefaults+Extensions.swift
//  FridgeMate
//
//  Created by Leo Espinal on 4/28/22.
//

import Foundation

extension UserDefaults {
	static func storeValue<T>(_ value: T, forKey key: String) {
		UserDefaults.standard.setValue(value, forKey: key)
	}

	static func retrieveValue(using key: String) -> Any? {
		UserDefaults.standard.value(forKey: key)
	}
}

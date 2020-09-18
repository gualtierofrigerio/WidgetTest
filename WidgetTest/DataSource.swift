//
//  DataSource.swift
//  WidgetTest
//
//  Created by Gualtiero Frigerio on 18/09/2020.
//

import Foundation

class DataSource {
    func getRecordToShow() -> Record {
        let defaults = UserDefaults.init(suiteName: "group.com.gfrigerio.WidgetTest")
        defaults?.synchronize()
        let text = defaults?.value(forKey: "Text") as? String ?? "No value read"
        
        return Record(color: .blue, text: text)
    }
}

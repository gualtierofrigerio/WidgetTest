//
//  DataSource.swift
//  WidgetTest
//
//  Created by Gualtiero Frigerio on 18/09/2020.
//

import Foundation

class DataSource {
    private let appGroupName = "group.com.gfrigerio.WidgetTest"
    
    func getRecordToShow() -> Record {
        let defaults = UserDefaults.init(suiteName: appGroupName)
        defaults?.synchronize()
        let text = defaults?.value(forKey: "Text") as? String ?? "No value read"
        
        return Record(color: .blue, text: text)
    }
}

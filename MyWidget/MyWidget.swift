//
//  MyWidget.swift
//  MyWidget
//
//  Created by Gualtiero Frigerio on 18/09/2020.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    let dataSource = DataSource()
    
    func placeholder(in context: Context) -> MyEntry {
        MyEntry(date:Date(), record: dataSource.getRecordToShow())
    }

    func getSnapshot(in context: Context, completion: @escaping (MyEntry) -> ()) {
        let entry = MyEntry(date:Date(), record:dataSource.getRecordToShow())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [MyEntry] = []

        let entry = MyEntry(date:Date(), record: dataSource.getRecordToShow())
        entries.append(entry)

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct MyEntry: TimelineEntry {
    var date: Date
    let record:Record
}

struct MyWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.date, style: .time)
            Text(entry.record.text)
        }
    }
}

@main
struct MyWidget: Widget {
    let kind: String = "MyWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MyWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("Just a simple widget")
    }
}

let sampleRecord = Record(color: .red, text: "Test")

struct MyWidget_Previews: PreviewProvider {
    static var previews: some View {
        MyWidgetEntryView(entry: MyEntry(date: Date(), record:sampleRecord))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

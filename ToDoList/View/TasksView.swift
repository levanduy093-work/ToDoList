//
//  TaskView.swift
//  ToDoList
//
//  Created by Lê Văn Duy on 20/11/2023.
//

import SwiftUI
import SwiftData

struct TasksView: View {
    @Binding var currentDate: Date
    // SwiftData Dynamic Query
    @Query private var tasks: [Task]
    init(currentDate: Binding<Date>) {
        self._currentDate = currentDate
        // Predicate
        let calender = Calendar.current
        let startOfDate = calender.startOfDay(for: currentDate.wrappedValue)
        guard let endOfDate = calender.date(byAdding: .day, value: 1, to: startOfDate) else { return }
        let predicate = #Predicate<Task> {
            return $0.creationDate >= startOfDate && $0.creationDate < endOfDate
        }
        
        // Sorting
        let sortDescriptor = [
            SortDescriptor(\Task.creationDate, order: .forward)
        ]
        
        self._tasks = Query(filter: predicate, sort: sortDescriptor, animation: .snappy)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            ForEach(tasks) { task in
                TaskRowView(task: task)
                    .background(alignment: .leading) {
                        if tasks.last?.id != task.id {
                            Rectangle()
                                .frame(width: 1)
                                .offset(x: 8)
                                .padding(.bottom, -35)
                        }
                    }
            }
        }
        .padding([.vertical, .leading], 15)
        .padding(.top, 15)
        .overlay {
            if tasks.isEmpty {
                Text("No Task's Found")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .frame(minWidth: 150)
            }
        }
    }
}

#Preview {
    ContentView()
}

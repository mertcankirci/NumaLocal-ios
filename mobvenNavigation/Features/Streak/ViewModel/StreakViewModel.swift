//
//  StreakViewModel.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 17.07.2025.
//

import Foundation

protocol StreakServiceProtocol {
    func fetchUserStreak(for userId: Int) async throws -> UserStreakModel
}

final class StreakViewModel: ObservableObject {
    @Published var userStreakModel: UserStreakModel?
    
    let networkService: NetworkServicable
    
    init(networkService: NetworkServicable) {
        self.networkService = networkService
    }
    
    func fetchUserStreak(for userId: Int) async throws {
        do {
            let model = try await networkService.fetchUserStreak(for: userId)
            await MainActor.run { [weak self] in
                guard let self = self else { return }
                self.userStreakModel = model
            }
        } catch(let error) {
            throw error
        }
    }
    
    func calculateWeeklyCompletion(reference: Date = Date()) -> [(String, Bool)] {
        guard let model = userStreakModel else { return [("Mon", false), ("Tue", false), ("Wed", false), ("Thu", false), ("Fri", false), ("Sat", false), ("Sun", false)] }
        
        let calendar = Calendar(identifier: .gregorian)
        let startOfWeek = calendar.startOfWeek(for: reference)
        
        return (0..<7).compactMap { offset in
            guard let date = calendar.date(byAdding: .day, value: offset, to: startOfWeek) else {
                return nil
            }
            let shortLabel = calendar.shortWeekdaySymbol(for: date)
            let isCompleted = model.completedDates.contains(calendar.startOfDay(for: date))
            return (shortLabel, isCompleted)
        }
    }

    
    func todayIndex() -> Int {
        let i = Calendar.current.component(.weekday, from: Date()) - 2
        return i < 0 ? 6 : i
    }
}

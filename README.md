# Learning Tracker - SwiftUI Learning Tracker

**Learning Tracker** is a SwiftUI view designed to help users track their learning progress over a specific timeframe (Week, Month, or Year). It combines a glassy, modern UI with an interactive calendar and date pickers to log daily learning and "freeze" days.

---

## Features

- **Glassy UI Design**: Modern gradient backgrounds, rounded rectangles, and smooth animations.
- **Calendar & Picker Integration**:
  - View weekly activity with marked learned or freezed days.
  - Toggle between a week calendar and month/year picker seamlessly.
- **Daily Tracking**:
  - Log "Learned Today" days.
  - Freeze certain days without counting them against the learning goal.
- **Goal Completion**:
  - Tracks start and end dates for a learning goal.
  - Shows a "Well done!" screen when the goal is completed.
  - Allows resetting or creating a new learning goal.
- **Persistent Storage**:
  - Tracks completed and freezed days using `@AppStorage`.
  - Keeps state even when the app is closed or restarted.
- **Customizable Timeframes**: Supports Week, Month, and Year goals with dynamic maximum freezes.
- **Navigation Integration**: Includes links to a full calendar view and an edit view.

---

## Code Structure

- **State Variables**:
  - `currentDate`: The currently selected date in the calendar.
  - `learnedCount` & `freezedCount`: Track the number of learned and freezed days.
  - `completedDates` & `freezedDates`: Arrays of logged dates.
  - `isPressedLearned` & `isPressedFreezed`: UI flags for button states.
  - `lastPressedDate`: Ensures only one entry per day.
  - `showPicker` & `showFullCalendar`: Toggle between calendar and month/year picker.
- **Properties**:
  - `topic`: Name of the subject or topic being tracked.
  - `timeframe`: Duration type ("Week", "Month", "Year").
  - `startDate` & `endDate`: Track the current goal's duration.
- **Computed Properties**:
  - `maxFreezesAllowed`: Dynamically calculates allowed freezes based on the timeframe.
- **Functions**:
  - `saveDates()`: Persists `completedDates` and `freezedDates` using `JSONEncoder`.
  - `updateSelectedDate()`: Updates `currentDate` when month or year changes in the picker.
  - `monthName(for:)`: Helper to get the month name from its number.

---

## UI Components

1. **Header**
   - Displays the title, calendar icon, and edit icon.
   - Supports navigation to `FullCalendarView` and `EditView`.

2. **Calendar / Picker Section**
   - **Week Calendar**: Shows weekly progress with colored indicators for learned/freezed days.
   - **Month/Year Picker**: Allows selecting a specific month and year to view or log activity.

3. **Action Buttons**
   - **Learned Today**: Logs the current day as learned.
   - **Day Freezed**: Marks the current day as freezed without counting it.
   - Buttons update dynamically and prevent multiple presses in a single day.

4. **Completion Screen**
   - Shown when the end date is passed.
   - Offers options to reset or set a new learning goal.

---

## Usage

```swift
NavigationStack {
    ActivityView56(
        topic: "Swift",
        timeframe: "Week",
        startDate: Date(),
        endDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!
    )
}

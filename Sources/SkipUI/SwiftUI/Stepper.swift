// This is free software: you can redistribute and/or modify it
// under the terms of the GNU Lesser General Public License 3.0
// as published by the Free Software Foundation https://fsf.org

import class Foundation.Formatter
import protocol Foundation.ParseableFormatStyle

/// A control that performs increment and decrement actions.
///
/// Use a stepper control when you want the user to have granular control while
/// incrementing or decrementing a value. For example, you can use a stepper
/// to:
///
///  * Change a value up or down by `1`.
///  * Operate strictly over a prescribed range.
///  * Step by specific amounts over a stepper's range of possible values.
///
/// The example below uses an array that holds a number of ``Color`` values,
/// a local state variable, `value`, to set the control's background
/// color, and title label. When the user clicks or taps on the stepper's
/// increment or decrement buttons SkipUI executes the relevant
/// closure that updates `value`, wrapping the `value` to prevent overflow.
/// SkipUI then re-renders the view, updating the text and background
/// color to match the current index:
///
///     struct StepperView: View {
///         @State private var value = 0
///         let colors: [Color] = [.orange, .red, .gray, .blue,
///                                .green, .purple, .pink]
///
///         func incrementStep() {
///             value += 1
///             if value >= colors.count { value = 0 }
///         }
///
///         func decrementStep() {
///             value -= 1
///             if value < 0 { value = colors.count - 1 }
///         }
///
///         var body: some View {
///             Stepper {
///                 Text("Value: \(value) Color: \(colors[value].description)")
///             } onIncrement: {
///                 incrementStep()
///             } onDecrement: {
///                 decrementStep()
///             }
///             .padding(5)
///             .background(colors[value])
///         }
///    }
///
/// ![A view displaying a stepper that uses a text view for stepper's title
///   and that changes the background color of its view when incremented or
///   decremented. The view selects the new background color from a
///    predefined array of colors using the stepper's value as the
///   index.](SkipUI-Stepper-increment-decrement-closures.png)
///
/// The following example shows a stepper that displays the effect of
/// incrementing or decrementing a value with the step size of `step` with
/// the bounds defined by `range`:
///
///     struct StepperView: View {
///         @State private var value = 0
///         let step = 5
///         let range = 1...50
///
///         var body: some View {
///             Stepper(value: $value,
///                     in: range,
///                     step: step) {
///                 Text("Current: \(value) in \(range.description) " +
///                      "stepping by \(step)")
///             }
///                 .padding(10)
///         }
///     }
///
/// ![A view displaying a stepper with a step size of five, and a
/// prescribed range of 1 though 50.](SkipUI-Stepper-value-step-range.png)
@available(iOS 13.0, macOS 10.15, watchOS 9.0, *)
@available(tvOS, unavailable)
public struct Stepper<Label> : View where Label : View {

    /// Creates a stepper instance that performs the closures you provide when
    /// the user increments or decrements the stepper.
    ///
    /// Use this initializer to create a control with a custom title that
    /// executes closures you provide when the user clicks or taps the
    /// stepper's increment or decrement buttons.
    ///
    /// The example below uses an array that holds a number of ``Color`` values,
    /// a local state variable, `value`, to set the control's background
    /// color, and title label. When the user clicks or taps on the stepper's
    /// increment or decrement buttons SkipUI executes the relevant
    /// closure that updates `value`, wrapping the `value` to prevent overflow.
    /// SkipUI then re-renders the view, updating the text and background
    /// color to match the current index:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         let colors: [Color] = [.orange, .red, .gray, .blue, .green,
    ///                                .purple, .pink]
    ///
    ///         func incrementStep() {
    ///             value += 1
    ///             if value >= colors.count { value = 0 }
    ///         }
    ///
    ///         func decrementStep() {
    ///             value -= 1
    ///             if value < 0 { value = colors.count - 1 }
    ///         }
    ///
    ///         var body: some View {
    ///             Stepper {
    ///                 Text("Value: \(value) Color: \(colors[value].description)")
    ///             } onIncrement: {
    ///                 incrementStep()
    ///             } onDecrement: {
    ///                 decrementStep()
    ///             }
    ///             .padding(5)
    ///             .background(colors[value])
    ///         }
    ///    }
    ///
    /// ![A view displaying a stepper that uses a text view for stepper's title
    ///   and that changes the background color of its view when incremented or
    ///   decremented. The view selects the new background color from a
    ///    predefined array of colors using the stepper's value as the
    ///   index.](SkipUI-Stepper-increment-decrement-closures.png)
    ///
    /// - Parameters:
    ///     - label: A view describing the purpose of this stepper.
    ///     - onIncrement: The closure to execute when the user clicks or taps
    ///       the control's plus button.
    ///     - onDecrement: The closure to execute when the user clicks or taps
    ///       the control's minus button.
    ///     - onEditingChanged: A closure called when editing begins and ends.
    ///       For example, on iOS, the user may touch and hold the increment
    ///       or decrement buttons on a `Stepper` which causes the execution
    ///       of the `onEditingChanged` closure at the start and end of
    ///       the gesture.
    public init(@ViewBuilder label: () -> Label, onIncrement: (() -> Void)?, onDecrement: (() -> Void)?, onEditingChanged: @escaping (Bool) -> Void = { _ in }) { fatalError() }

    /// The content and behavior of the view.
    ///
    /// When you implement a custom view, you must implement a computed
    /// `body` property to provide the content for your view. Return a view
    /// that's composed of built-in views that SkipUI provides, plus other
    /// composite views that you've already defined:
    ///
    ///     struct MyView: View {
    ///         var body: some View {
    ///             Text("Hello, World!")
    ///         }
    ///     }
    ///
    /// For more information about composing views and a view hierarchy,
    /// see <doc:Declaring-a-Custom-View>.
    @MainActor public var body: some View { get { return never() } }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required ``View/body-swift.property`` property.
//    public typealias Body = some View
}

@available(iOS 13.0, macOS 10.15, watchOS 9.0, *)
@available(tvOS, unavailable)
extension Stepper {

    /// Creates a stepper configured to increment or decrement a binding to a
    /// value using a step value you provide.
    ///
    /// Use this initializer to create a stepper that increments or decrements
    /// a bound value by a specific amount each time the user
    /// clicks or taps the stepper's increment or decrement buttons.
    ///
    /// In the example below, a stepper increments or decrements `value` by the
    /// `step` value of 5 at each click or tap of the control's increment or
    /// decrement button:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 1
    ///         let step = 5
    ///         var body: some View {
    ///             Stepper(value: $value,
    ///                     step: step) {
    ///                 Text("Current value: \(value), step: \(step)")
    ///             }
    ///                 .padding(10)
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper that increments or decrements a value by
    ///   a specified amount each time the user clicks or taps the stepper's
    ///   increment or decrement buttons.](SkipUI-Stepper-value-step.png)
    ///
    /// - Parameters:
    ///   - value: The ``Binding`` to a value that you provide.
    ///   - step: The amount to increment or decrement `value` each time the
    ///     user clicks or taps the stepper's increment or decrement buttons.
    ///     Defaults to `1`.
    ///   - label: A view describing the purpose of this stepper.
    ///   - onEditingChanged: A closure that's called when editing begins and
    ///     ends. For example, on iOS, the user may touch and hold the increment
    ///     or decrement buttons on a stepper which causes the execution
    ///     of the `onEditingChanged` closure at the start and end of
    ///     the gesture.
    @available(watchOS 9.0, *)
    @available(tvOS, unavailable)
    public init<V>(value: Binding<V>, step: V.Stride = 1, @ViewBuilder label: () -> Label, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : Strideable { fatalError() }

    /// Creates a stepper configured to increment or decrement a binding to a
    /// value using a step value and within a range of values you provide.
    ///
    /// Use this initializer to create a stepper that increments or decrements
    /// a binding to value by the step size you provide within the given bounds.
    /// By setting the bounds, you ensure that the value never goes below or
    /// above the lowest or highest value, respectively.
    ///
    /// The example below shows a stepper that displays the effect of
    /// incrementing or decrementing a value with the step size of `step`
    /// with the bounds defined by `range`:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         let step = 5
    ///         let range = 1...50
    ///
    ///         var body: some View {
    ///             Stepper(value: $value,
    ///                     in: range,
    ///                     step: step) {
    ///                 Text("Current: \(value) in \(range.description) " +
    ///                      "stepping by \(step)")
    ///             }
    ///                 .padding(10)
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper with a step size of five, and a
    /// prescribed range of 1 though 50.](SkipUI-Stepper-value-step-range.png)
    ///
    /// - Parameters:
    ///   - value: A ``Binding`` to a value that you provide.
    ///   - bounds: A closed range that describes the upper and lower bounds
    ///     permitted by the stepper.
    ///   - step: The amount to increment or decrement the stepper when the
    ///     user clicks or taps the stepper's increment or decrement buttons,
    ///     respectively.
    ///   - label: A view describing the purpose of this stepper.
    ///   - onEditingChanged: A closure that's called when editing begins and
    ///     ends. For example, on iOS, the user may touch and hold the increment
    ///     or decrement buttons on a stepper which causes the execution
    ///     of the `onEditingChanged` closure at the start and end of
    ///     the gesture.
    @available(watchOS 9.0, *)
    @available(tvOS, unavailable)
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, @ViewBuilder label: () -> Label, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : Strideable { fatalError() }
}

@available(iOS 13.0, macOS 10.15, watchOS 9.0, *)
@available(tvOS, unavailable)
extension Stepper where Label == Text {

    /// Creates a stepper that uses a title key and executes the closures
    /// you provide when the user clicks or taps the stepper's increment and
    /// decrement buttons.
    ///
    /// Use this initializer to create a stepper with a custom title that
    /// executes closures you provide when either of the stepper's increment
    /// or decrement buttons are pressed. This version of ``Stepper`` doesn't
    /// take a binding to a value, nor does it allow you to specify a range of
    /// acceptable values, or a step value -- it simply calls the closures you
    /// provide when the control's buttons are pressed.
    ///
    /// The example below uses an array that holds a number of ``Color`` values,
    /// a local state variable, `value`, to set the control's background
    /// color, and title label. When the user clicks or taps on the stepper's
    /// increment or decrement buttons SkipUI executes the relevant
    /// closure that updates `value`, wrapping the `value` to prevent overflow.
    /// SkipUI then re-renders the view, updating the text and background
    /// color to match the current index:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         let colors: [Color] = [.orange, .red, .gray, .blue, .green,
    ///                                .purple, .pink]
    ///
    ///         func incrementStep() {
    ///             value += 1
    ///             if value >= colors.count { value = 0 }
    ///         }
    ///
    ///         func decrementStep() {
    ///             value -= 1
    ///             if value < 0 { value = colors.count - 1 }
    ///         }
    ///
    ///         var body: some View {
    ///             Stepper("Value: \(value) Color: \(colors[value].description)",
    ///                      onIncrement: incrementStep,
    ///                      onDecrement: decrementStep)
    ///             .padding(5)
    ///             .background(colors[value])
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper that uses a title key for the stepper's
    /// localized title and that changes the background color of its view
    /// when incremented or decremented selecting a color from a predefined
    /// array using the stepper value as the
    /// index.](SkipUI-Stepper-increment-decrement-closures.png)
    ///
    /// - Parameters:
    ///     - titleKey: The key for the stepper's localized title describing
    ///       the purpose of the stepper.
    ///     - onIncrement: The closure to execute when the user clicks or taps the
    ///       control's plus button.
    ///     - onDecrement: The closure to execute when the user clicks or taps the
    ///       control's minus button.
    ///    - onEditingChanged: A closure that's called when editing begins and
    ///      ends. For example, on iOS, the user may touch and hold the increment
    ///      or decrement buttons on a `Stepper` which causes the execution
    ///      of the `onEditingChanged` closure at the start and end of
    ///      the gesture.
    @available(watchOS 9.0, *)
    @available(tvOS, unavailable)
    public init(_ titleKey: LocalizedStringKey, onIncrement: (() -> Void)?, onDecrement: (() -> Void)?, onEditingChanged: @escaping (Bool) -> Void = { _ in }) { fatalError() }

    /// Creates a stepper using a title string and that executes closures
    /// you provide when the user clicks or taps the stepper's increment or
    /// decrement buttons.
    ///
    /// Use `Stepper(_:onIncrement:onDecrement:onEditingChanged:)` to create a
    /// control with a custom title that executes closures you provide when
    /// the user clicks or taps on the stepper's increment or decrement buttons.
    ///
    /// The example below uses an array that holds a number of ``Color`` values,
    /// a local state variable, `value`, to set the control's background
    /// color, and title label. When the user clicks or taps on the stepper's
    /// increment or decrement buttons SkipUI executes the relevant
    /// closure that updates `value`, wrapping the `value` to prevent overflow.
    /// SkipUI then re-renders the view, updating the text and background
    /// color to match the current index:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         let title: String
    ///         let colors: [Color] = [.orange, .red, .gray, .blue, .green,
    ///                                .purple, .pink]
    ///
    ///         func incrementStep() {
    ///             value += 1
    ///             if value >= colors.count { value = 0 }
    ///         }
    ///
    ///         func decrementStep() {
    ///             value -= 1
    ///             if value < 0 { value = colors.count - 1 }
    ///         }
    ///
    ///         var body: some View {
    ///             Stepper(title, onIncrement: incrementStep, onDecrement: decrementStep)
    ///                 .padding(5)
    ///                 .background(colors[value])
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper that uses a string for the stepper's title
    ///   and that changes the background color of its view when incremented or
    ///   decremented selecting a color from a predefined array using the
    ///   stepper's value as the
    ///   index.](SkipUI-Stepper-increment-decrement-closures.png)
    ///
    /// - Parameters:
    ///     - title: A string describing the purpose of the stepper.
    ///     - onIncrement: The closure to execute when the user clicks or taps the
    ///       control's plus button.
    ///     - onDecrement: The closure to execute when the user clicks or taps the
    ///       control's minus button.
    ///    - onEditingChanged: A closure that's called when editing begins and
    ///      ends. For example, on iOS, the user may touch and hold the increment
    ///      or decrement buttons on a `Stepper` which causes the execution
    ///      of the `onEditingChanged` closure at the start and end of
    ///      the gesture.
    @available(watchOS 9.0, *)
    @available(tvOS, unavailable)
    public init<S>(_ title: S, onIncrement: (() -> Void)?, onDecrement: (() -> Void)?, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S : StringProtocol { fatalError() }

    /// Creates a stepper with a title key and configured to increment and
    /// decrement a binding to a value and step amount you provide.
    ///
    /// Use `Stepper(_:value:step:onEditingChanged:)` to create a stepper with a
    /// custom title that increments or decrements a binding to value by the
    /// step size you specify.
    ///
    /// In the example below, the stepper increments or decrements the binding
    /// value by `5` each time the user clicks or taps on the control's
    /// increment or decrement buttons, respectively:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 1
    ///         let step = 5
    ///
    ///         var body: some View {
    ///             Stepper("Current value: \(value), step: \(step)",
    ///                     value: $value,
    ///                     step: step)
    ///                 .padding(10)
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper that increments or decrements by 5 each
    ///   time the user clicks or taps on the control's increment or decrement
    ///   buttons, respectively.](SkipUI-Stepper-value-step.png)
    ///
    /// - Parameters:
    ///     - titleKey: The key for the stepper's localized title describing
    ///       the purpose of the stepper.
    ///     - value: A ``Binding`` to a value that you provide.
    ///     - step: The amount to increment or decrement `value` each time the
    ///       user clicks or taps the stepper's plus or minus button,
    ///       respectively.  Defaults to `1`.
    ///     - onEditingChanged: A closure that's called when editing begins and
    ///       ends. For example, on iOS, the user may touch and hold the
    ///       increment or decrement buttons on a `Stepper` which causes the
    ///       execution of the `onEditingChanged` closure at the start and end
    ///       of the gesture.
    @available(watchOS 9.0, *)
    @available(tvOS, unavailable)
    public init<V>(_ titleKey: LocalizedStringKey, value: Binding<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : Strideable { fatalError() }

    /// Creates a stepper with a title and configured to increment and
    /// decrement a binding to a value and step amount you provide.
    ///
    /// Use `Stepper(_:value:step:onEditingChanged:)` to create a stepper with a
    /// custom title that increments or decrements a binding to value by the
    /// step size you specify.
    ///
    /// In the example below, the stepper increments or decrements the binding
    /// value by `5` each time one of the user clicks or taps the control's
    /// increment or decrement buttons:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 1
    ///         let step = 5
    ///         let title: String
    ///
    ///         var body: some View {
    ///             Stepper(title, value: $value, step: step)
    ///                 .padding(10)
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper that increments or decrements by 1 each
    ///   time the control's buttons
    ///   are pressed.](SkipUI-Stepper-value-step.png)
    ///
    /// - Parameters:
    ///     - title: A string describing the purpose of the stepper.
    ///     - value: The ``Binding`` to a value that you provide.
    ///     - step: The amount to increment or decrement `value` each time the
    ///       user clicks or taps the stepper's increment or decrement button,
    ///       respectively. Defaults to `1`.
    ///     - onEditingChanged: A closure that's called when editing begins and
    ///       ends. For example, on iOS, the user may touch and hold the
    ///       increment or decrement buttons on a `Stepper` which causes the
    ///       execution of the `onEditingChanged` closure at the start and end
    ///       of the gesture.
    @available(watchOS 9.0, *)
    @available(tvOS, unavailable)
    public init<S, V>(_ title: S, value: Binding<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S : StringProtocol, V : Strideable { fatalError() }

    /// Creates a stepper instance that increments and decrements a binding to
    /// a value, by a step size and within a closed range that you provide.
    ///
    /// Use `Stepper(_:value:in:step:onEditingChanged:)` to create a stepper
    /// that increments or decrements a value within a specific range of values
    /// by a specific step size. In the example below, a stepper increments or
    /// decrements a binding to value over a range of `1...50` by `5` at each
    /// press of the stepper's increment or decrement buttons:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         @State private var titleKey = "Stepper"
    ///
    ///         let step = 5
    ///         let range = 1...50
    ///
    ///         var body: some View {
    ///             VStack(spacing: 20) {
    ///                 Text("Current Stepper Value: \(value)")
    ///                 Stepper(titleKey, value: $value, in: range, step: step)
    ///             }
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper that increments or decrements within a
    ///   specified range and step size.](SkipUI-Stepper-value-step-range.png)
    ///
    /// - Parameters:
    ///     - titleKey: The key for the stepper's localized title describing
    ///       the purpose of the stepper.
    ///     - value: A ``Binding`` to a value that your provide.
    ///     - bounds: A closed range that describes the upper and lower bounds
    ///       permitted by the stepper.
    ///     - step: The amount to increment or decrement `value` each time the
    ///       user clicks or taps the stepper's increment or decrement button,
    ///       respectively. Defaults to `1`.
    ///     - onEditingChanged: A closure that's called when editing begins and
    ///       ends. For example, on iOS, the user may touch and hold the increment
    ///       or decrement buttons on a `Stepper` which causes the execution
    ///       of the `onEditingChanged` closure at the start and end of
    ///       the gesture.
    @available(watchOS 9.0, *)
    @available(tvOS, unavailable)
    public init<V>(_ titleKey: LocalizedStringKey, value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where V : Strideable { fatalError() }

    /// Creates a stepper instance that increments and decrements a binding to
    /// a value, by a step size and within a closed range that you provide.
    ///
    /// Use `Stepper(_:value:in:step:onEditingChanged:)` to create a stepper
    /// that increments or decrements a value within a specific range of values
    /// by a specific step size. In the example below, a stepper increments or
    /// decrements a binding to value over a range of `1...50` by `5` each time
    /// the user clicks or taps the stepper's increment or decrement buttons:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         let step = 5
    ///         let range = 1...50
    ///
    ///         var body: some View {
    ///             Stepper("Current: \(value) in \(range.description) stepping by \(step)",
    ///                     value: $value,
    ///                     in: range,
    ///                     step: step)
    ///                 .padding(10)
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper that increments or decrements within a
    ///   specified range and step size.](SkipUI-Stepper-value-step-range.png)
    ///
    /// - Parameters:
    ///     - title: A string describing the purpose of the stepper.
    ///     - value: A ``Binding`` to a value that your provide.
    ///     - bounds: A closed range that describes the upper and lower bounds
    ///       permitted by the stepper.
    ///     - step: The amount to increment or decrement `value` each time the
    ///       user clicks or taps the stepper's increment or decrement button,
    ///       respectively. Defaults to `1`.
    ///     - onEditingChanged: A closure that's called when editing begins and
    ///       ends. For example, on iOS, the user may touch and hold the increment
    ///       or decrement buttons on a `Stepper` which causes the execution
    ///       of the `onEditingChanged` closure at the start and end of
    ///       the gesture.
    @available(watchOS 9.0, *)
    @available(tvOS, unavailable)
    public init<S, V>(_ title: S, value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S : StringProtocol, V : Strideable { fatalError() }
}

@available(iOS 16.0, macOS 13.0, watchOS 9.0, *)
@available(tvOS, unavailable)
extension Stepper {

    /// Creates a stepper configured to increment or decrement a binding to a
    /// value using a step value you provide, displaying its value with an
    /// applied format style.
    ///
    /// Use this initializer to create a stepper that increments or decrements
    /// a bound value by a specific amount each time the user clicks or taps
    /// the stepper's increment or decrement buttons, while displaying the
    /// current value.
    ///
    /// In the example below, a stepper increments or decrements `value` by the
    /// `step` value of 5 at each click or tap of the control's increment or
    /// decrement button:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 1
    ///         let step = 5
    ///         var body: some View {
    ///             Stepper(value: $value,
    ///                     step: step,
    ///                     format: .number) {
    ///                 Text("Current value: \(value), step: \(step)")
    ///             }
    ///                 .padding(10)
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper that increments or decrements a value by
    ///   a specified amount each time the user clicks or taps the stepper's
    ///   increment or decrement buttons.](SkipUI-Stepper-value-step.png)
    ///
    /// - Parameters:
    ///   - value: The ``Binding`` to a value that you provide.
    ///   - step: The amount to increment or decrement `value` each time the
    ///     user clicks or taps the stepper's increment or decrement buttons.
    ///     Defaults to `1`.
    ///   - format: A format style of type `F` to use when converting between
    ///     the string the user edits and the underlying value of type
    ///     `F.FormatInput`. If `format` can't perform the conversion, the
    ///     stepper leaves `value` unchanged. If the user stops editing the
    ///     text in an invalid state, the stepper updates the text to the last
    ///     known valid value.
    ///   - label: A view describing the purpose of this stepper.
    ///   - onEditingChanged: A closure that's called when editing begins and
    ///     ends. For example, on iOS, the user may touch and hold the increment
    ///     or decrement buttons on a stepper which causes the execution
    ///     of the `onEditingChanged` closure at the start and end of
    ///     the gesture.
    public init<F>(value: Binding<F.FormatInput>, step: F.FormatInput.Stride = 1, format: F, @ViewBuilder label: () -> Label, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where F : ParseableFormatStyle, F.FormatInput : BinaryFloatingPoint, F.FormatOutput == String { fatalError() }

    /// Creates a stepper configured to increment or decrement a binding to a
    /// value using a step value and within a range of values you provide,
    /// displaying its value with an applied format style.
    ///
    /// Use this initializer to create a stepper that increments or decrements
    /// a binding to value by the step size you provide within the given bounds.
    /// By setting the bounds, you ensure that the value never goes below or
    /// above the lowest or highest value, respectively.
    ///
    /// The example below shows a stepper that displays the effect of
    /// incrementing or decrementing a value with the step size of `step`
    /// with the bounds defined by `range`:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         let step = 5
    ///         let range = 1...50
    ///
    ///         var body: some View {
    ///             Stepper(value: $value,
    ///                     in: range,
    ///                     step: step,
    ///                     format: .number) {
    ///                 Text("Current: \(value) in \(range.description) " +
    ///                      "stepping by \(step)")
    ///             }
    ///                 .padding(10)
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper with a step size of five, and a
    /// prescribed range of 1 though 50.](SkipUI-Stepper-value-step-range.png)
    ///
    /// - Parameters:
    ///   - value: A ``Binding`` to a value that you provide.
    ///   - bounds: A closed range that describes the upper and lower bounds
    ///     permitted by the stepper.
    ///   - step: The amount to increment or decrement the stepper when the
    ///     user clicks or taps the stepper's increment or decrement buttons,
    ///     respectively.
    ///   - format: A format style of type `F` to use when converting between
    ///     the string the user edits and the underlying value of type
    ///     `F.FormatInput`. If `format` can't perform the conversion, the
    ///     stepper leaves `value` unchanged. If the user stops editing the
    ///     text in an invalid state, the stepper updates the text to the last
    ///     known valid value.
    ///   - label: A view describing the purpose of this stepper.
    ///   - onEditingChanged: A closure that's called when editing begins and
    ///     ends. For example, on iOS, the user may touch and hold the increment
    ///     or decrement buttons on a stepper which causes the execution
    ///     of the `onEditingChanged` closure at the start and end of
    ///     the gesture.
    public init<F>(value: Binding<F.FormatInput>, in bounds: ClosedRange<F.FormatInput>, step: F.FormatInput.Stride = 1, format: F, @ViewBuilder label: () -> Label, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where F : ParseableFormatStyle, F.FormatInput : BinaryFloatingPoint, F.FormatOutput == String { fatalError() }
}

@available(iOS 16.0, macOS 13.0, watchOS 9.0, *)
@available(tvOS, unavailable)
extension Stepper where Label == Text {

    /// Creates a stepper with a title key and configured to increment and
    /// decrement a binding to a value and step amount you provide,
    /// displaying its value with an applied format style.
    ///
    /// Use `Stepper(_:value:step:onEditingChanged:)` to create a stepper with a
    /// custom title that increments or decrements a binding to value by the
    /// step size you specify, while displaying the current value.
    ///
    /// In the example below, the stepper increments or decrements the binding
    /// value by `5` each time the user clicks or taps on the control's
    /// increment or decrement buttons, respectively:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 1
    ///
    ///         var body: some View {
    ///             Stepper("Stepping by \(step)",
    ///                 value: $value,
    ///                 step: 5,
    ///                 format: .number
    ///             )
    ///             .padding(10)
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper that increments or decrements by 5 each
    ///   time the user clicks or taps on the control's increment or decrement
    ///   buttons, respectively.](SkipUI-Stepper-value-step.png)
    ///
    /// - Parameters:
    ///     - titleKey: The key for the stepper's localized title describing
    ///       the purpose of the stepper.
    ///     - value: A ``Binding`` to a value that you provide.
    ///     - step: The amount to increment or decrement `value` each time the
    ///       user clicks or taps the stepper's plus or minus button,
    ///       respectively.  Defaults to `1`.
    ///     - format: A format style of type `F` to use when converting between
    ///       the string the user edits and the underlying value of type
    ///       `F.FormatInput`. If `format` can't perform the conversion, the
    ///       stepper leaves `value` unchanged. If the user stops editing the
    ///       text in an invalid state, the stepper updates the text to the last
    ///       known valid value.
    ///     - onEditingChanged: A closure that's called when editing begins and
    ///       ends. For example, on iOS, the user may touch and hold the
    ///       increment or decrement buttons on a `Stepper` which causes the
    ///       execution of the `onEditingChanged` closure at the start and end
    ///       of the gesture.
    public init<F>(_ titleKey: LocalizedStringKey, value: Binding<F.FormatInput>, step: F.FormatInput.Stride = 1, format: F, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where F : ParseableFormatStyle, F.FormatInput : BinaryFloatingPoint, F.FormatOutput == String { fatalError() }

    /// Creates a stepper with a title and configured to increment and
    /// decrement a binding to a value and step amount you provide,
    /// displaying its value with an applied format style.
    ///
    /// Use `Stepper(_:value:step:format:onEditingChanged:)` to create a stepper
    /// with a custom title that increments or decrements a binding to value by
    /// the step size you specify, while displaying the current value.
    ///
    /// In the example below, the stepper increments or decrements the binding
    /// value by `5` each time one of the user clicks or taps the control's
    /// increment or decrement buttons:
    ///
    ///     struct StepperView: View {
    ///         let title: String
    ///         @State private var value = 1
    ///
    ///         var body: some View {
    ///             Stepper(title, value: $value, step: 5, format: .number)
    ///                 .padding(10)
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///     - title: A string describing the purpose of the stepper.
    ///     - value: The ``Binding`` to a value that you provide.
    ///     - step: The amount to increment or decrement `value` each time the
    ///       user clicks or taps the stepper's increment or decrement button,
    ///       respectively. Defaults to `1`.
    ///     - format: A format style of type `F` to use when converting between
    ///       the string the user edits and the underlying value of type
    ///       `F.FormatInput`. If `format` can't perform the conversion, the
    ///       stepper leaves `value` unchanged. If the user stops editing the
    ///       text in an invalid state, the stepper updates the text to the last
    ///       known valid value.
    ///     - onEditingChanged: A closure that's called when editing begins and
    ///       ends. For example, on iOS, the user may touch and hold the
    ///       increment or decrement buttons on a `Stepper` which causes the
    ///       execution of the `onEditingChanged` closure at the start and end
    ///       of the gesture.
    public init<S, F>(_ title: S, value: Binding<F.FormatInput>, step: F.FormatInput.Stride = 1, format: F, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S : StringProtocol, F : ParseableFormatStyle, F.FormatInput : BinaryFloatingPoint, F.FormatOutput == String { fatalError() }

    /// Creates a stepper instance that increments and decrements a binding to
    /// a value, by a step size and within a closed range that you provide,
    /// displaying its value with an applied format style.
    ///
    /// Use `Stepper(_:value:in:step:format:onEditingChanged:)` to create a
    /// stepper that increments or decrements a value within a specific range
    /// of values by a specific step size, while displaying the current value.
    /// In the example below, a stepper increments or decrements a binding to
    /// value over a range of `1...50` by `5` each time the user clicks or taps
    /// the stepper's increment or decrement buttons:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///
    ///         var body: some View {
    ///             Stepper("Stepping by \(step) in \(range.description)",
    ///                 value: $value,
    ///                 in: 1...50,
    ///                 step: 5,
    ///                 format: .number
    ///             )
    ///             .padding()
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///     - titleKey: The key for the stepper's localized title describing
    ///       the purpose of the stepper.
    ///     - value: A ``Binding`` to a value that your provide.
    ///     - bounds: A closed range that describes the upper and lower bounds
    ///       permitted by the stepper.
    ///     - step: The amount to increment or decrement `value` each time the
    ///       user clicks or taps the stepper's increment or decrement button,
    ///       respectively. Defaults to `1`.
    ///     - format: A format style of type `F` to use when converting between
    ///       the string the user edits and the underlying value of type
    ///       `F.FormatInput`. If `format` can't perform the conversion, the
    ///       stepper leaves `value` unchanged. If the user stops editing the
    ///       text in an invalid state, the stepper updates the text to the last
    ///       known valid value.
    ///     - onEditingChanged: A closure that's called when editing begins and
    ///       ends. For example, on iOS, the user may touch and hold the increment
    ///       or decrement buttons on a `Stepper` which causes the execution
    ///       of the `onEditingChanged` closure at the start and end of
    ///       the gesture.
    public init<F>(_ titleKey: LocalizedStringKey, value: Binding<F.FormatInput>, in bounds: ClosedRange<F.FormatInput>, step: F.FormatInput.Stride = 1, format: F, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where F : ParseableFormatStyle, F.FormatInput : BinaryFloatingPoint, F.FormatOutput == String { fatalError() }

    /// Creates a stepper instance that increments and decrements a binding to
    /// a value, by a step size and within a closed range that you provide,
    /// displaying its value with an applied format style.
    ///
    /// Use `Stepper(_:value:in:step:format:onEditingChanged:)` to create a
    /// stepper that increments or decrements a value within a specific range
    /// of values by a specific step size, while displaying the current value.
    /// In the example below, a stepper increments or decrements a binding to
    /// value over a range of `1...50` by `5` each time the user clicks or taps
    /// the stepper's increment or decrement buttons:
    ///
    ///     struct StepperView: View {
    ///         let title: String
    ///         @State private var value = 0
    ///
    ///         let step = 5
    ///         let range = 1...50
    ///
    ///         var body: some View {
    ///             Stepper(title,
    ///                 value: $value,
    ///                 in: 1...50,
    ///                 step: 5,
    ///                 format: .number
    ///             )
    ///             .padding()
    ///         }
    ///     }
    ///
    /// - Parameters:
    ///     - title: A string describing the purpose of the stepper.
    ///     - value: A ``Binding`` to a value that your provide.
    ///     - bounds: A closed range that describes the upper and lower bounds
    ///       permitted by the stepper.
    ///     - step: The amount to increment or decrement `value` each time the
    ///       user clicks or taps the stepper's increment or decrement button,
    ///       respectively. Defaults to `1`.
    ///     - format: A format style of type `F` to use when converting between
    ///       the string the user edits and the underlying value of type
    ///       `F.FormatInput`. If `format` can't perform the conversion, the
    ///       stepper leaves `value` unchanged. If the user stops editing the
    ///       text in an invalid state, the stepper updates the text to the last
    ///       known valid value.
    ///     - onEditingChanged: A closure that's called when editing begins and
    ///       ends. For example, on iOS, the user may touch and hold the increment
    ///       or decrement buttons on a `Stepper` which causes the execution
    ///       of the `onEditingChanged` closure at the start and end of
    ///       the gesture.
    public init<S, F>(_ title: S, value: Binding<F.FormatInput>, in bounds: ClosedRange<F.FormatInput>, step: F.FormatInput.Stride = 1, format: F, onEditingChanged: @escaping (Bool) -> Void = { _ in }) where S : StringProtocol, F : ParseableFormatStyle, F.FormatInput : BinaryFloatingPoint, F.FormatOutput == String { fatalError() }
}

@available(iOS 13.0, macOS 10.15, watchOS 9.0, *)
@available(tvOS, unavailable)
extension Stepper {

    /// Creates a stepper instance that performs the closures you provide when
    /// the user increments or decrements the stepper.
    ///
    /// Use this initializer to create a control with a custom title that
    /// executes closures you provide when the user clicks or taps the
    /// stepper's increment or decrement buttons.
    ///
    /// The example below uses an array that holds a number of ``Color`` values,
    /// a local state variable, `value`, to set the control's background
    /// color, and title label. When the user clicks or taps on the stepper's
    /// increment or decrement buttons SkipUI executes the relevant
    /// closure that updates `value`, wrapping the `value` to prevent overflow.
    /// SkipUI then re-renders the view, updating the text and background
    /// color to match the current index:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         let colors: [Color] = [.orange, .red, .gray, .blue, .green,
    ///                                .purple, .pink]
    ///
    ///         func incrementStep() {
    ///             value += 1
    ///             if value >= colors.count { value = 0 }
    ///         }
    ///
    ///         func decrementStep() {
    ///             value -= 1
    ///             if value < 0 { value = colors.count - 1 }
    ///         }
    ///
    ///         var body: some View {
    ///             Stepper(onIncrement: incrementStep,
    ///                 onDecrement: decrementStep) {
    ///                 Text("Value: \(value) Color: \(colors[value].description)")
    ///             }
    ///             .padding(5)
    ///             .background(colors[value])
    ///         }
    ///    }
    ///
    /// ![A view displaying a stepper that uses a text view for stepper's title
    ///   and that changes the background color of its view when incremented or
    ///   decremented. The view selects the new background color from a
    ///    predefined array of colors using the stepper's value as the
    ///   index.](SkipUI-Stepper-increment-decrement-closures.png)
    ///
    /// - Parameters:
    ///     - onIncrement: The closure to execute when the user clicks or taps
    ///       the control's plus button.
    ///     - onDecrement: The closure to execute when the user clicks or taps
    ///       the control's minus button.
    ///     - onEditingChanged: A closure called when editing begins and ends.
    ///       For example, on iOS, the user may touch and hold the increment
    ///       or decrement buttons on a `Stepper` which causes the execution
    ///       of the `onEditingChanged` closure at the start and end of
    ///       the gesture.
    ///     - label: A view describing the purpose of this stepper.
    @available(iOS, deprecated: 100000.0, renamed: "Stepper(label:onIncrement:onDecrement:onEditingChanged:)")
    @available(macOS, deprecated: 100000.0, renamed: "Stepper(label:onIncrement:onDecrement:onEditingChanged:)")
    @available(watchOS, deprecated: 100000.0, renamed: "Stepper(label:onIncrement:onDecrement:onEditingChanged:)")
    @available(xrOS, deprecated: 100000.0, renamed: "Stepper(label:onIncrement:onDecrement:onEditingChanged:)")
    public init(onIncrement: (() -> Void)?, onDecrement: (() -> Void)?, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label) { fatalError() }

    /// Creates a stepper configured to increment or decrement a binding to a
    /// value using a step value you provide.
    ///
    /// Use this initializer to create a stepper that increments or decrements
    /// a bound value by a specific amount each time the user
    /// clicks or taps the stepper's increment or decrement buttons.
    ///
    /// In the example below, a stepper increments or decrements `value` by the
    /// `step` value of 5 at each click or tap of the control's increment or
    /// decrement button:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 1
    ///         let step = 5
    ///         var body: some View {
    ///             Stepper(value: $value,
    ///                     step: step) {
    ///                 Text("Current value: \(value), step: \(step)")
    ///             }
    ///                 .padding(10)
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper that increments or decrements a value by
    ///   a specified amount each time the user clicks or taps the stepper's
    ///   increment or decrement buttons.](SkipUI-Stepper-value-step.png)
    ///
    /// - Parameters:
    ///   - value: The ``Binding`` to a value that you provide.
    ///   - step: The amount to increment or decrement `value` each time the
    ///     user clicks or taps the stepper's increment or decrement buttons.
    ///     Defaults to `1`.
    ///   - onEditingChanged: A closure that's called when editing begins and
    ///     ends. For example, on iOS, the user may touch and hold the increment
    ///     or decrement buttons on a stepper which causes the execution
    ///     of the `onEditingChanged` closure at the start and end of
    ///     the gesture.
    ///   - label: A view describing the purpose of this stepper.
    @available(iOS, deprecated: 100000.0, renamed: "Stepper(value:step:label:onEditingChanged:)")
    @available(macOS, deprecated: 100000.0, renamed: "Stepper(value:step:label:onEditingChanged:)")
    @available(watchOS, deprecated: 100000.0, renamed: "Stepper(value:step:label:onEditingChanged:)")
    @available(xrOS, deprecated: 100000.0, renamed: "Stepper(value:step:label:onEditingChanged:)")
    public init<V>(value: Binding<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label) where V : Strideable { fatalError() }

    /// Creates a stepper configured to increment or decrement a binding to a
    /// value using a step value and within a range of values you provide.
    ///
    /// Use this initializer to create a stepper that increments or decrements
    /// a binding to value by the step size you provide within the given bounds.
    /// By setting the bounds, you ensure that the value never goes below or
    /// above the lowest or highest value, respectively.
    ///
    /// The example below shows a stepper that displays the effect of
    /// incrementing or decrementing a value with the step size of `step`
    /// with the bounds defined by `range`:
    ///
    ///     struct StepperView: View {
    ///         @State private var value = 0
    ///         let step = 5
    ///         let range = 1...50
    ///
    ///         var body: some View {
    ///             Stepper(value: $value,
    ///                     in: range,
    ///                     step: step) {
    ///                 Text("Current: \(value) in \(range.description) " +
    ///                      "stepping by \(step)")
    ///             }
    ///                 .padding(10)
    ///         }
    ///     }
    ///
    /// ![A view displaying a stepper with a step size of five, and a
    /// prescribed range of 1 though 50.](SkipUI-Stepper-value-step-range.png)
    ///
    /// - Parameters:
    ///   - value: A ``Binding`` to a value that you provide.
    ///   - bounds: A closed range that describes the upper and lower bounds
    ///     permitted by the stepper.
    ///   - step: The amount to increment or decrement the stepper when the
    ///     user clicks or taps the stepper's increment or decrement buttons,
    ///     respectively.
    ///   - onEditingChanged: A closure that's called when editing begins and
    ///     ends. For example, on iOS, the user may touch and hold the increment
    ///     or decrement buttons on a stepper which causes the execution
    ///     of the `onEditingChanged` closure at the start and end of
    ///     the gesture.
    ///   - label: A view describing the purpose of this stepper.
    @available(iOS, deprecated: 100000.0, renamed: "Stepper(value:in:step:label:onEditingChanged:)")
    @available(macOS, deprecated: 100000.0, renamed: "Stepper(value:in:step:label:onEditingChanged:)")
    @available(watchOS, deprecated: 100000.0, renamed: "Stepper(value:in:step:label:onEditingChanged:)")
    @available(xrOS, deprecated: 100000.0, renamed: "Stepper(value:in:step:label:onEditingChanged:)")
    public init<V>(value: Binding<V>, in bounds: ClosedRange<V>, step: V.Stride = 1, onEditingChanged: @escaping (Bool) -> Void = { _ in }, @ViewBuilder label: () -> Label) where V : Strideable { fatalError() }
}

//
//  TransitionDurationType.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

public final class TimeType: Initialable, Inheritable, CustomStringConvertible, _PropertyValueInnerChangeable {
    @State public var value = ""
    
    var _changeHandler = {}
    
    public init (_ value: String) { self.value = value }
    
    init<U: TimeUnitValue>(_ value: U) {
        self.value = TimeUnitValueContainer(value.value.doubleValue, value.timeUnit).description
    }
    
    convenience init <A>(_ value: A) where A: StateConvertible, A.Value: TimeUnitValue {
        let value = value.stateValue
        self.init(value.wrappedValue)
        value.listen { self._changeHandler() }
    }
    
    /// Specifies how many seconds or milliseconds a transition effect takes to complete.
    /// Default value is 0s, meaning there will be no effect
    public static func time<V: TimeUnitValue>(_ v: V) -> Self { .init(v.description) }
    
    /// Specifies how many seconds or milliseconds a transition effect takes to complete.
    /// Default value is 0s, meaning there will be no effect
    public static func time<A>(_ v: A) -> Self where A: StateConvertible, A.Value: TimeUnitValue {
        self.init(v)
    }
    
    /// Specifies how many seconds or milliseconds a transition effect takes to complete.
    /// Default value is 0s, meaning there will be no effect
    public static func seconds(_ v: Double) -> Self { .init(TimeUnitValueContainer(v, .s)) }
    
    /// Specifies how many seconds or milliseconds a transition effect takes to complete.
    /// Default value is 0s, meaning there will be no effect
    public static func seconds<A>(_ v: A) -> Self where A: StateConvertible, A.Value == Double {
        self.init(TimeUnitValueContainer(v.stateValue, .s))
    }
    
    /// Specifies how many seconds or milliseconds a transition effect takes to complete.
    /// Default value is 0s, meaning there will be no effect
    public static func milliseconds(_ v: Double) -> Self { .init(TimeUnitValueContainer(v, .ms)) }
    
    /// Specifies how many seconds or milliseconds a transition effect takes to complete.
    /// Default value is 0s, meaning there will be no effect
    public static func milliseconds<A>(_ v: A) -> Self where A: StateConvertible, A.Value == Double {
        self.init(TimeUnitValueContainer(v.stateValue, .ms))
    }
    
    public var description: String { value }
}

/*:
## Exercise - Dictionaries

 Create a variable `[String: Int]` dictionary that can be used to look up the number of days in a particular month. Use a dictionary literal to initialize it with January, February, and March. January contains 31 days, February has 28, and March has 31. Print the dictionary.
 */
var daysInMonth: [String: Int] = [:]

daysInMonth = ["January": 31, "February" : 28, "March" : 31]
//:  Using subscripting syntax to add April to the collection with a value of 30. Print the dictionary.
daysInMonth[ "April" ] = 30
print( daysInMonth )
//:  It's a leap year! Update the number of days in February to 29 using the `updateValue(_:, forKey:)` method. Print the dictionary.
let answer = daysInMonth.updateValue(29, forKey: "February")
if let answer = answer { print( "Previous value was \(answer)")}
//:  Use if-let syntax to retrieve the number of days under "January". If the value is there, print "January has 31 days", where 31 is the value retrieved from the dictionary.
if let janDays = daysInMonth[ "January" ] {
    print( "January has \(janDays) days" )
}

//:  Use if-let syntax to retrieve the number of days under "July". Print the value if there, else print "July does not have an entry",
if let julyDays = daysInMonth[ "July" ]  {
    print( "July has \(julyDays) days" )
} else {
    print( "July does not have an entry" )
}

//: Imagine you have an app that asks the user to enter his/her age using the keyboard. When your app allows a user to input text, what is captured for you is given as a `String`. However, you want to store this information as an `Int`. Is it possible for the user to make a mistake and for the input to not match the type you want to store?
//: Declare a constant `userInputAge` of type `String` and assign it "34e" to simulate a typo while typing age. Then declare a constant `userAge` of type `Int` and set its value using the `Int` initializer that takes an instance of `String` as input. Pass in `userInputAge` as the argument for the initializer. What error do you get?
let userInputAge: String = "34"

let userAge: Int? = Int(userInputAge)


//:  Go back and change the type of `userAge` to `Int?`, and print the value of `userAge`. Why is `userAge`'s value `nil`?


/*:
Now go back and fix the typo on the value of `userInputAge`. Is there anything about the value printed that seems off?

Print `userAge` again, but this time unwrap `userAge` using the force unwrap operator.
*/
print( userAge! )

//:  Now use optional binding to unwrap `userAge`. If `userAge` has a value, print it to the console.
if let userAge = userAge {
    print( "Age is \(userAge)")
}

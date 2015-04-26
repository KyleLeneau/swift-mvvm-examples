# MVVM Examples with Swift [![Circle CI](https://circleci.com/gh/KyleLeneau/swift-mvvm-examples.svg?style=svg)](https://circleci.com/gh/KyleLeneau/swift-mvvm-examples)
Using [KnockoutJS](http://knockoutjs.com/examples/) examples as a starting point, I hope to point out how to use MVVM in various views of on iOS application.

## Brief
Most of the view code that I am going to write will be written in code so that the concepts are easily digestable without needing to consult a storyboard (with the exception of the window and root view controller).

## Lessons
1. Hello iPhone, simple text box form that responds to text changes and updates a label
2. Click Counter, tracking dependencies and enabling inputs with signals
3. Simple List, demonstrates binding to an array or values and enabling buttons based on validation

## Dependencies
- [ReactiveCocoa](http://github.com/reactivecocoa/reactivecocoa) This is the key to binding, signal chaining and other awesome stuff.
- [PureLayout](https://github.com/smileyborg/PureLayout) Simple way to do declaritive auto layout without the extra keystrokes.

# Getting started

1. Clone the repository
2. Run Carthage update

	```sh
	carthage update
	```

## More Info
- http://www.sprynthesis.com/2014/12/06/reactivecocoa-mvvm-introduction/

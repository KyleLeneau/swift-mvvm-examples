# MVVM Examples with Swift [![Circle CI](https://circleci.com/gh/KyleLeneau/swift-mvvm-examples.svg?style=svg)](https://circleci.com/gh/KyleLeneau/swift-mvvm-examples) ![](https://www.bitrise.io/app/50d9edc2c40205b2.svg?token=xNUbXmTg8WpJVD1uinozbw&branch=master)
Using [KnockoutJS](http://knockoutjs.com/examples/) examples as a starting point, I hope to show how to use MVVM in various views of an iOS application.

## Brief
Most of the view code that I am going to write will be written in code so that the concepts are easily digestable.  No need to consult a storyboard (with the exception of the window and root view controller).

## Lessons
1. Hello iPhone, simple text box form that responds to text changes and updates a label
2. Click Counter, tracking dependencies and enabling inputs with signals
3. Simple List, demonstrates binding to an array or values and enabling buttons based on validation

## Dependencies
- [ReactiveCocoa](http://github.com/reactivecocoa/reactivecocoa) This is the key to binding, signal chaining and other awesome stuff.

# Getting started

1. Clone the repository
2. Run Carthage update

	```sh
	carthage update
	```

## More Info
- http://www.sprynthesis.com/2014/12/06/reactivecocoa-mvvm-introduction/

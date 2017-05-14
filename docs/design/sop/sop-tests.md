# SOP on Tests

This article describes the best practices to write test cases for algorithms in XALG project.

## Class naming conventions

`XALG_Tests_Graph_SSSP`

A class and file name for unit tests should have at least 4 parts. Take example of `XALG_Tests_Graph_SSSP`

* Framework code. `XALG`
* Role. `Tests`
* ADT. `Graph`
* Algorithm or Feature. `SSSP`

## Methods

There are 3 kinds of methods in a `XCTestCase` subclass.

* `XCTestCase` defined, such as `setUp`, `tearDown`.
* `test_` prefixed, for unit testing.
* private `assert_` prefixed, called by `test_` and calling `XCTAssert` prefixed methods of [`XCTAssert` framework](https://developer.apple.com/reference/xctest).

## Use of `setUp` and instance properties

If the main purpose of case tests are on constructing data structure, such as

* creating empty/new data structure
* adding or removing items.
* loading and parsing external files, in XALG-IO

Then you should write test cases as normal. Otherwise, you should consider to create to-be-tested data structure in `setUp` method, and keep the reference as instance properties for later `test_` methods' use.

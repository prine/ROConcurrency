# ROConcurrency
Simple helper classes which will reduce the complexity for using concurrent methods in Swift.

## Installation

ROConcurrency is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ROConcurrency"
```

## How to use

Barrier
-----------
With the following class Barrier you can define a set of tasks which are all executed asynchrounisly. The barrier will keep track of the executed tasks and if all tasks are finished you can define an afterTask which will be executed after all the other ones are finished.

Creating of the tasks

```Swift
var task_one = Task {
    sleep(3)
    println("Task one is doing some stuff..")
}

var task_two = Task {
    println("Task two is doing some stuff..")
}

var task_third = Task {
    println("Task three is doing some stuff..")
}

var afterTask = Task {
    println("I should get executed at the end of all the other requests")
}
```

Then the barrier is created with the following line of code:

```Swift
var barrier = Barrier(tasks: [task_one, task_two, task_third], afterTask:afterTask)
```

If you want to activate the verbose logging of the task execution you can set the param verbose to true (Default is false).

```Swift
var barrier = Barrier(tasks: [task_one, task_two, task_third], afterTask:afterTask, verbose:true)
```

The tasks can be started with the method <code>startTasks</code>

```Swift
barrier.startTasks()
```

BarrierComplex
------------
Often you already have asynchronous tasks with the method above its not possible to notify the Barrier that an asynchronous task has finished. So that's where the TaskComplex and BarrierComplex class comes in. In the TaskComplex block you can pack an already asynchrously method and add the call of finished() at the end of the execution of the asynchronous block. The rest is exactly the same concept as in the Barrier class above.

```Swift
        var taskDownload = TaskComplex { (finished) -> () in
            // Do something asynchronously and then at the end call the finished block to notify the barrier that it's finished
            finished()
        }

        var taskCompress = TaskComplex { (finished) -> () in
            // Do something else
            finished()
        }

        var notifiyEveryoneAtTheEnd = TaskComplex { (finished) -> () in
            // Notify everyone
            finished()
        }

        var barrierComplex = BarrierComplex(tasks: [taskDownload, taskCompress], afterTask: notifiyEveryoneAtTheEnd, verbose: true)

        barrierComplex.startTasks()
```


## License

```
The MIT License (MIT)

Copyright (c) 2015 Robin Oster (http://prine.ch)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

## Author

Robin Oster, robin.oster@rascor.com

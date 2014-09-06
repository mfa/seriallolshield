# serial lolshield

## purpose

lighten lines on a lolshield based on serial connection data

## requirements

* an Arduino (I used a leonardo)
* [a lolshield](http://jimmieprodgers.com/kits/lolshield/)
* Software: arduino 1.0.5 and arduino-mk (in Debian/Ubuntu: `apt-get install arduino arduino-mk`)
* Python

## howto

### build and upload

you need root to write on `/dev/ttyACM0`.

```sudo make upload```

### send commands

you need root to write on `/dev/ttyACM0`.

```sudo python send.py```

Commands are:

* 1..9 for line number
* A..N length
* Z set
* Y clean one line
* S reset whole display

Examples:

* `3BZ` sets in 3rd line 2 dots
* `1AZ2BZ3CZ4DZ5EZ6FZ7GZ8HZ9IZ` sets number of dots equal to line number
* `S` resets display
* `4Y` resets line 4

## Sources

`Charliplexing.[cpp,h]` are from http://code.google.com/p/lolshield/ v82.



Licence: MIT

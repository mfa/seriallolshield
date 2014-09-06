import serial
ser = serial.Serial('/dev/ttyACM0', 9600)

print("1..9 line number, A..N length, S reset, Y clean line, Z set")
print("quit with Ctrl-C")

while True:
    inp = raw_input('Input:')
    ser.write(inp)

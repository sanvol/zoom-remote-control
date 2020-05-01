from time import sleep
from pynput.keyboard import Key, Controller
import argparse
import os

SUP_OS = ['MacOS','Linux','Win10']

parser = argparse.ArgumentParser(description='Key Stroke Injection attack script')
parser.add_argument('--os', type=str, default='MacOS', 
                    help='Victim OS', choices=SUP_OS)

args = parser.parse_args()

print(args.os)

keyboard = Controller()
sleep(5)
keyboard.press(Key.cmd_r)
keyboard.press(' ')
keyboard.release(' ')
keyboard.release(Key.cmd_r)
sleep(1)
keyboard.type('Nitratine')


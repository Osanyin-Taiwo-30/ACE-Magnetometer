#!/usr/bin/env python
"""
Download ACE Magnetometer data: 16-second averaged
"""
from argparse import ArgumentParser
import ace_magnetometer as am


def main():
    p = ArgumentParser()
    p.add_argument('date', help='date of observation yyyy-mm-dd')
    p.add_argument('path', help='path to write data to')
    p = p.parse_args()

    am.download(p.date, p.path)


if __name__ == '__main__':
    main()

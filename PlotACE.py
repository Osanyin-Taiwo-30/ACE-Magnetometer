#!/usr/bin/env python
"""
Load and Plot ACE Magnetometer data: 16-second averaged
"""
from argparse import ArgumentParser
from matplotlib.pyplot import figure, show
import pandas as pd
import matplotlib.dates as mdates
import ace_magnetometer as am
import seaborn as sns
sns.set_context('talk')
sns.set_style('whitegrid')


def main():
    p = ArgumentParser()
    p.add_argument('date', help='date of observation yyyy-mm-dd')
    p.add_argument('path', help='path to load data from')
    p = p.parse_args()

    dat = am.load(p.date, p.path)

    plot(dat)

    show()


def plot(dat: pd.DataFrame):
    fg = figure()

    axs = fg.subplots(3, 1, sharex=True)

    ax = axs[0]
    dat[['Br', 'Bt', 'Bn']].plot(ax=ax)
    ax.set_ylabel('B-field [nT]')
    ax.set_ylim(-50, 50)

    ax = axs[1]
    dat[['Bx', 'By', 'Bz']].plot(ax=ax)
    ax.set_ylabel('B-field [nT]')
    ax.set_ylim(-50, 50)

    ax = axs[2]
    dat[['Btotal', 'dBrms']].plot(ax=ax)
    ax.set_ylabel('B-field [nT]')
    ax.set_ylim(-50, 50)

    axs[-1].set_xlabel('time [UTC]')
    axs[-1].xaxis.set_major_formatter(mdates.DateFormatter('%H:%M'))

    fg.suptitle(f'ACE magnetometer {dat.index[1].date()}')


if __name__ == '__main__':
    main()

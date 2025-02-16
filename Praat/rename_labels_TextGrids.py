#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Apr  7 15:24:15 2024

@author: mkachlicka
"""

from praatio import textgrid
from glob import glob
from os.path import join

def get_grids():
    grids = glob('examples/*.TextGrid')
    return grids


if __name__ == "__main__":
    grids = get_grids()

    for grid in grids:
        tg = textgrid.openTextgrid(grid, includeEmptyIntervals=False)
        tier = tg._tierDict[tg.tierNames[1]]

        # Specify tier for which you will be changing labels
        wordTier = tg.getTier("word")
        
        # Specify label to change
        spFind = wordTier.find('sp')
        if spFind:
            for index in spFind:
                spWord = wordTier.entries[index]
                wordTier.insertEntry((spWord[0], spWord[1], ''), collisionMode='replace', collisionReportingMode='warning')
            tg.replaceTier('word',wordTier)
        else:
            pass
        
        # Specify label to change
        fpFind = wordTier.find('fp')
        if fpFind:
            for index in fpFind:
                fpWord = wordTier.entries[index]
                wordTier.insertEntry((fpWord[0], fpWord[1], ''), collisionMode='replace', collisionReportingMode='warning')
            tg.replaceTier('word',wordTier)
        else:
            pass
        
        # Save updated tier into the existing TextGrid (overwrites original file)
        tg.save(join(grid + ""), format="short_textgrid", includeBlankSpaces=True)
        # If you want to keep old and new file use :
        #tg.save(join("examples/" + grid[9:24] + "_new.TextGrid"), format="short_textgrid", includeBlankSpaces=True)
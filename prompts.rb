#!/usr/bin/env ruby

INTRODUCTION = """
    Welcome to the Arena. This app is inspired by MUDs (text based
    roleplaying games) and uses ChatGPT to generate a description
    and statistics for your fighter and an opponent of your choosing.
    Watch them battle and see who wins!
"""

FIGHT_INTRODUCTION = """
    We will now witness an epic battle between your fighter and opponent!
"""


Q_NAME = """
    What is your %s's name?
"""

Q_DESCRIPTION = """
    Describe your %s in a few words, such as 'a black cat' or 
    'a musclebound warrior with a horned helmet.' The arena will dream
    up a more elaborate description from there.

    How would you describe your %s?
"""
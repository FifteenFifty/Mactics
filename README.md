Mactics
=======

A World of Warcraft addon for printing raid tactics.

Design
======

Mactics is designed to be a lightweight, easy-to-use addon that makes group
life much easier. Tactics are loaded when needed and not unnecessarily held
in memory.

How do I use it?
================

Simply target a raid boss, and type **/mct**.

No boss? No problem. **/mct** bossname will print tactics for that boss,
providing that you are in the instance.

*I don't want to print the tactics to raid chat, this tier has been out for
three months, I should know the tactics!* **/mct** self prints tactics for
your eyes only.

How does it work?
=================

When you issue the **/mct** command, a honey bee refracts the light of the
sun onto the back of a horse. When the refracted light hits this horse, it
feels an uncontrollable urge to dance. The horse is stood on top of a giant
keyboard, and her dance just so happens to type in the correct tactics for
the boss you're **/mct** ing.

If you don't believe that, Mactics uses a pseudo-plugin architecture to load
tactics based on the instance you're in. This ensures that functionality is
delivered quickly when needed, but overall impact is minimal.

Can I contribute my own tactics?
================================

We at Mactics would like nothing more than for the community to contribute
better, and newer, tactics to Mactics. Either submit them as a patch to the
git repo at https://github.com/FifteenFifty/Mactics, or PM them to a
developer!

Using the data directory
------------------------
Files in the data directory should be named as the identifier of the zone to
which they apply. For the current list of map IDs, see
http://wowpedia.org/MapID.

For an example of file content, see the data/template file.

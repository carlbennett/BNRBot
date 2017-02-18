# BNRBot
## Summary
**B**attle.**N**et **R**ealbasic **Bot** is a [Classic
Battle.net&trade;](http://classic.battle.net) chat bot written by
[@carlbennett](https://github.com/carlbennett)
([Jailout2000](http://jailout2000.com)) and licensed under the
[GPLv3](https://www.gnu.org/licenses/gpl-3.0.en.html) license.

The project began in 2011, went on hiatus in 2012, and in late 2015 it was
added to version control on GitHub and received many updates. It's been
maintained on GitHub ever since.

Some of its bragging rights include:
- Handling heavy loads and floods in Battle.net&trade; chat channels.
- Compatible with official Classic Battle.net&trade;, PvPGN, emNet,
  [init 6](http://wserv.org/), and other custom servers that implement the
  Battle.net&trade; binary chat protocol.
- Runs on Windows XP up to Windows 10.
- Multiple profiles and switching via tabbed (actually a list box) interface.
- A custom user interface with little clutter in the main chat window.

Give it a try!

## Installation
1. Go to the
   [latest release](https://github.com/carlbennett/BNRBot/releases/latest).
2. Download BNCSUtil, BNRBot, CheckRevision, and Hashes. (You can skip some of
   these if you already use BNRBot.)
3. Extract BNRBot into its own directory, anywhere on your PC will do.
4. Extract BNCSUtil and CheckRevision into your `C:\Windows` directory or into
   BNRBot's directory.
5. Extract Hashes into BNRBot's directory under its own `Hashes` directory.
6. Open BNRBot and read the information it gives you.

## Open-source
With the use of GitHub, this bot is open-source to the general public. All bot
releases are also made using GitHub too. If you find a bug, make sure you
[open a new issue](https://github.com/carlbennett/BNRBot/issues/new), and feel
free to try to fix it yourself. If not, your issue will be worked on by someone
who can address it.

Thanks for contributing!

### Real Studio
If you wish to contribute, you will need to run **Real Studio 2012r2.1**. All
code changes are made within the IDE, which is why a lot of the commits and the
code in general looks pretty awful; it's actually not too bad when viewing from
within the IDE. Real Studio does pre- and post-formatting when reading and
writing files, so it's not really easy to beautify the code from a Git/GitHub
perspective.

+------------------------------------------------------------+
| PowerPro 3.6 Syntax Highlighter for Gvim 6.1               |
+------------------------------------------------------------+

NOTES:

At one time I had lofty goals for this, but I'm afraid it's nothing more then
a train wreck. And I'm not at all inclined to clear the tracks. Basically, this
syntax file is keyword only orientated. Nothing at all fancy about it. Oh
what shame...

1 - Syntax highlighting for top level commands now works with or without
    the asterisk.

2 - Hardly anything is contained and nothing is properly contained. This means
    highlighting will appear pretty much everywhere. Namely, in places where
    it shouldn't. Also, keyword values of the same names (clip or assign) that
    can appear as a top level command as well as in an expression will be
    highlighted incorrectly. Priority in Gvim is given to the last declared
    statement. Therefore, something you thought you'd see colored as a
    command, may end up getting colored like a function. Currently, top level
    commands now get priority. Same name keywords *will* recieve the top level
    command highlighting.

3 - Operators, Mouse and Keys stuff? Forget it.

4 - A half hearted attempt to help the user script properly was left in.
    Basically, any reference to a drive and path that has a space somewhere in
    it will be flagged as an error. Because Powerpro doesn't enforce double
    quoting across the board, you'll most likely see it showing up where it
    shouldn't. To avoid this you have two choices. Put all file paths in
    double quotes (you should be doing this anyway) or comment out the line in
    the syntax file. It's just before the keyword definitions.

5 - Can handle labels properly.

6 - Capable of handling Plugin calls. Currently up to snuff with 3.6 only.

7 - Added a nifty Gvim style commenting feature.

8 - Numbers highlighting still not quite right. A collision of sorts happens
    when iskeyword set with (*).


INSTALLATION
============

To make use of this syntax file place "powerpro.vim" in one of these two
directories:

1. [Drive][Path]\vim\vim61\syntax\
2. [Drive][Path]\vim\vim61\vimfiles\syntax\ (Recommended)

Place the FTP_powerpro.vim file in one of these to directories:

1. [Drive][Path]\vim\vim61\ftplugin\
2. [Drive][Path]\vim\vim61\vimfiles\ftplugin\ (Recommended)

Rename this file to just powerpro.vim. (get rid of the FTP_ part)

Next, the auto-command needs to be setup so that Gvim can automatically apply
the highlighting whenever you load in or create an external PowerPro Script.
Both the syntax file and the auto-commands are designed to work with script
files identified by the ".powerpro" extension. PowerPro should have already
created this file-type extension for when you first installed the software.

Place this line in one of any configuration files you might have.

autocmd BufNewFile,BufRead,Bufnew *.PowerPro setf PowerPro

1. [Drive][Path]\vim\_vimrc (No File Extension) (placing it here WILL work)

You can also try putting the line in one of these. I believe the last file is
indeed sourced from within the _vimrc file.

2. [Drive][Path]\vim\vim61\gvimrc_example.vim
3. [Drive][Path]\vim\vim61\vimrc_win32.vim

Should you be one of those that prefers to use the ".txt" extension for
PowerPro scripts, you'll need to call the syntax file manually. This can be
done by typing the following into Vims command line.

:set syntax=PowerPro

Good luck!

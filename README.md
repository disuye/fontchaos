# Font Chaos
Processing animation that displays some text using random fonts for each letter, each frame.

![https://github.com/disuye/fontchaos/blob/main/FontChaos.gif](https://github.com/disuye/fontchaos/blob/main/FontChaos.gif "Font Chaos demo GIF")

# The Fonts?
Fonts are not included! You'll have to use your imagination about gathering a collection from somewhere.

# Functionality
Parses the text into characters, removes duplicates. Checks every font to see if they contain all of the glyphs required to display all the characters.

All fonts deemed OK are used during the animation (a list of OK fonts is saved as theWord.DAT). All fonts missing the required glyphs are ignored. 

If you run a sketch again using the same text, the font check routine is skipped and the DAT file used instead. Much quicker. Multiple DAT files are created, see the folder named 'previous/'. 

# Installation
Fonts *do not* need to be installed on your system. Simply collect all the OTF/TTF fonts you want into a dedicated folder, preferably somewhere easy to reach like your Desktop. Font Chaos will *only* access fonts from that one specific folder.

# Edit These Variables
```java
String theWord = "# font chaos !";
int sizeWidth = 1100;
int sizeHeight = 800;
int frameRate = 24;
String fontFolder = "/Volumes/macOS/Users/disuye/Desktop/Font-Collection/";
String projectFolder = "/Volumes/Evo2/processing/fontsmash/";
```

# To Do
- Morphing between glyphs.
- Multi line text and paragraphs.
- A smart way to scale font size & transform placement on screen.
- Refactor. I'm still a noob.

# Language Support
Supports just about any language you throw at it, within reason.

![https://github.com/disuye/fontchaos/blob/main/disuye.gif](https://github.com/disuye/fontchaos/blob/main/disuye.gif "Font Chaos demo GIF showing Chinese characters")

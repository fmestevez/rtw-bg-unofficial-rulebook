<div align="center">
  <h1>Rome Total War: The Board Game<br>Rule Book Rewrite Project</h1>

  <p align="center">
    <img src="https://img.shields.io/badge/latex-%23008080.svg?style=for-the-badge&logo=latex&logoColor=white">
    <a href="https://discord.gg/Y4uM9pPWF6"><img src="https://dcbadge.limes.pink/api/server/Y4uM9pPWF6"></a>
  </p>
</div>

**Join us [on Discord](https://discord.gg/rZ7rfuX7) to help with translating or just to get in touch!**

<details>
<summary>Click to see the details regarding every version</summary>

🪨 Stable release is the latest one officially released.
It should be free of any major issues.<br>
⚗️ Experimental builds are made from the main branch every time a new change is introduced.
You can expect things to break, like having incorrect layout or not all the text translated.

🖥️ The digital build is intended to be read on electronic devices.
It has convenient hyperlinks that navigate you around the text.<br>
🖨️ The printable build introduces the following changes:
 - appends page numbers to clickable hyperlinks (stable) 👆
 - includes an index page at the end (stable) 📋
 - makes sure the document has 56 pages (stable) 🪄
 - makes margins asymmetric for easier binding/glueing (experimental) 📕
 - uses [CMYK](https://en.wikipedia.org/wiki/CMYK_color_model) (experimental) 🎨

all of which to be print friendly.
Best served for those who would like to have it on paper 🤞<br>
🤑 The economy printable build has **no art backgrounds**. Other than that, it's the same as the regular printable build.
This is for people who want to save their toners or don't have printers that can print edge to edge where the white borders around the art backgrounds don't look that good.
</details>

### 💡 What Is This?

This project aims to rewrite the original rule book, in which the amount of vague language was just too vast to ignore.
Its aim is to explain the rules clearly and concisely, and should eventually have an answer for any basic rules query you might have.

### 🤔 Why?

Please see the original thread on [BoardGameGeek](https://boardgamegeek.com/thread/3426675/rulebook-rewrite-project).

The content in the official English rule book is, simply put, insufficient as a teaching tool for the game or as a general rules reference.
If you read the thread linked above you should understand how frustrating this has been for me.

### 🛠️ How?

This is a communal effort.
This repository serves both as a means to preserve the work, but also for others to contribute to it as writers, proofreaders, or layout designers.

### 💪 Contributing

Please discuss any and all factual errors, bad language or other errors you've found.
You can do this by opening issues/PRs with suggestions, writing in the BGG thread, or joining us [on Discord](https://discord.gg/khV8Ckw8RD).

### 🔮 The Future

All new version of the rule book and their change logs will be published here and in the BGG thread.

## 💻 Local Development

To work on the document on your machine, you need the following:

- [**MiKTeX**](https://miktex.org/) for Windows, [**MacTeX**](https://www.tug.org/mactex/) for MacOS, [**TeX Live**](https://www.tug.org/texlive/) for Linux (required) to build the PDF file from LaTeX files
- [**Inkscape**](https://inkscape.org/) (required) to render glyphs in the document (while installing on Windows, make sure to tick `Add Inkscape to the System Path` option)
- [**TeXstudio**](https://www.texstudio.org/) (optional) to edit LaTeX files and rebuild the PDF file quickly
- [**po4a**](https://po4a.org/index.php.en) (optional) to work on translating the document to other languages
- [**pdftoppm**](https://linux.die.net/man/1/pdftoppm) (optional) to make screenshots of rendered PDF pages
- [**ImageMagick**](https://imagemagick.org/index.php) (optional) to combine screenshots into convenient diffs
- [**ghostscript**](https://www.ghostscript.com/) (optional) to optimize PDF file sizes
- [**GIMP**](https://www.gimp.org/) or [**Krita**](https://krita.org/) (optional) to edit some images in `assets` directory

<details>
<summary>Click to learn about the technicalities</summary>

To build the document in English, either run this in the command line:

```bash
latexmk -pdf -silent -shell-escape "main_en"
```

or use the script:

```bash
tools/build.sh
```

or press the `Build & View` ▶️ (F5) button in TeXstudio on the `main_en.tex` file.

To build the document in any language (currently, `pl`, `es`, `fr`, `ru`, `ua`, `de` `cs`, and `he` are supported, `en` is the default), make sure you have `po4a` (version 0.70 or higher) and use the script:

```bash
tools/build.sh <LANGUAGE>
```

or press the `Build & View` ▶️ (F5) button in TeXstudio while having any `main_<LANGUAGE>.tex` file open, after running `po4a` (see `Translations` below for details).

To build the printable version in a given language, make sure you've built a regular one first at least once.
Then, use the script:

```bash
tools/build.sh <LANGUAGE> --printable
```

To make a printable version without any background images, add `--no-bg` flag

```bash
tools/build.sh <LANGUAGE> --printable --no-bg
```

### 🌍 Translations

<details>
<summary>Click to see details</summary>

Make sure you have [`po4a`](https://github.com/mquinson/po4a) installed.

To translate a particular section:

- Go to `translations/<section_name>` and open `<lang>.po` file, e.g., `translations/introduction.tex/pl.po`
- Choose a fragment to translate. Those start with `msgid`. Write your new text in the line below starting with `msgstr`. Example:

    ```po
    msgid "\\addsection{Introduction}{\\spells/magic_arrow.png}"
    msgstr "\\addsection{Wprowadzenie}{\\spells/magic_arrow.png}"
    ```

  This text (`msgstr`) will replace the original (`msgid`) in your translation.
- Rebuild using the script:

   ```bash
   tools/build.sh <LANGUAGE>
   ```

- Commit and repeat!


#### Finding fuzzy translations

In case an already translated text is changed, `po4a` marks such a translation as _fuzzy_ in the `*.po` files.
Those excerpts will be compiled just as they are in the original (English), until the translation is corrected, and the _fuzzy_ mark is removed.
To facilitate finding them, use the script:

```bash
tools/find_fuzzy.sh <lang>
```

It will show all the fuzzy translations in the `*.po` files for the specified language.

</details>

### 📸 Screenshots

<details>
<summary>Click to see details</summary>

It is a good practice to share screenshots of your work in pull requests.
You can the script to make PNG images of specified page(s):

```bash
tools/pdf2image.sh <LANGUAGE> <FIRST_PAGE> <LAST_PAGE>
```

Example:

```bash
tools/pdf2image.sh en 5 7
```

To process a single page, use:

```bash
tools/pdf2image.sh en 5
```

Screenshots will appear in ignored `screenshots` direcotry, in the form of `en-05.png`, `en-06.png`, etc.

#### 🎭 Comparing two pages side by side

If you'd like to show a single image of two instances of the same page side-by-side (before|after style), you can use the following script:

```bash
tools/compare_pages.sh -l <language> -r <range> [OPTIONS]
```

The script takes local `main_<language>.pdf` that you built and which contains your changes and compares it with the latest build
of the same language in this repository (e.i. the baseline).

Imagine you want to compare pages 1, then range from 5 to 7, and page 30 in English version. Here's how to use it:

```bash
./tools/compare_pages.sh -l en -r 1,5-7,30
```

It will produce the following files in the `screenshots` directory: `en-01.png`, `en-05.png`, `en-06.png`, `en-07.png` and `en-30.png`.

Open help for more examples and detailed description:

```bash
tools/compare_pages.sh -h
```

**This script requires `pdftoppm` and `imagemagick` utilities.**

</details>

### 🗠 Optimizing PDF files

<details>
<summary>Click to see details</summary>

To reduce output PDF file size significantly, you can use the script utilizing `ghostscript` utility:

```bash
tools/optimize.sh <LANGUAGE>
```

It will output `main_<LANGUAGE>_optimized.pdf` file.

As of writing, for English it produces 24 MB `main_en_optimized.pdf` file without noticeable drop in quality compared to 80 MB `main_en.pdf` built by LaTeX.

</details>

</details>

## ✨ Assets

All assets come from publicly available sources.
Some of the images in the rule book (all in the [`assets/examples`](https://github.com/Heegu-sama/Homm3BG/tree/main/assets/examples) directory as of writing) were generated by [GIMP](https://www.gimp.org/).
Their respective XCF files reside in [`assets/gimp-files`](https://github.com/Heegu-sama/Homm3BG/tree/main/assets/gimp-files) directory.

## Star History

<a href="https://star-history.com/#Heegu-sama/Homm3BG&Date">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=Heegu-sama/Homm3BG&type=Date&theme=dark" />
    <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=Heegu-sama/Homm3BG&type=Date" />
    <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=Heegu-sama/Homm3BG&type=Date" />
  </picture>
</a>

## 🛡️ Other Community Projects

- [Fan-Made Mission Book](https://github.com/qwrtln/Homm3BG-mission-book)
- [Board Game Cards Databse](https://github.com/Mirzipan/Homm3_BG_Database)

---
created: 2023-05-31T14:39:33.144Z
modified: 2023-06-02T19:10:43.921Z
tags: [data,file,system,organize,structure,curate,ingest,guideline]
---
# Filesystem Structure Plan for my Data

This is my plant for my filesystem structure.
This will reside primarly in my main NAS and backed up in various ways.
But this will be synchronized to other servers and end-use devices as well.

Remember to read some of
the [documentation on the guidelines for this structure][-fs-struct].

## The Plan

### Top Level Subdirectories

#### Inbox

#### Work

#### Personal

* inbox
  * in-progress - *(links to files/directories that require ongoing work)*
* work - *(work related files organized by client or employer)*
  * AVG
    * BMD
  * john-doe *(example freelance client)*
* personal *(about me specifically)*
  * projects - *(personal projects)*
    * *has its own section*
  * notes
    * *has its own section*
  * legal
  * finance
    * receipts
    * invoices
    * budgets
    * assets
  * blog
  * journal - *(merge under notes?)*
  * memories
    * camera - *(includes photos and videos)*
    * loved-ones - *(sent from loved ones to me)*
  * content - *(DJ stuff, audio engineering, patches, stems, recordings etc.)*
    * dj - *(DJ library, set lists, categorized playlist files, stems, etc.)*
    * daw
      * patches
      * stems
      * tracks
      * samples
      * vst
      * recordings
    * screen-shares
      * screenshots
      * screen-recordings
* culture - *(think of it as consumable files about media content)*
  * music
  * indie - *( content from independent creators, incl. podcasts tracked here)*
    * *CREATOR*
      * *PROJECT*
        * Content files from project
      * *CHANNEL OR SITE*
        * *Note this is the structure for most podcasts that podcatchers will use*
        * *CONTENT FILES*
    * memes - *(images, videos, audio, text involving memes)*
  * movies
    * *MOVIE NAME (YEAR)*
      * *CONTENT FILES*
  * syndicated - *( syndicated content from commercial studios )*
    * *SERIES NAME (YEAR)*
      * *SEASON*
        * *EPISODIC CONTENT FILES*
  * literature - *(any text based entertainment)*
    * books
    * comics - *(incl. manga)*
    * articles - *(incl. blog posts, news articles, etc.)*
    * magazines
    * site - *(web pages, blogs, social media, etc.)*
      * *has its own section*
  * art
    * *(needs work)*
    * photography
      * wallpapers
      * paintings
    * ads
    * posters
  * documentaries
* reference - *(reference files like manuals, academic papers, non fiction books, documentation)*
  * *NOTE: needs work*
  * documentation
  * manuals
  * spec-sheets
  * research
  * courses
  * wikis
    * games
      * *title name*
* archive - *( a less organized category for files that won't be manipulated or consumed frequently)*
  * software - *(software installs, patches, mods, etc.)*
    * documentation
    * games - *(game installs, patches, mods, saves, configs, etc.)*
      * *GAME NAME*
        * mods
        * content - *(the game content and software files to install/run the game)*
          * backups - *(backups of the game content and software files)*
        * saves
          * *(archives, direct save files by date, etc.)*
        * configs - *(configs for the game as archives, files all by date)*
    * systems - *(operating systems, running system backups, etc.)*
      * isos - *(iso / image files for operating systems)*
      * backups - *(backups of operating systems that did or are running)*
        * db - *(database backups)*
        * containers - *(container backups)*
        * vms - *(virtual machine backups)*
        * secrets - *(encrypted backup of secrets like passwords, keys, etc.)*
          * *(must have 2FA to access)*
      * logs
      * metrics
      * configs - *(backups of configurations for operating systems)*
    * apps - *(applications, installers, patches, etc.)*
      * *APP NAME*
        * *CONTENT FILES*
  * web - *(backups of web content, including social media, static sites, etc.)*
    * *SITE NAME*
      * *CONTENT FILES*
  * audio - *(audio backups, including music, podcasts, etc.)*
    * *TBD: Basically audio files that are not so structured*
  * literature - *(text based backups)*
    * reference
      * spec-sheets
      * documentation
    * fiction
      * novels
      * short stories
      * comics

## References

### Web Links

<!-- Hidden References -->

### Note Links

* [Filesystem Structure Guidelines][-fs-struct]

<!-- Hidden References -->
[-fs-struct]: filesystem-structure-guidelines.md "Filesystem Structure Guidelines"

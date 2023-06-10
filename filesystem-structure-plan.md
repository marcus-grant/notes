---
created: 2023-05-31T14:39:33.144Z
modified: 2023-06-10T18:04:54.788Z
tags: [data,file,system,organize,structure,curate,ingest,guideline]
---
# Filesystem Structure Plan for my Data

This is my plant for my filesystem structure.
This will reside primarily in my main NAS and backed up in various ways.
But this will be synchronized to other servers and end-use devices as well.

Remember to read some of
the [documentation on the guidelines for this structure][-fs-struct].

## The Plan (Tag & Activity Based Flat Hierarchy)

### Top Level Subdirectories for Tag-Based Organization

This plan will involve a flat hierarchy of directories.
The few directories that do exist will
mostly revolve around the level of activity that each
file will have.
There will be a few of these directories below:

* Inbox
  * This is where all files will be placed when they are first ingested.
  * Files here need to be tagged and moved to their activity level.
  * It will also have subdirectories to symlinks to files that are
    currently being worked on.
* Active
  * Some synonyms to consider so it doesn't share a first letter as `archive`:
    * `current`
    * `working`
    * `ongoing`
    * `in-progress`
    * `live`
    * The best are `current`, `ongoing`, `live`.
  * This is where all files that are currently being worked on will be placed.
  * Files here should already be tagged and ready to be worked on.
  * They could also have their tags and metadata altered during the course of
    the work being done on them.
  * This will generally be files that exist mostly on
    the fastest storage available.
  * It's also the data most likely to exist on local machines.
    * This means synchronization will be especially important here.
    * It also means caching or tiering systems are the most important here.
* Archive
  * This is *potentially* the lowest level of activity files go.
  * There might need to be a distinction between files that are:
    * being archived for **cold** long-term storage and files that are,
    * being archived for long-term storage, but need to be read occasionally.

### ChatGPT Suggestions for Activity Level and Tagging Based Storage

>ME:
>I’m trying out a new file store system where
>I use a more flat storage hierarchy or really no hierarchy.
>I do want to separate the files somewhat though mostly by
>the level of activity of the file.
>An inbox to tag and eventually move the file.
>Then an active folder for files currently being worked on.
>Also an archive for files that I want to keep around and
>infrequently consume or work on (mostly consume).
>I’d also like a tier of activity between actively being worked on
>files and an archive, what would you suggest?
>
>GPT:
>It sounds like you've already thought through some useful categories based on
>the frequency of file usage and their life cycle.
>You've mentioned an "Inbox", an "Active" folder, and an "Archive".
>For the tier of activity between active files and the archive,
>you might consider the following options:
>
>1. **Reference**:
>These would be files that aren't currently being actively worked on but
>are referred to on a semi-regular basis.
>These could be useful guides, resources, or source documents you need to
>access more frequently than archived files.
>2. **Review**:
>Files that aren't actively being edited or added to but still need to
>be reviewed or revisited from time to time would fit well in this category.
>3. **Pending**:
>This folder could hold files that are waiting for some action from
>others before they can be moved to the active folder or the archive.
>4. **Semi-active**:
>This can include files that you don't use every day but
>are needed from time to time, such as once a month or once a quarter.
>5. **Hold**:
>Files that have been worked on recently but are on hold,
>perhaps because they're part of a larger project that's temporarily paused,
>or you're waiting for more information or input.
>6. **Backlog**:
>For items you're not actively working on now but
>plan to work on in the future.
>
>Remember,
>a good filing system is one that matches your workflow and
>makes sense to you, so feel free to modify these suggestions or
>come up with your own to fit your specific needs.

## The Plan (Purposeful Hierarchy)

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

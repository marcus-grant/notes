---
created: 2023-05-31T10:29:50.369Z
modified: 2023-05-31T14:47:41.722Z
tags: [data,file,system,organize,structure,curate,ingest,guideline]
---
# Filesystem Structure and Organization

## Getting Started

### Find Groupings of Files

One of the first steps to organizing files in
a coherent and maintainable manner,
is to find groupings of files that are related.
They can be related by:

* Time
* Purpose
* File Type
* File Content
* Authors and Collaborators
* Recipients
* Programs that ingest them
* Programs that modify them

### Planning

Once you have a list of groupings,
you can start planning how to organize them.
You can do this by reading some of the [Structure Rules](#structure-rules) below.

>**Note:** More than planning a good structure,
>it's **even more important to stick to the plan**.

## Structure Rules

### Inbox

There should always be one place for a user to have an inbox directory.
Preferably outside of the root directory of the curated file tree.
As the name implies this is where a lot of new files will first end up and
be worked on.

Then preferably several times a day,
that directory is checked on for new files to be moved into their proper place.
If it's ongoing work that's being done,
then perhaps consider [linking](#file-links) the file into its proper place and
continue work on the file or directories with the link in the inbox.

**Crucially** once work is done on a file,
be it after moving it to the right place or
after work is done on a linked file in the inbox,
the file should be deleted from the inbox.

>This is one of the keys to staying organized.
>If you let your “Inbox” overflow
>(i.e. allow there to be more than, say, 30 files or folders in there),
>then you’re probably going to start feeling like you’re overwhelmed:
>You’re not keeping up with your to-do list.
>Once your Inbox gets beyond a certain point
>(around 30 files, studies have shown),
>then you’ll simply start to avoid it.
>You may continue to put files in there, but you’ll be scared to look at it,
>fearing the “out of control” feeling that all overworked,
>chaotic or just plain disorganized people regularly feel.
>[(How-To Geek 2017)][howtogeek2017]

#### Pruning the Inbox

Here are some tips to keep the inbox directory manageable:

* Visit the inbox regularly.
  * At least 4 times a day if you're on your computer during that time.
* Scan the folder regularly for files that you have completed working on.
  * If they're ready,
    * File them away **immediately**.
* If a file has been sitting in the inbox for a long time...
  * Admit it, you're probably not getting around to processing it...
    * Maybe it's time to do it now?
    * Or maybe it's just not that important
      * Delete it!
  * It's kind of personal preference but I'd say 2 months is a good time frame.
* Make it a source of pride to keep the number of files in here as small possible.
  * If you value peace of mind,
    * Then keeping this directory nearly empty should be a priority.

### Short Filenames

Files should have short filenames.
This makes them way easier to find and work with.
Contextual information should be present in the directory structure of the file.
If the filename is spanning 50+ characters,
if might be time to reconsider its parent directory and
moving it down into a nested sub-directory with information about the file.

For example, a file named `apple-sales-figures-2020.xls`,
might be sharing a directory with a file like `microsoft-q1-2020-balance-sheet.xls`.
In this case we'd create a directory path `work/clients/apple/sales/2020.xls` and
`work/clients/microsoft/balance-sheets/2020/q1.xls` respectively.

>**NOTE**: There are some important exceptions to consider.
>For music files in a music collection it might be important to
>have the artist, song name, album, bpm, etc. in the filename.
>Some programs can't read metadata from the file and
>instead rely on the filename to get information about the file.
>Some audio files might not even support meaningful metadata at all.
>Don't overdo it with this rule,
>but make it the default rule for most files.

### Purppose Based

>If you have, for example a folder called `Work/Clients/Johnson`,
>and within that folder you have two sub-folders,
>Word Documents and Spreadsheets
>(in other words, you’re separating “.doc” files from “.xls” files),
>then chances are that you’re not optimally organized.
>It makes little sense to organize your files based on
>the program that created them.
>Instead, create your sub-folders based on the purpose of the file.
>For example,
>it would make more sense to
>create sub-folders called Correspondence and Financials.
>It may well be that all the files in a given sub-folder are of
>the same file-type,
>but this should be more of a coincidence and
>less of a design feature of your organization system.
>
>-- [(How-To Geek 2017)][howtogeek2017]

So to summarize the above:

* Organize your files by purpose.
  * **Not** file type  
* A lot of file types will correlate with purpose anyways
* If you have files that have the same purpose, [link them](#file-links).
* If a purpose starts becoming too large, break it into more nested sub-directories.
* If a purpose starts becoming related to [time](#time-based)...
  * Start sub-directories organized by intervals of times like years.
  * For example `Personal/Finance/2020/`

### Time Based

We've already encountered the idea of organizing files by time.
When discussing [purpose based](#purpose-based) organization rules,
we mentioned that if a purpose starts becoming related to time,
then you should start organizing files by time.
Basically,
once grouped files start differing by time,
it's probably good to split them into some **time-based interval**.

Take as an example, camera photos.
You might group all photos you captured yourself into a directory like,
`personal/photos/<YEAR>/`.

Now, you have all your own taken photos organized by year.
You might even want to go further if there's enough photos by
splitting each year subdirectory into months.
For example, `personal/photos/2021/05/`.
Then each file would be [timestamped](#timestamps) with the date and time.
Like so `personal/photos/2021/05/2021-05-31-12-29-56Z.jpg`.

#### Timestamps

When the time is especially important for the file,
the filename should probably have a properly formatted UTC timestamp.
The [ISO 8601][-iso8601] format is a good choice.

It's probably also good to use the UTC timezone in the timestamp if
the files are are often made within hours of each other.
This is because great confusion can occur about the time-based order of files when
the timezone is not specified.
UTC provides a global reference to pin it down to.

Another good use for timestamps within the filenames themselves is that
it makes it easy to sort files by time.
Lexical sorting is supported by almost any file browser and
using the ISO 8601 format makes it easy to sort files by time when lexically sorting.

### File Links

Sometimes categorizing files is hard because
typical filesystems have a failry strict hierarchical structure.
This means that a file can only be in one place at a time.
[File links][-file-link] are a way to get around this.
They let you create references to files located elsewhere that
[the operating system][-os] makes appear as if it's another copy of the file.
However, only one copy of the file is ever stored.

## My Plan

### Root Structure of my File Store

Wherever the root structure of this filesystem is,
it should generally be following [this planned file structure][-fs-struct-plan].
It will also be synced to other servers to preserve the structure, timestamped and back it up.
It will also be synced to devices that will either consume or manipulate that data.

## References

### Web Links

* [How-To Geek. 2017 "Zen and the Art of File and Folder Organization"][howtogeek2017]

<!-- Hidden References -->
[howtogeek2017]: https://www.howtogeek.com/15677/zen-and-the-art-of-file-and-folder-organization/?utm_source=pocket_saves "How-To Geek. 2017 \"Zen and the Art of File and Folder Organization\""

### Note Links

* [Operating System][-os]
* [File Link][-file-link]
* [ISO 8601][-iso8601]
* [My Filesystem Structure Plan][-fs-struct-plan]

<!-- Hidden References -->
[-os]: os.md "Operating System"
[-file-link]: file-link.md "File Link"
[-iso8601]: iso8601.md "ISO 8601"
[-fs-struct-plan]: filesystem-structure-plan.md "My Filesystem Structure Plan"

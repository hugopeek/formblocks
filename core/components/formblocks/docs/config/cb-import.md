## Import the necessary ContentBlocks layouts & fields

Unfortunately, the installer can’t add the necessary CB elements for you, so you’ll have to import them manually. There are 2 ways of doing this:

- Import through XML files, using ContentBlocks CMP
- Import through _data files, using Gitify

### Import through XML

To import the XML files, simply look inside the package in the core/components/formblocks/_import/ folder. There, you’ll find 2 XML files, 1 for layouts and 1 for fields. Download them if they are not on your computer, because you’ll need to be able to browse to them during import.

> The import files don’t have any ID’s attached to them, and depending on the Import mode you select, CB should leave your existing elements alone too.. But better safe than sorry, so please create an export first before proceeding!

On import: navigate to the file on your machine, and select Insert as import mode. You should see your new layouts and fields in the grid after this.

### Import through Gitify

To import with Gitify, simply add the files in core/components/formblocks/_data/ to the cb_fields and cb_layouts folders in your project _data folder. The new elements will then be added on the next gitify build.
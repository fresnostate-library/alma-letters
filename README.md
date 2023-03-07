# README #

This repository holds the required XML files and configuration data to construct the patron letters/emails sent by Ex Libris' [Alma](https://exlibrisgroup.com/products/alma-library-services-platform/). This information is mainly contained in [XSL](https://www.w3.org/Style/XSL/WhatIsXSL.html) and [INI](https://www.partitionwizard.com/partitionmanager/ini-file.html) files which can be opened with a plain-text file editor.

This code repository is being shared publically so that others can see how we manage content changes and to facilitate a possible discussion for improvement of the verbage and language used within the letters/emails.

## How to I get to the letter configuration pages in Alma? ##

There are two related sections of the Alma application that contain the various parts which influence the content and styling displayed in the letters/emails:

* __Letters Configuration:__ This holds the XSL (text and logic) stylesheets which pieces together a letter from content variables and reusable components.
* __Components Configuration:__ This holds the reusable blocks of XSL content for inclusion in the letters, so that headers and footers look consistant.

You can navigate to these sections by:

1. Log in to [Alma](https://alma.lib.csufresno.edu)
2. In the vertical Site Navigation on the left-side of the page, click the "Open Alma Configuration" icon on the bottom (or press CTRL+ALT+C).
3. Use the new vertical Site Navigation on the left-side of the page to click the "General" icon (near the bottom of the list), which opens a modal or fly-out menu.
4. Select either the *Letters Configuration* or the *Components Configuration* link from the __Letters__ section in the right-most column.
5. Implement your code changes, by selecting *horizontal ellipses* menu, in the right-most column of the item of interest, and choosing __Edit__.
6. You will probably paste your code into the __XML field__ found on the *Templates* tab at the top of the resulting page.

## File Naming and Formatting ##

Each XSL and INI file is named identically to what is in Alma, but has all the spaces removed. (For example, the "Borrowing Activity Letter" has two associated files, which are "BorrowingActivityLetter.xsl" and "BorrowingActivityLetter.ini" respectively.) To keep our code files consistent, the following criteria should be met before submitting file changes:

* [Indentation](https://kennethreilly.medium.com/tabs-vs-spaces-3c24defa7c9e): 4 spaces

* [File Encoding](https://blog.hubspot.com/website/what-is-utf-8): UTF-8

* [End of Line Sequence](https://www.aleksandrhovhannisyan.com/blog/crlf-vs-lf-normalizing-line-endings-in-git/): LF

## Resource Links ##

* [Configuring Alma Letters](https://knowledge.exlibrisgroup.com/Alma/Product_Documentation/010Alma_Online_Help_(English)/050Administration/050Configuring_General_Alma_Functions/070Configuring_Alma_Letters) article by Ex Libris

* [Configuring Letter Components](https://knowledge.exlibrisgroup.com/Alma/Product_Documentation/010Alma_Online_Help_(English)/050Administration/050Configuring_General_Alma_Functions/190Configuring_Components)

* [List of Alma Letters](https://knowledge.exlibrisgroup.com/Alma/Product_Documentation/010Alma_Online_Help_(English)/050Administration/050Configuring_General_Alma_Functions/070Configuring_Alma_Letters#Letter_List)

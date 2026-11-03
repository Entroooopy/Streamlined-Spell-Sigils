# Streamlined-Spell-Sigils
Code to make spell sigils for Dungeons and Dragons.
There are 2 parts to the process:

**1) Create the dataset**
Go to https://docs.google.com/spreadsheets/d/1ZUcmtD3t75dDSceyMWIIC1X1l7eTavTGkh7MqWxWi2o/edit?usp=sharing
Make a copy of it using File > Make a copy. It won't let you edit the sheet until you do.
Fill out the information based on the spell description. If you're unsure about something, leave it blank.
Go to the "data_for_r" tab of the spreadsheet. It will have automatically updated with your spell's information.
File > Download > Comma Separated Values. It should save to your Downloads folder.


**2) Graph the sigil**
Open R Studio. Install ggplot2, plyr, and stringr if you don't have them.
Fill out everything above the dividing line.
Run **all** of the code, including the stuff you just filled out.


The code just automates the methods found here: https://www.drivethrurpg.com/en/product/429711/the-spell-writing-guide?src=hottest_filtered&amp;affiliate_id=3673211

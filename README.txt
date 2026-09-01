SOURCE GENIUS v7.1.54 - SETUP ON A NEW LAPTOP
=============================================

There are TWO parts and you need BOTH. The extension on its own will run,
but it will be slow and produce mostly errors, because Amazon blocks reads
that come from inside the extension. The brand reader is a small program
that reads Amazon through real Chrome, and it is what makes the tool work.


BEFORE YOU START
----------------
The laptop needs two things installed:

  1. Google Chrome      https://www.google.com/chrome
  2. Node.js (LTS)      https://nodejs.org

Both are free. Install them first, then continue.


STEP 1 - START THE BRAND READER
-------------------------------
Double-click:  START-HERE.bat

The first run installs some files and takes a minute. After that it is
instant. Three small Chrome windows will open on their own - that is the
reader working. Do not close them.

LEAVE THE BLACK WINDOW OPEN while you work. Closing it stops the reader
and the extension goes back to being slow and error-heavy.

It is working when the black window shows:
  Brand browser #0 ready - real Chrome, profile ...
  Brand browser #1 ready ...
  Brand browser #2 ready ...


STEP 2 - LOAD THE EXTENSION
---------------------------
  1. Open Chrome and go to:  chrome://extensions
  2. Turn ON "Developer mode" (toggle, top right)
  3. Click "Load unpacked"
  4. Select the "extension" folder inside this folder
  5. Pin Source Genius to the toolbar and click it to open the side panel

Sign in with your team account and you are ready.


STEP 3 - SETTINGS THAT MATTER
-----------------------------
  Tabs at once ............ 6
      The reader handles 6 pages at a time. A higher number does not go
      faster - the extra workers just go bother Amazon directly and get
      the laptop blocked.

  Copies on this wifi/IP ... how many laptops are running Source Genius on
      the SAME internet connection. Set the SAME number on every laptop.
      Two laptops on one wifi = set 2 on both. Getting this wrong is the
      fastest way to get the whole connection blocked.


HOW TO TELL IT IS WORKING
-------------------------
In the Live Activity log you want to see lines like:

    Brand (local browser): "SomeBrand"

That means the reader is doing its job.

If instead you see a lot of:

    Brand not found on Amazon page
    Background fetch blocked - recovering brand via tab recovery

then the reader is not running. Check the black window is still open,
and restart START-HERE.bat if it is not.


IF SOMETHING GOES WRONG
-----------------------
Reader will not start
    Node.js is probably missing. Install it, then run START-HERE.bat again.

Chrome windows open but every read fails
    Close the black window, wait one minute, start it again. The reader
    keeps a login profile per laptop and sometimes needs a fresh one.
    You can also delete the folders named  .sg-brand-profile-0 / -1 / -2
    in your user folder (C:\Users\<yourname>) and it will rebuild them.

Lots of "Sorry" pages and CAPTCHA waits
    That connection has been rate-limited by Amazon. Lower "Tabs at once",
    make sure "Copies on this wifi/IP" is set correctly on every laptop,
    and give it 10-15 minutes to settle.

Extension seems stuck
    Go to chrome://extensions and click the reload arrow on Source Genius.
    Your queue and results are saved and it picks up where it left off.


SPEED YOU SHOULD EXPECT
-----------------------
Roughly 1000-1200 brands per hour per laptop with the reader running.
Without the reader, expect a few hundred at best and mostly errors.


TUNING (OPTIONAL)
-----------------
scraper\.env.example lists the settings you can change. To use it, copy it
to a file named  .env  in the same folder. The two worth knowing:

    SG_BRAND_BROWSERS     how many Chrome windows the reader opens (3)
    SG_BRAND_CONCURRENCY  pages per window (2)

3 x 2 = 6 reads at a time, which is why "Tabs at once" should be 6.
Raising these looks faster and measures slower - the pages start timing
out. Leave them alone unless you have a reason.

## Overview

For this exercise, you would create a console application that applies a batch of changes to an input file in order to create an output file. Let's call it the 'mixtape' application where given an input file which contains information about songs, playlists, and users, the application ingests a set of changes and produces an output file, which contains the changes applied to the input file. 

In the instructions below, we provide you with the input JSON file called `mixtape.json`. We also provide an example file that contains a sample set of changes `changes.json`. (In the Ruby project, these files are found under the `example` directory `example/mixtape.json` and `example/changes.json`).

You will write the code that processes the specified changes and outputs a new file. The sample `changes.json` contains the format of the supported changes (an array of hashes). As you can see, there are three types of changes to be processed: `add_song_to_playlist`, `add_playlist`, and `remove_playlist`. 


 If you choose to use this Ruby project, make sure to use `ruby 2.6.5`.

 To set up the project and install necessary gems, please run the command from root directory of this project: 

    $ bin/setup

 To run your application, run this command:

    $ bin/mixtape example/mixtape.json example/changes.json output.json

### Project Requirements

Here are the basic parameters for this exercise:

  1. This input JSON file consists of a set of users, songs, and playlists that are part of a music service: https://gist.githubusercontent.com/jmodjeska/0679cf6cd670f76f07f1874ce00daaeb/raw/a4ac53fa86452ac26d706df2e851fb7d02697b4b/mixtape-data.json. (This is exactly the same data in `example/mixtape.json`)
  1. Your application ingests `mixtape.json`.
  1. Your application ingests a changes file (an example file provided as `example/changes.json`). As seen in the file, the changes file includes multiple types of changes.
  1. Your application outputs `output.json` in the same structure as `mixtape.json`, with the changes applied. The types of changes you need to support are described below and the application should process all changes in order in one pass.
  1. Your solution includes a README that explains how to use your application as needed (if you decide to use a different language or if there are other necessary instructions to run your application).
  1. Don't worry about creating a UI, DB, server, or deployment.
  1. Your code should be executable on Mac or Linux.

As seen in `example/changes.json`, the types of changes your application needs to support are:

  1. Add an existing song to an existing playlist.
  1. Add a new playlist for an existing user; the playlist should contain at least one existing song.
  1. Remove an existing playlist.

If you decide to use this Ruby project, you would have to write code to implement `apply_changes` function under `lib/mixtape.rb`. 

Bonus:
  1. Add tests for your application. If you decide to use this Ruby project, feel free to update the `spec/mixtape_spec.rb`. There is a sample test provided called `spec/mixtape/cli_spec.rb` if you are curious on how to write rspec tests! 
     To run all tests, please run the following command:

          $ rspec
     
     To run a specific test:
     
         $ rspec <path-to-spec-file>
     
      e.g.
     
         $ rspec spec/mixtape/cli_spec.rb 
 
      or

         $ rspec spec/mixtape_spec.rb

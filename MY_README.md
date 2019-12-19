# My Readme

- The changes that would need to be made in order to scale this application to handle very large input files and/or very large changes files would be...
When thinking about scale, we must make considerations for memory, network, disk usage as the growth in files would require some potential changes in terms of structure of the data to allow for improved read/write access. Also,we could potentially cache (in-memory cache) the changes to be made to process more efficiently. Database storage would also help with the scalability of this application or using a static file host and to have a "worker" process that processes the changes offline.

## Running command

- To run your application, run this command:

    $ bin/mixtape example/mixtape.json example/changes.json output.json

# eea.docker.sdi-apache

Build instructions
------------------

Built automatically and uploaded to https://hub.docker.com/r/eeacms/sdi-apache/ when a change is
pushed to GitHub. To ensure that you always have an immutable build for production
you create a new tag in GitHub.

    $ edit VERSION file
    $ git ci -a
    $ git push      # Will create 'latest'
    $ version=$(cat VERSION)
    $ git tag -a $version -m "Release $version"
    $ git push origin $version


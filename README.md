# Redwood Tutorial App

This is an example of running Redwood with Docker. It is based off of the [Redwood Tutorial](https://redwoodjs.com/tutorial).


## Setup

For local developmentL

* ensure you have docker installed
* Install

```bash
git clone https://github.com/redwoodjs/redwood-tutorial
cd redwood-tutorial

# Build the images, and setup the db
scripts/docker.sh setup

# Run in the foreground
scripts/docker.sh run
```

#!/bin/sh

yarn rw prisma migrate dev && yarn rw exec seed

#!/usr/bin/python

from BeautifulSoup import BeautifulSoup
import sys

print BeautifulSoup(sys.stdin.read()).contents[6].contents[2].prettify()[7:-8]



#!/bin/bash
figlet URL2Dataset Scraper
read - "Enter URL To Populate A Dataset List Of URLS To Model:> " URLS
curl -s "$URLS" 
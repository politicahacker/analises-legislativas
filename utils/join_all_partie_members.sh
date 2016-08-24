#!/bin/bash
#
###############################################################################
# Copyright (C) 2016 Diego Rabatone Oliveira
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
###############################################################################
#
# To run this script you should be on a "root folder" on the same level as the
# "filiados_<nome_partido>_<estado>" folders
# So, the folder structure would be:
#    - current_folder
#      |
#      | - partido_xx_aa
#      | - partido_xy_bb
#      ...
# The script will generate a single "br_filiados.csv" file.
#
# IMPORTANT:
# To run this script on all parties and states it would take a long time.
#
# Data: http://www.tse.jus.br/partidos/filiacao-partidaria/relacao-de-filiados
#
###############################################################################
#

# Remove all PDF files from current folder and subfolders
#    to remove uncomment the line below
# find . -name '*.pdf' -delete

# Remove all "sob_judice" files from current folder and subfolders
#    to remove uncomment the line below
# find . -name '*sub_jud*' -delete

# Copy all correct CSV files to current folder
find . -name "filiados_*.csv" -not -name "*sob_jud*" -print0 | xargs -0 cp -t .

# Get the list of csv files on the current folder that would be read
FILES=`ls filiados*.csv`

# Convert all CSV files from ISO-8859-1 to UTF-8, generating new files
#    wich names began with 'utf8_'
for FILE in $FILES;
  do
    iconv -f 'ISO-8859-1' -t 'UTF-8' $FILE > utf8_$FILE;
done

# Gets the CSV header from one converted file and puts it on the final file
head -n1 `ls -1 utf8_filiados_*.csv | tail -n 1` >> br_filiados.csv

# For each CSV copy the content, without the header, to the final file
for FILE in $FILES;
  do
    tail -n+2 utf8_$FILE >> br_filiados.csv;
done

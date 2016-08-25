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

if [[ $# -lt 3 ]] ; then
    echo 'Argumentos: <diretorio> <ano> <nome>'
    exit 1
fi

DIR=$1
ANO=$2
NOME="$3-$2.csv"

# Get the list of csv files on the current folder that would be read
cd $1
FILES=`ls *.txt`

# Convert all CSV files from ISO-8859-1 to UTF-8, generating new files
#    wich names began with 'utf8_'
for FILE in $FILES;
  do
    iconv -f 'ISO-8859-1' -t 'UTF-8' $FILE > utf8_$FILE;
done

# For each CSV copy the content, without the header, to the final file
for FILE in $FILES;
  do
    cat utf8_$FILE >> $NOME;
done

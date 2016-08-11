# This file, rowdesc.gdb, is part of SPARQLverse and its purpose is documented below
# Copyright (C) 2012-2015 SPARQL City, Inc.
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at SPARQL City's option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# 
# SPARQL City Inc. is the original author of this material, unless otherwise noted below.
# Please send generally useful enhancements to SPARQL City in the form of all modified
# source files including an explanation of the changes.  For more
# information see our website at www.sparqlcity.org.
# 
# Do not remove or modify the license information above or the following
# SPARQL City source control information from this file.
# 
# SPARQLverse filename: rowdesc.gdb
# SPARQLverse version:  2.1.11
# Release date:         Wed Feb 25 12:19:25 2015
# 
# Row_desc debugging functions

# --------------------------------------------------------
# dump_rowdesc - dump a row descriptor's physical layout
#

define dump_rowdesc
set $rdesc = $arg0
set $numfields = $rdesc->m_num_fields
printf "     %-15s  %s  %7s  %4s  %s\n","type","N","physoff","bits","name"
printf "--------------------------------------------\n"
set $i = 0
while ( $i < $numfields )
  set $logical = $rdesc->m_fields[$i].m_logical_pos
  set $f = &$rdesc->m_fields[$logical]
  printf "%2d:  %-15s  %s  %7d  %4d  %s\n",$i,ColumnType_str($f->m_type),($f->m_optional) ? "*" : " ",$f->m_physical_offset,$f->m_encoded_bits,$f->m_name
  set $i = $i+1
end
printf "\n"
printf "     %-15s  %s  %7s  %4s  %s\n","type","N","physoff","bits","name"
printf "--------------------------------------------\n"
set $i = 0
while ( $i < $numfields )
  set $f = &$rdesc->m_fields[$i]
  printf "%2d:  %-15s  %s  %7d  %4d  %s\n",$i,ColumnType_str($f->m_type),($f->m_optional) ? "*" : " ",$f->m_physical_offset,$f->m_encoded_bits,$f->m_name
  set $i = $i+1
end
printf "\n"

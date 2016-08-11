# This file, pendingaborts.gdb, is part of SPARQLverse and its purpose is documented below
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
# SPARQLverse filename: pendingaborts.gdb
# SPARQLverse version:  2.1.11
# Release date:         Wed Feb 25 12:19:26 2015
# 
# display pending aborts

# --------------------------------------------------------
# pending aborts
# this script prints the pending aborts queued on the xnode
# --------------------------------------------------------

define pendingaborts

set $pending = Gsb->plans->m_abort_list
while ( $pending ) 
  set $abortcmd = (Abort_msg*)$pending->io.payload
  printf "pending abort for q=%d ",$abortcmd->query
  
  set $i=0
  set $p=(int*)($abortcmd->tasks)
  while ( $i < $abortcmd->numtasks )
    printf "task=%d ",$p[$i]
    set $i=$i+1
  end  
  printf "\n"
  set $pending = $pending->next_in_queue
end

set $pending = Gsb->plans->m_freelist
while ( $pending ) 
  set $abortcmd = (Abort_msg*)$pending->io.payload
  printf "completed abort for q=%d ",$abortcmd->query
  
  set $i=0
  set $p=(int*)($abortcmd->tasks)
  while ( $i < $abortcmd->numtasks )
    printf "task=%d ",$p[$i]
    set $i=$i+1
  end  
  printf "\n"
  set $pending = $pending->next_in_queue
end
end


# -------------------------------------------------------
# invoke the functions so that we can run these routines
# in gdb batch mode. namely:
#
#    "gdb -batch -x <this file> sbx <pid>"
#
# -------------------------------------------------------

pendingaborts

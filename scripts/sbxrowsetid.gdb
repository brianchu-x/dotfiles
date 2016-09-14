# Copyright(c) 2016 Cambridge Semantics Inc. All rights reserved.
# Extract graph and query from concatenated rowsetid

# --------------------------------------------------------
# p_rowsetid
# this script extracts the graph and query from a rowsetid
# --------------------------------------------------------

define p_rowsetid
  set $id = $arg0
  set $max_transient_graphs = $arg1
  set $query = $id >> $max_transient_graphs
  set $graph = $id & ((0x1 << $max_transient_graphs)-1)
  printf "id=%d q=%d graph=%d\n",$id,$query,$graph
end

# -------------------------------------------------------
# invoke the functions so that we can run these routines
# in gdb batch mode. namely:
#
#    "gdb -batch -x <this file> sbx <pid>"
#
# -------------------------------------------------------

# p_rowsetid

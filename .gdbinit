# override all security & always open a .gdbinit file 
set auto-load safe-path /

define aso
  file sbx
  attach $arg0
  step
  up
  set XenSpin=0
  next
  next
  finish
end

define axso
  file sbx
  attach $arg0
  step
  up
  set XenSpin=0
  next
  next
  finish
  up
  up
  up
end

define asso
  file sbx
  attach $arg0
  step
  up
  set XenSpin=0
  next
  next
  finish
  up
  up
  up
end

define bp
  if $argc >= 1
    call banner_print("node1",$arg0)
  end
  if  $argc >= 2
    call banner_print("node2",$arg1)
  end
  if  $argc >= 3
    call banner_print("node3",$arg2)
  end
end
document bp
banner_print of node
Usage: bp <node1> [<node2> [<node3>]]
end

define rdesc
  source ~/asd/src/tools/rowdesc.gdb
  dump_rowdesc $arg0
end

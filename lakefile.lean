import Lake
open Lake DSL

package «flt-regular» {
  -- add any package configuration options here
}

require mathlib from git
  "https://github.com/leanprover-community/mathlib4" @ "v4.21.0-rc3"

@[default_target]
lean_lib «FltRegular» {
  -- add any library configuration options here
}

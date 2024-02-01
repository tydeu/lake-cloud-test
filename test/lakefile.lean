import Lake
open Lake DSL

def tag := get_config? tag |>.get!

require cloud_test from git
  "https://github.com/tydeu/lake-cloud-test.git" @ tag

package «test»

lean_lib «Test»

@[default_target]
lean_exe «test» where
  root := `Main

import Lake
open Lake DSL

package cloud_test where
  preferReleaseBuild := true
  precompileModules := true

lean_lib CloudTest

@[default_target]
lean_exe cloud_test where
  root := `Main

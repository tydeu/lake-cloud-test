import Lake
open Lake DSL

package cloud_test where
  precompileModules := true
  preferReleaseBuild := true
  releaseRepo := "https://github.com/tydeu/lake-cloud-test"

lean_lib CloudTest

@[default_target]
lean_exe cloud_test where
  root := `Main

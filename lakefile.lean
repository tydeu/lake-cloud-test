import Lake
open Lake DSL

package cloud_test {
  preferReleaseBuild := true
}

lean_lib CloudTest {
  -- add library configuration options here
}

@[default_target]
lean_exe cloud_test {
  root := `Main
}

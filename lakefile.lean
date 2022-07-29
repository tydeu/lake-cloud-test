import Lake
open Lake DSL

package cloud_test {
  -- add package configuration options here
}

lean_lib CloudTest {
  -- add library configuration options here
}

@[defaultTarget]
lean_exe cloud_test {
  root := `Main
}

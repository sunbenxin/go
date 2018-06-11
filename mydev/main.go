// Package main provides ...
package main

import (
	"fmt"

	"github.com/golang/go/mydev/syntax"
)

func main() {
	if f, err := syntax.ParseFile("./testdata/test.go", nil, nil, syntax.CheckBranches); err != nil {
		fmt.Printf("%v", err)
	} else {
		fmt.Printf("%+v", syntax.String(f.DeclList[0]))
		fmt.Println("")
		pos := f.PkgName.Pos()
		fmt.Printf("%v", pos)
	}
}

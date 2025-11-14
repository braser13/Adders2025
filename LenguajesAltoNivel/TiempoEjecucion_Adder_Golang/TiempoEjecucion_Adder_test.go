package main

import (
	"testing"
)

func BenchmarkAdition(b *testing.B) {
	b.ResetTimer()
	_ = Adition()
}

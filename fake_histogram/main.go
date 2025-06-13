package main

import (
	"bufio"
	"fmt"
	"os"
	"time"
)

func main() {
	writer := bufio.NewWriter(os.Stdout)
	for {
		timestamp := time.Now().UnixNano()
		// Telegraf line protocol
		// Here, we simulate a histogram with count field
		// This will be interpreted as uint64 because there's no decimal point
		fmt.Fprintf(writer, "test_histogram,host=localhost count=100,sum=123.45,bucket_le_0=10,bucket_le_10=30,bucket_le_inf=60 %d\n", timestamp)
		writer.Flush()
		time.Sleep(5 * time.Second)
	}
}

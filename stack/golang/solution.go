package main

import (
	"bufio"
	"crypto/md5"
	"encoding/hex"
	"fmt"
	"os"
	"strings"
)

func main() {
	var fail []string = []string{" "}

	readFile, err := os.Open(os.Args[1])

	if err != nil {
		fmt.Println(err)
	}
	fileScanner := bufio.NewScanner(readFile)
	fileScanner.Split(bufio.ScanLines)

	for fileScanner.Scan() {
		line := strings.Split(fileScanner.Text(), " ")
		data, hash := line[0], line[1]
		info := md5.New()
		check := hex.EncodeToString(info.Sum([]byte(data)))
		if strings.Compare(check, hash) != 0 {
			fmt.Printf("%s %s %s\n", data, check, hash)
			fail = append(fail, fmt.Sprintf("%s %s\n", data, check))
		}
	}

	readFile.Close()

	// fmt.Printf("%v\n", fail)
	// fmt.Println()
}

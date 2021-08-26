package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		w.Write([]byte(fmt.Sprintf("Host: %s\n", r.Host)))
		w.Write([]byte(fmt.Sprintf("Method: %s\n", r.Method)))
		w.Write([]byte(fmt.Sprintf("URL: %s\n", r.URL)))
		w.Write([]byte(fmt.Sprintf("Proto: %s\n", r.Proto)))
		w.Write([]byte(fmt.Sprintf("RemoteAddr: %s\n", r.RemoteAddr)))
		w.Write([]byte(fmt.Sprintf("\n")))
		for key, values := range r.Header {
			for _, value := range values {
				w.Write([]byte(fmt.Sprintf("%s: %s\n", key, value)))
			}
		}
	})
	log.Fatal(http.ListenAndServe(":80", nil))
}

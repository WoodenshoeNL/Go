package main
import (
    "fmt"
    "log"
    "net/http"
    "time"
    "github.com/gorilla/mux"
)
func QueryHandler(w http.ResponseWriter, r *http.Request) {
    // Fetch query parameters as a map
    queryParams := r.URL.Query()
    w.WriteHeader(http.StatusOK)
    fmt.Fprintf(w, "Got parameter id:%s!\n", queryParams["id"][0])
    fmt.Fprintf(w, "Got parameter category:%s!", queryParams["category"][0])
}
func main() {
    // Create a new router
    r := mux.NewRouter()
    // Attach a path with handler
    r.HandleFunc("/articles", QueryHandler)
    r.Queries("id", "category")
    srv := &http.Server{
        Handler: r,
        Addr: ":8000",
        WriteTimeout: 15 * time.Second,
        ReadTimeout: 15 * time.Second,
    }
    log.Fatal(srv.ListenAndServe())
}
